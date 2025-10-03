//
//  ShoppingCart.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

class ShoppingCart{
    // Публично читается, изменяется только методами корзины (инкапсуляция)
    private(set) var items: [CartItem] = []
    var discountCode:String?
    var discountType:DiscountType?
    
    enum DiscountType{
        case percentage(Double)
        case fixedAmount(Double)
        case buyXGetY(buy:Int,get:Int)
    }
    
    init() {}
    
    func addItem(product: Product, quantity: Int = 1) -> Bool {
        guard quantity > 0 else { return false }
        // опциональная проверка склада — читаем, но НЕ уменьшаем:
        guard product.stockQuantity >= quantity else { return false }
        // Если товар уже в корзине — увеличиваем количество
        if let i = items.firstIndex(where: { $0.product.id == product.id }) {
            items[i].increaseQuantity(by: quantity)
            // Иначе создаём новую позицию
        } else if let newItem = CartItem(product: product, quantity: quantity) {
            items.append(newItem)
        }
        return true
    }

    func removeItem(productId: String){
        items.removeAll { $0.product.id==productId }
    }
    func updateItemQuantity(productId: String, quantity: Int){
        if let index = items.firstIndex(where:{$0.product.id==productId}){
            if quantity > 0{
                items[index].updateQuantity(quantity)
            }else{
                items.remove(at: index)
            }
        }
    }
    func clearCart(){
        items.removeAll()
        
    }
    // Сумма без скидок
    var subtotal:Double{
        return items.reduce(0) { $0 + $1.subtotal }
    }
    // Сумма скидки (сначала учитываем DiscountType, иначе — скидочный код)
    var discountAmount: Double {
        // 1) приоритет — продвинутая система DiscountType
        if let d = discountType {
            switch d {
            case .percentage(let percent):
                return subtotal * (percent / 100)
            case .fixedAmount(let amount):
                return min(amount, subtotal)
            case .buyXGetY(let buy, let get):
                let sets = itemCount / (buy + get)
                let freeItems = sets * get
                let cheapest = items.map { $0.product.price }.min() ?? 0
                return Double(freeItems) * cheapest
            }
        }
        // 2) fallback — кодовые скидки
        switch discountCode {
        case "SAVE10": return subtotal * 0.10
        case "SAVE20": return subtotal * 0.20
        default: return 0
        }
    }
    // Итог к оплате
    var total:Double{
        return max(0, subtotal - discountAmount)
    }
    // Общее количество единиц товаров
    var itemCount:Int{
        return items.reduce(0) { $0 + $1.quantity }
    }
    var isEmpty:Bool{
        return items.isEmpty
    }
}
