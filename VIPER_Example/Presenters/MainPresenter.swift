//
//  Presentor.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation

class MainPresenter: PresenterProtocol {
    var view: ViewProtocol?
    var interactor: InteractorProtocol?
    var router: RouterProtocol?
}
