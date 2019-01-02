//
//  Endpoint.swift
//  Weather Data with View Model
//
//  Created by Dhawal Mahajan on 18/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
protocol Endpoint {
    var baseUrl: String { get }
    var path: String { get }
    var queryItems: [URLQueryItem] { get }
}
extension Endpoint {
    var urlComponenet: URLComponents {
        var component = URLComponents(string: baseUrl)
        component!.path = path
        component!.queryItems = queryItems
        print(component!)
        return component!
    }
    var request: URLRequest {
        return URLRequest(url: urlComponenet.url!)
    }
}

enum WeatherEndpoint: Endpoint {
//    case tenDayForecast(city: String)
    case tenDayForecast(city: String)
    
    var baseUrl: String {
        return "https://api.apixu.com"
    }
    
    var path: String {
        return "/v1/forecast.json"
    }
    
    var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: "key", value: "76e51ae6c8df4de7a8481646181812"),
            URLQueryItem(name: "q", value: "\(WeatherEndpoint.tenDayForecast(city: "Mumbai"))"),
            URLQueryItem(name: "days", value: "10")
        ]
    }
}


//        switch self {
////                    case .tenDayForecast(let city):
////        case .tenDayForecast(let city):
////            return "/v1/forecast.json?key=76e51ae6c8df4de7a8481646181812&q=\(city)&days=10"
////              return "/v1/forecast.json?key=\(key)&q=\(city)&days=10"
//        }
