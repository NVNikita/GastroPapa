//
//  MenuCategoryModel.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 25.12.2025.
//

import Foundation

struct MenuCategoryModel: Decodable {
    let id: Int
    let name: String
    let dishes: [MenuItemModel]
}
