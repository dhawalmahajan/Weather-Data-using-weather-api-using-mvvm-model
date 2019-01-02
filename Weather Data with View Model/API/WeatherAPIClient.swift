//
//  WeatherAPIClient.swift
//  Weather Data with View Model
//
//  Created by Dhawal Mahajan on 18/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
class WeatherAPIClient: APIClient {
    var session: URLSession
    init(session: URLSession = URLSession.shared) {
        self.session = session
    }
    
    func weather(with endPoint: WeatherEndpoint, completion: @escaping (Either<Weather,APIError>) -> Void) {
        let request = endPoint.request
        self.fetch(with: request) { (either: Either<Weather,APIError>) in
            switch either {
            case .value(let weather):
                completion(.value(weather))
            case .error(let error):
                completion(.error(error))
            }
        }
    }
}
