//
//  Product.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

struct Product {
    var id:String
    var name:String
    var price:Double
    var category:Category
    var description:String
    var stockQuantity: Int
    
    enum Category {
        case electronics
        case books
        case clothing
        case food
    }
    // Отформатированная цена для отображения (например, "$19.99")
    var displayPrice:String {
        return "$" + String(format: "%.2f", price)
    }
    // Failable init: вернёт nil, если данные некорректны (цена ≤ 0 или отрицательный сток)
    init?(id: String, name: String, price: Double, category: Category, description: String, stockQuantity: Int){
        guard price > 0, stockQuantity >= 0 else { return nil }
        self.id = id
        self.name = name
        self.price = price
        self.category = category
        self.description = description
        self.stockQuantity = stockQuantity

    }
}
