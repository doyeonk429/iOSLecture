//
//  LockedView.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import SwiftUI

struct LockedView: View {
    @ObservedObject var authVM: BiometricAuthVM

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "lock.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 60, height: 60)
                .foregroundStyle(.gray)
            
            Text("Face ID or Touch ID가 필요합니다.")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding()
            
            Button {
                authVM.authenticate()
            } label: {
                Text("인증하기")
                    .font(.title3)
                    .foregroundStyle(.white)
                    .padding()
                    .frame(width: 180, height: 50)
                    .background(.blue)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
            }
        }
    }
}

#Preview {
    LockedView(authVM: BiometricAuthVM())
}
