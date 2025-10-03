//
//  CartItem.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

struct CartItem {
    var product:Product
    var quantity:Int
    
    // Failable init: не создаст объект, если quantity <= 0
    init?(product: Product, quantity: Int) {
        guard quantity > 0 else {
            return nil
        }
        self.product = product
        self.quantity = quantity
    }
    var subtotal:Double {
        return Double(quantity)*product.price
    }
    mutating func updateQuantity(_ newQuantity: Int){
        if newQuantity > 0 {
            quantity = newQuantity
        }
    }
    mutating func increaseQuantity(by amount: Int){
        if amount > 0 {
            quantity += amount
        }
        
    }
}
