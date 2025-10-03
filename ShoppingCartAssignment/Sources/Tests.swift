//
//  Tests.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

import Foundation

func runScenarios() {
    // 1) Продукты
    guard
        let laptop = Product(id: "1", name: "MacBook Pro", price: 1999.99, category: .electronics, description: "Apple laptop", stockQuantity: 5),
        let book = Product(id: "2", name: "Swift Programming", price: 39.99, category: .books, description: "Learn Swift", stockQuantity: 10),
        let headphones = Product(id: "3", name: "AirPods", price: 199.99, category: .electronics, description: "Wireless earbuds", stockQuantity: 8)
    else {
        print("❌ Product init failed")
        return
    }

    // 2) Корзина
    let cart = ShoppingCart()
    _ = cart.addItem(product: laptop, quantity: 1)
    _ = cart.addItem(product: book, quantity: 2)

    // 3) Повторное добавление того же товара
    _ = cart.addItem(product: laptop, quantity: 1) // теперь 2 макбука

    print("Subtotal:", cart.subtotal)
    print("Item count:", cart.itemCount)

    // 4) Скидка
    cart.discountCode = "SAVE10"
    print("Discount:", cart.discountAmount)
    print("Total with discount:", cart.total)

    // 5) Удаление
    cart.removeItem(productId: book.id)
    print("After removing book, item count:", cart.itemCount)

    // 6) Сема́нтика ссылок (class)
    func modifyCart(_ cart: ShoppingCart) {
        _ = cart.addItem(product: headphones, quantity: 1) }
    modifyCart(cart)
    print("After external modify, item count:", cart.itemCount)

    // 7) Сема́нтика значений (struct)
    if let item1 = CartItem(product: laptop, quantity: 1) {
        var item2 = item1
        item2.updateQuantity(5)
        print("Value semantics -> item1:", item1.quantity, "item2:", item2.quantity)
    }

    // 8) Заказ (snapshot)
    let address = Address(street: "Abay st. 10", city: "Almaty", zipCode: "050000", country: "Kazakhstan")
    let order = Order(from: cart, shippingAddress: address)
    print("Order itemCount:", order.itemCount)
    print("Order total:", order.total)
    print("Order address:\n\(order.shippingAddress.formattedAddress)")

    // 9) Очистка корзины — заказ остаётся неизменным
    cart.clearCart()
    print("Cart items after clear:", cart.itemCount)
    print("Order snapshot itemCount:", order.itemCount)
}
