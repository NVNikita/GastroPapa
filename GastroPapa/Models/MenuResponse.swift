//
//  MenuResponse.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 25.12.2025.
//

import Foundation

struct MenuResponse: Decodable {
    let menuCategories: [MenuCategoryModel]
    
    private enum CodingKeys: String, CodingKey {
        case menuCategories = "menu_categories"
    }
}

