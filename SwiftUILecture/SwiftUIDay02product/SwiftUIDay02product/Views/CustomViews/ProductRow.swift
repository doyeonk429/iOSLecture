//
//  ProductRow.swift
//  SwiftUIDay02product
//
//  Created by 김도연 on 2/11/25.
//

import SwiftUI

struct ProductRow: View {
    var productName: String
    var price: String
    var imageName: String

    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .frame(width: 100, height: 100)
                .clipped()
                .padding(.trailing)
            VStack(alignment: .leading) {
                Text(productName)
                    .font(.headline)
                Text(price)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .padding()
        .background(Color.white)
        .presentationCornerRadius(8)
        .shadow(radius: 3)
    }
}

#Preview {
    ProductRow(productName: "신선한 사과", price: "10000", imageName: "apple")
}
