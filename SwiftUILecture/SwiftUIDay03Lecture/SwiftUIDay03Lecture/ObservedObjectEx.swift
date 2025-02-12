//
//  ObservedObjectEx.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

class CntClass : ObservableObject {
    @Published var count : Int
    
    init(count: Int = 0) {
        self.count = count
    }
}

struct ObservedObjectEx: View {
    @ObservedObject var cntObj: CntClass = CntClass()
    
    var body: some View {
        VStack(spacing: 16) {
            Text("ObservedObjectEx View")
                .font(.title)
            Text("카운트 : \(cntObj.count)")
                .font(.body)
            
            HStack(spacing: 16) {
                Button {
                    print("증가 버튼 Clicked")
                    cntObj.count += 1
                } label: {
                    Text("증가 버튼")
                        .foregroundStyle(.green)
                }
                
                Button {
                    print("감소 버튼 Clicked")
                    cntObj.count -= 1
                } label: {
                    Text("감소 버튼")
                        .foregroundStyle(.red)
                }
            }
            
        }
    }
}

#Preview {
    ObservedObjectEx()
}
