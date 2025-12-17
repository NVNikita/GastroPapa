//
//  OrderModel.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 17.12.2025.
//

import UIKit

struct OrderModel {
    let id: UUID
    let date: Date
    let items: [CartItem]
    let totalPrice: Double
    let adress: String?
    let status: String
    
    struct CartItem: Codable {
        let menuItemId: Int
        let quantity: Int
        let pricePerItem: Double
    }
}
