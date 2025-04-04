//
//  AuthViewModel.swift
//  toto-combine
//
//  Created by 김도연 on 4/1/25.
//

import Foundation
import Combine
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?
    @Published var errorMessage: String?
    @Published var showErrorAlert = false
    
    private var authStateListener: AuthStateDidChangeListenerHandle?
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        authStateListener = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            Task { @MainActor in
                self?.user = user
            }
        }
    }

    deinit {
        if let handle = authStateListener {
            Auth.auth().removeStateDidChangeListener(handle)
        }
    }

    func signUp(email: String, password: String) {
        Task {
            do {
                let result = try await Auth.auth().createUser(withEmail: email, password: password)
                await MainActor.run {
                    self.user = result.user
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
            }
        }
    }

    func signIn(email: String, password: String) {
        Task {
            do {
                let result = try await Auth.auth().signIn(withEmail: email, password: password)
                await MainActor.run {
                    self.user = result.user
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
            }
        }
    }

    func signOut() {
        do {
            try Auth.auth().signOut()
            user = nil
        } catch {
            errorMessage = error.localizedDescription
            showErrorAlert = true
        }
    }
    
    func resetPassword() {
        guard let email = user?.email else {
            self.errorMessage = "이메일 정보가 없습니다."
            self.showErrorAlert = true
            return
        }

        Task {
            do {
                try await Auth.auth().sendPasswordReset(withEmail: email)
                await MainActor.run {
                    self.errorMessage = "비밀번호 재설정 메일을 보냈습니다."
                    self.showErrorAlert = true
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
            }
        }
    }
    
    func deleteAccount() {
        guard let user = Auth.auth().currentUser else {
            self.errorMessage = "로그인된 사용자가 없습니다."
            self.showErrorAlert = true
            return
        }

        Task {
            do {
                try await user.delete()
                await MainActor.run {
                    self.user = nil
                    self.errorMessage = "계정이 삭제되었습니다."
                    self.showErrorAlert = true
                }
            } catch {
                await MainActor.run {
                    self.errorMessage = error.localizedDescription
                    self.showErrorAlert = true
                }
            }
        }
    }
}
