//
//  mainView.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation
import UIKit

class MainView: UIViewController, ViewProtocol {
    var presenter: PresenterProtocol?
    
    private let label: UILabel = {
        let label = UILabel(frame: CGRect(x: 10, y: 50, width: 230, height: 21))
        label.text = "Hello World!"
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        view.addSubview(label)
        label.center = view.center
        label.textAlignment = .center
    }
}
