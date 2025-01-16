//
//  ModelData.swift
//  Landmarks
//
//  Created by 황준성 on 1/14/25.
//

import Foundation

@Observable
class ModelData {
    //json 파일
    var landmarks: [Landmark] = load("landmarkData.json")
    
    var categories: [String: [Landmark]] {
        Dictionary(
            grouping: landmarks,
            by: { $0.category.rawValue }
        )
    }
    
    var features: [Landmark] {
        landmarks.filter{
            $0.isFeatured
        }
    }
}

//file load
func load<T:Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil) else {
        fatalError("Couldn't find \(filename)")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename): \(error)")
    }
    
    do {
        return try JSONDecoder().decode(T.self, from: data)
    } catch {
        fatalError("Couldn't decode \(filename): \(error)")
    }
    
}
