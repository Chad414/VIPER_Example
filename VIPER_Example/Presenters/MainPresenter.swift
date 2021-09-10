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
}
