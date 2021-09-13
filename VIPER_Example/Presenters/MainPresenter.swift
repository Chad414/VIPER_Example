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
        let invertedColor = UIColor(red: 1.0 - red/255, green: 1.0 - green/255, blue: 1.0 - blue/255, alpha: 1.0)
        
        let viewController = view as! UIViewController
        let view = self.view as! MainView
        
        viewController.view.backgroundColor = color
        view.weatherView.locationLabel.textColor = invertedColor
        view.weatherView.tempLabel.textColor = invertedColor
        view.weatherView.highlowLabel.textColor = invertedColor
        view.weatherView.locationButton.tintColor = invertedColor
    }
    
    func userWantsToChangeLocation() {
        let view = self.view as! MainView
        
        view.promptForLocation()
    }
    
    func requestWeatherUpdate(location: String) {
        let interactor = self.interactor as! MainInteractor
        let apiKey = "47e5b267063d9218baba8dd8d1622913"
        
        let urlString = "http://api.openweathermap.org/data/2.5/weather?q=\(location.replacingOccurrences(of: " ", with: "%20"))&appid=\(apiKey)"
        
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url as URL) {
                interactor.fetchWeatherData(url: url as URL)
                return
            }
        }
        
        self.sendWeatherError()
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
    
    func sendWeatherError() {
        DispatchQueue.main.async {
            let view = self.view as! MainView
            view.errorChangingLocation()
        }
    }
}
