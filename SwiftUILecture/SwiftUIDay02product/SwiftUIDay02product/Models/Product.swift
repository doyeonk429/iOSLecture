//
//  Product.swift
//  SwiftUIDay02product
//
//  Created by 김도연 on 2/11/25.
//

import UIKit

struct Product: Identifiable, Codable {
    var id: UUID = UUID()
    var name: String
    var imageName: String
    var price: Int
    var description: String
    var isFavorite: Bool

    private enum CodingKeys: String, CodingKey {
        case name, imageName, price, description, isFavorite
    }
}
