//
//  MenuDataService.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 25.12.2025.
//

import UIKit

final class MenuDataService {
    
    func loadMenu() -> [MenuCategoryModel] {
        guard let url = Bundle.main.url(forResource: "menu_data", withExtension: "json") else {
            print("menu_data not found")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            return try parseJson(data: data)
        } catch {
            print("Error data loading \(error)")
            return []
        }
    }
    
    private func parseJson(data: Data) throws -> [MenuCategoryModel] {
        let decoder = JSONDecoder()
        let menuData = try decoder.decode(MenuResponse.self, from: data)
        return menuData.menuCategories
    }
}
