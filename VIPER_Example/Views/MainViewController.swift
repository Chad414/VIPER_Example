//
//  MainView.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import UIKit

class MainView: UIViewController, ViewProtocol {
    var presenter: PresenterProtocol?

    @IBOutlet weak var redSlider: ColorSlider!
    @IBOutlet weak var greenSlider: ColorSlider!
    @IBOutlet weak var blueSlider: ColorSlider!
    @IBOutlet weak var weatherView: WeatherView!
    
    var location: String = "Detroit" {
        didSet {
            let presenter = self.presenter as! MainPresenter
            presenter.requestWeatherUpdate(location: self.location)
        }
    }
    
    convenience init() {
        self.init(nibName: "MainViewController", bundle: nil)
    }

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        redSlider.delegate = self
        greenSlider.delegate = self
        blueSlider.delegate = self
        weatherView.delegate = self
        
        redSlider.slider.value = 255
        greenSlider.slider.value = 255
        blueSlider.slider.value = 255
        
        redSlider.label.text = "Red: 255"
        greenSlider.label.text = "Green: 255"
        blueSlider.label.text = "Blue: 255"
        
        location = "Detroit"
    }
    
    func promptForLocation() {
        let ac = UIAlertController(title: "Enter new location", message: nil, preferredStyle: .alert)
        ac.addTextField()

        let submitAction = UIAlertAction(title: "Submit", style: .default) { [unowned ac] _ in
            self.location = ac.textFields![0].text!
            
        }

        ac.addAction(submitAction)

        present(ac, animated: true)
    }
    
    func errorChangingLocation() {
        let ac = UIAlertController(title: "Error changing location", message: "Location not found, please try again", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Close", style: .cancel, handler: nil))

        present(ac, animated: true)
    }

}

extension MainView: ColorSliderDelegate {
    func onSliderValueChanged(_ slider: ColorSlider) {
        if slider == redSlider {
            redSlider.label.text = "Red: \(redSlider.slider.value)"
        } else if slider == greenSlider {
            greenSlider.label.text = "Green: \(greenSlider.slider.value)"
        } else if slider == blueSlider {
            blueSlider.label.text = "Blue: \(blueSlider.slider.value)"
        }
        
        let presenter = self.presenter as! MainPresenter
        presenter.changeViewBackground(red: CGFloat(redSlider.slider.value), green: CGFloat(greenSlider.slider.value), blue: CGFloat(blueSlider .slider.value))
    }
}

extension MainView: WeatherViewDelegate {
    func onLocationButtonPressed(_ view: WeatherView) {
        let presenter = self.presenter as! MainPresenter
        
        presenter.userWantsToChangeLocation()
    }

}
