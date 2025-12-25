//
//  CartModel.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 24.12.2025.
//

import Foundation

struct CartModel: Codable {
    var items: [CartItemModel]
    var totalPrice: Double
}
