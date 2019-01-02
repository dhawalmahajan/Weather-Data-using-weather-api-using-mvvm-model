//
//  ViewController.swift
//  Weather Data with View Model
//
//  Created by Dhawal Mahajan on 18/12/18.
//  Copyright © 2018 Dhawal Mahajan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var cellViewModel = [WeatherCellViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let weatherAPI = WeatherAPIClient()
        tableView.tableFooterView = UIView()
        let weatherEndpoint = WeatherEndpoint.tenDayForecast(city: "Mumbai")
        
        weatherAPI.weather(with: weatherEndpoint) { (either) in
            switch either {
            case .value(let forecast):
                self.cellViewModel = forecast.forecast.forecastday.map {
                    WeatherCellViewModel(url: $0.day.condition.icon, text: $0.date, day: $0.day.condition.text)
                }
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
                
            case.error(let error):
                print(error)
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let singleCellViewModel = cellViewModel[indexPath.row]
        cell.textLabel?.text = singleCellViewModel.day
        cell.detailTextLabel?.text = singleCellViewModel.text
        singleCellViewModel.loadImage { (image) in
            cell.imageView?.image = image
        }
        return cell
    }
}

