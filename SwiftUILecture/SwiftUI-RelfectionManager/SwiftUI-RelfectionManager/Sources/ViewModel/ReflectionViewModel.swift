//
//  ReflectionViewModel.swift
//  SwiftUI-RelfectionManager
//
//  Created by 김도연 on 2/14/25.
//

import Foundation

class ReflectionViewModel: ObservableObject {
    @Published var reflections: [Reflection] = []
    private let userDefaultsKey = Constants.UserDefaultsKey.reflectionVMKey
    
    func saveReflections() -> Bool {
        if let encodedData = try? JSONEncoder().encode(reflections) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            return true
        }
        return false
    }
    
    func fetchReflections() {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
           let decodedData = try? JSONDecoder().decode([Reflection].self, from: savedData) {
            reflections = decodedData
        }
    }
    
}
