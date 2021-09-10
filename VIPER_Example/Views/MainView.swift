//
//  MainView.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import UIKit

class MainView: UIViewController, ViewProtocol {
    var presenter: PresenterProtocol?
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set sliders to max value for default white background
        redSlider.value = 255
        greenSlider.value = 255
        blueSlider.value = 255
    
    }
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let presenter = presenter as! MainPresenter
        presenter.generateColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value))
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
