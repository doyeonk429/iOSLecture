//
//  ProductListView.swift
//  SwiftUIDay02product
//
//  Created by 김도연 on 2/11/25.
//

import SwiftUI

struct ProductListView: View {
    let products : [Product]

    var body: some View {
        List(products) { product in
            ProductRow(productName: product.name, price: "₩\(product.price)", imageName: product.imageName)
        }
        .navigationTitle("상품 목록")
    }
}

#Preview {
    ProductListView(products: [Product(name: "헤헤", price: 100, imageName: "apple"), Product(name: "헤헤", price: 100, imageName: "banana")])
}
