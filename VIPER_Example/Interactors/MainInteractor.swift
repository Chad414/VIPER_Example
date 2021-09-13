//
//  MainInteractor.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation

class MainInteractor: InteractorProtocol {
    var presenter: PresenterProtocol?
    var entity: EntityProtocol?
    
    func fetchWeatherData(url: URL) {
        let request = URLRequest(url: url)
        
        let session = URLSession.shared
        session.dataTask(with: request) { (data, response, error) in
            print("Request complete")
            
            if let error = error {
                print("Something went wrong: \(error)")
            } else if let data = data {
                
                do {
                    let weatherData = try JSONDecoder().decode(WeatherEntitiy.self, from: data)
                    let presenter = self.presenter as! MainPresenter
                    
                    presenter.updateWeatherView(data: weatherData)
                } catch let error {
                    print("Error Serializing JSON: \(error)")
                    let presenter = self.presenter as! MainPresenter
                    presenter.sendWeatherError()
                }
                
            } else {
                print("Something went wrong")
            }
        }.resume()
    }
}
