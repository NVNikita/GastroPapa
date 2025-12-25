//
//  CartItem.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 24.12.2025.
//

import Foundation

struct CartItemModel: Codable {
    let menuItemId: Int
    let quantity: Int
    let pricePerItem: Double
}
