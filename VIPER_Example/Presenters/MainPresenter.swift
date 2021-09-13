//
//  Presentor.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation
import UIKit

class MainPresenter: PresenterProtocol {
    var view: ViewProtocol?
    var interactor: InteractorProtocol?
    var router: RouterProtocol?
    
    func changeViewBackground(red: CGFloat, green: CGFloat, blue: CGFloat) {
        let color = UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1.0)
        let viewController = view as! UIViewController
        viewController.view.backgroundColor = color
    }
    
    func userWantsToChangeLocation() {
        let view = self.view as! MainView
        
        view.promptForLocation()
    }
    
    func requestWeatherUpdate(location: String) {
        let interactor = self.interactor as! MainInteractor
        let apiKey = "47e5b267063d9218baba8dd8d1622913"
        
        let url = URL(string: "http://api.openweathermap.org/data/2.5/weather?q=\(location)&appid=\(apiKey)")
        
        interactor.fetchWeatherData(url: url!)
    }
    
    func updateWeatherView(data: WeatherEntitiy) {
        let view = self.view as! MainView
        var temp = data.main["temp"]! - 273.15
        var high = data.main["temp_max"]! - 273.15
        var low = data.main["temp_min"]! - 273.15
        
        temp.round(.down)
        high.round(.down)
        low.round(.down)
        
        DispatchQueue.main.async {
            view.weatherView.locationLabel.text = "Weather in \(data.name)"
            view.weatherView.tempLabel.text = "Temperature: \(String(format: "%g", temp))° C"
            view.weatherView.highlowLabel.text = "High: \(String(format: "%g", high))° C, Low: \(String(format: "%g", low))° C"
            
            view.weatherView.weatherIcon.image = UIImage(named: "cloud.sun")
        }
        
    }
}
