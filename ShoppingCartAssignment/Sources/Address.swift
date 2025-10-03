//
//  Address.swift
//  ShoppingCartAssignment
//
//  Created by Zhasmin Suleimenova on 02.10.2025.
//

struct Address {
    var street:String
    var city:String
    var zipCode:String
    var country:String
    
    var formattedAddress: String {
        return "\(street)\n\(city), \(zipCode)\n\(country)"
    }

    
}
