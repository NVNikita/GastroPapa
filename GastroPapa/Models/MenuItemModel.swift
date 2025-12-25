//
//  MenuItemModel.swift
//  GastroPapa
//
//  Created by Никита Нагорный on 17.12.2025.
//

import UIKit

struct MenuItemModel: Decodable {
    let id: Int
    let name: String
    let description: String
    let price: Double
    let imageName: String
    
    var image: UIImage? {
        return UIImage(named: imageName)
    }
    
    private enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case price
        case imageName = "image_url"
    }
}
