//
//  ViewBuilderExample.swift
//  SwiftUIDay03Lecture
//
//  Created by 김도연 on 2/12/25.
//

import SwiftUI

struct ViewBuilderExample: View {
    @ViewBuilder
    func createContent(_ showTitle : Bool) -> some View {
        if showTitle {
            Text("뷰 빌더 테스트")
                .font(.title)
        } else {
            Text("타이틀을 없애보자 : 힝")
                .font(.callout)
        }
        
        Text("항상 표시되는 내용")
            .font(.system(size: 18, weight: .semibold, design: .default))
            .padding(.top)
        
        Text("항상 표시되는 내용2")
            .font(.system(size: 16, weight: .regular, design: .default))
        
        Text("항상 표시되는 내용3")
            .font(.system(size: 14, weight: .regular, design: .default))
            .padding(.bottom)
    }
    
    var body: some View {
        VStack {
            createContent(true)
            createContent(false)
        }
    }
}

#Preview {
    ViewBuilderExample()
}
