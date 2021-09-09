//
//  VIPER.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation
import UIKit

protocol ViewProtocol {
    var presenter: PresenterProtocol? {get set}
}

protocol InteractorProtocol {
    var presenter: PresenterProtocol? {get set}
    var entity: EntityProtocol? {get set}
}

protocol PresenterProtocol {
    var view: ViewProtocol? {get set}
    var interactor: InteractorProtocol? {get set}
    var router: RouterProtocol? {get set}
}

protocol EntityProtocol {
    var interactor: InteractorProtocol? {get set}
}

protocol RouterProtocol {
    static func start() -> RouterProtocol
    
    var view: ViewProtocol? {get set}
    var presenter: PresenterProtocol? {get set}
}
