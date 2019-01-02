//
//  Weather.swift
//  Weather Data with View Modelx
//
//  Created by Dhawal Mahajan on 18/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
struct Weather: Codable {
    let forecast: Forecast
}
struct Forecast: Codable {
    let forecastday: [Forecastday]
}
struct Forecastday: Codable {
    let date: String
    let day: Day
}
struct Day: Codable {
    let condition: Condition
}
struct Condition: Codable {
    let text: String
    let icon: String
}
