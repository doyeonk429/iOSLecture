//
//  SheetBasic.swift
//  SwiftUIDay01Ex03
//
//  Created by 김도연 on 2/10/25.
//

import SwiftUI

struct SheetBasic: View {
    //MARK: - property
    @State var showSheet: Bool = false
    
    var body: some View {
        ZStack {
            // background
            Color.green.ignoresSafeArea()
            
            // content
            Button {
                showSheet.toggle()
            } label: {
                Text("button")
                    .foregroundStyle(.green)
                    .font(.headline)
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
            }
//            .sheet(isPresented: $showSheet) {
//                SheetBasic2()
//            }
            .fullScreenCover(isPresented: $showSheet) {
                SheetBasic2()
            }

        }
    }
}

#Preview {
    SheetBasic()
}
