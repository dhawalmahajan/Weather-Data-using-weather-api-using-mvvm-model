//
//  WeatherCellViewModel.swift
//  Weather Data with View Model
//
//  Created by Dhawal Mahajan on 28/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import Foundation
import UIKit
struct WeatherCellViewModel {
    let url: String
    let text: String
    let day: String
    
    func loadImage(completion: @escaping(UIImage?) -> Void) {
        
        guard let url = URL(string:"https:" + url) else { return }
        guard let imagedata = try? Data(contentsOf: url) else { return }
        let image = UIImage(data: imagedata)
        DispatchQueue.main.async {
            if let image = image {
                completion(image)
            }
        }
    }
    
}
