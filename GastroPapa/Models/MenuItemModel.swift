//
//  MenuItemModel.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 17.12.2025.
//

import UIKit

struct MenuItemModel {
    let id: Int
    let name: String
    let description: String
    let imageName: String
    let price: Double
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
}
