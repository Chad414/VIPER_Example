//
//  mainRouter.swift
//  VIPER_Example
//
//  Created by Chad Hamdan on 9/9/21.
//

import Foundation

class MainRouter: RouterProtocol {
    var view: ViewProtocol?
    var presenter: PresenterProtocol?
    
    static func start() -> RouterProtocol {
        let router = MainRouter()
        
        // Initialize module objects
        var view: ViewProtocol = MainView()
        var interactor: InteractorProtocol = MainInteractor()
        var presenter: PresenterProtocol = MainPresenter()
        var entity: EntityProtocol = MainEntity()
        
        // Assign module references
        view.presenter = presenter
        
        interactor.presenter = presenter
        interactor.entity = entity

        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        
        entity.interactor = interactor
        
        router.view = view
        router.presenter = presenter
        
        return router
    }
}
