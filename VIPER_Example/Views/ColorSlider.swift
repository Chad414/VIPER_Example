//
//  ColorSlider.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/10/21.
//

import Foundation
import UIKit

protocol ColorSliderDelegate {
    func onSliderValueChanged(_ slider: ColorSlider)
}

class ColorSlider: UIView {
    var slider: UISlider!
    var label: UILabel!
    
    var delegate: ColorSliderDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        
    }
    
    func commonInit() {
        let contentsView = Bundle.main.loadNibNamed("ColorSlider", owner: self, options: nil)?.first as! UIView
        
        contentsView.frame = self.bounds
        
        contentsView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        
        addSubview(contentsView)
        slider = viewWithTag(1) as? UISlider
        label = viewWithTag(2) as? UILabel
        
        slider?.addTarget(self, action: #selector(sliderValueChanged), for: .valueChanged)
    }
    
    @objc func sliderValueChanged() {
        delegate?.onSliderValueChanged(self)
    }
    
}
