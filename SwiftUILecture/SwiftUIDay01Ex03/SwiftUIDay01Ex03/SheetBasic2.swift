//
//  SheetBasic2.swift
//  SwiftUIDay01Ex03
//
//  Created by 김도연 on 2/10/25.
//

import SwiftUI

struct SheetBasic2: View {
    // property
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // bg color
            Color.red.ignoresSafeArea()
            
            // content
            Button {
                presentationMode.wrappedValue.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .foregroundStyle(.white)
                    .font(.largeTitle)
                    .padding()
            }

        }
    }
}

#Preview {
    SheetBasic2()
}
