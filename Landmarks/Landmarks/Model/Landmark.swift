//
//  Landmarks.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import Foundation
import SwiftUI
import CoreLocation

//Identifier 타입을 따르고 있어야 리스트에 주입하기 용이함.
struct Landmark: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var park: String
    var state: String
    var isFavorite: Bool
    var isFeatured: Bool
    
    
    var category: Category
    enum Category : String, CaseIterable, Codable {
        case lakes = "Lakes"
        case rivers = "Rivers"
        case mountains = "Mountains"
    }
    
    
    //구조체 내부에 SwiftUI이미지
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    
    //좌표
    private var coordinates: Coordinates
    
    var location: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
    }
    
    struct Coordinates: Hashable,Codable {
        var latitude: Double
        var longitude: Double
    }
    
}
