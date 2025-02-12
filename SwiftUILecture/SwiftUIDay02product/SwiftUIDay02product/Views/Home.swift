//
//  Home.swift
//  SwiftUIDay02product
//
//  Created by 김도연 on 2/11/25.
//

import SwiftUI

struct Home: View {
    var body: some View {
        let product = [Product(name: "헤헤", price: 100, imageName: "apple")]
        NavigationView {
            ProductListView(products: product)
                .navigationTitle("과일마트")
        }
    }
}

#Preview {
    Home()
}
