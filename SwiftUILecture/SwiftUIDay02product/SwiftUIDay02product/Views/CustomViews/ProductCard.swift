//
//  ProductCard.swift
//  SwiftUIDay02product
//
//  Created by 김도연 on 2/11/25.
//

import SwiftUI

struct ProductCard: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("apple")
                .resizable()
                .frame(height: 150)
                .clipped()
            Text("Apple")
                .font(.headline)
            Text("100,000원")
                .font(.subheadline)
                .foregroundStyle(.gray)
        }
        .padding()
        .background(.white)
        .presentationCornerRadius(10)
        .shadow(radius: 5)
    }
}

#Preview {
    ProductCard()
}
