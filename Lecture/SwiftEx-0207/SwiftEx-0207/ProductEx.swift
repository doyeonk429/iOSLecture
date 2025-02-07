//
//  ProductEx.swift
//  SwiftEx-0207
//
//  Created by 김도연 on 2/7/25.
//

import Foundation

class Product {
    func displayInfo() {
        
    }
}

class Car : Product {
    var brand: String
    var model: String

    init(brand: String, model: String) {
        self.brand = brand
        self.model = model
    }

        // 브랜드와 모델을 출력
    override func displayInfo() {
        print("\(brand) \(model)")
    }
}

class Book : Product {
   var title: String
   var author: String
    
    init(title: String, author: String) {
        self.title = title
        self.author = author
    }

       // 제목과 저자를 출력
    override func displayInfo() {
       print("\(title) by \(author)")
   }
}

func productTest() {
    var products : [Product] = []
    
    products.append(addNewProduct(isCar: true))
    products.append(addNewProduct(isCar: false))
    
    for product in products {
        product.displayInfo()
    }
}

func addNewProduct(isCar : Bool) -> Product {
    return isCar ? Car(brand: "b1", model: "m1") : Book(title: "t1", author: "a1")
}
