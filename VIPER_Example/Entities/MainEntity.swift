//
//  MainEntity.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation

struct WeatherEntitiy: Decodable {
    // We must use these structs instead of dictionaries because of type differences
    // Maybe there's a better way?
    struct Weather: Decodable {
        let id: Int
        let main: String
        let description: String
        let icon: String
    }
    
    struct Sys: Decodable {
        let type: Int
        let id: Int
        let country: String
        let sunrise: Int
        let sunset: Int
    }
    
    let coord: [String : Float]
    let weather: [Weather]
    let base: String
    let main: [String : Float]
    let visibility: Int
    let wind: [String : Float]
    let clouds: [String : Int]
    let dt: Int
    let sys: Sys
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

// How do we make this decodable?
class MainEntity: EntityProtocol {
    var interactor: InteractorProtocol?
    
    
}
