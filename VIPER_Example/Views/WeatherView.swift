//
//  WeatherView.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/13/21.
//

import UIKit

protocol WeatherViewDelegate {
    func onLocationButtonPressed(_ view: WeatherView)
}

class WeatherView: UIView {
    var locationLabel: UILabel!
    var tempLabel: UILabel!
    var highlowLabel: UILabel!
    var locationButton: UIButton!
    var weatherIcon: UIImageView!
    
    var delegate: WeatherViewDelegate?

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    func commonInit() {
        let contentsView = Bundle.main.loadNibNamed("WeatherView", owner: self, options: nil)?.first as! UIView
        
        contentsView.frame = self.bounds
        
        contentsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentsView)
        
        locationLabel = viewWithTag(1) as? UILabel
        tempLabel = viewWithTag(2) as? UILabel
        highlowLabel = viewWithTag(3) as? UILabel
        locationButton = viewWithTag(4) as? UIButton
        weatherIcon = viewWithTag(5) as? UIImageView

        locationButton?.addTarget(self, action: #selector(locationButtonPressed), for: .touchUpInside)
    }
    
    @objc func locationButtonPressed() {
        delegate?.onLocationButtonPressed(self)
    }
}
