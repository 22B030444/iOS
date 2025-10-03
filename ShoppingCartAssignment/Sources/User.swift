//
//  User.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

class User {
    let userId: String
    let name: String
    let email: String
    private(set) var orderHistory: [Order] = []
    
    init(userId: String, name: String, email: String) {
        self.userId = userId
        self.name = name
        self.email = email
    }
    
    // Добавляем заказ в историю
    func placeOrder(_ order: Order) {
        orderHistory.append(order)
    }
    
    // Общая сумма всех заказов
    var totalSpent: Double {
        orderHistory.reduce(0) { $0 + $1.total }
    }
}
