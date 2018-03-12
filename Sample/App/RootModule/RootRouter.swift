//
//  RootRouter.swift
//  Sample
//
//  Created by imranhishaam on 3/07/17.
//Copyright © 2018 imranhishaam. All rights reserved.
//

import UIKit

class RootRouter: PresenterToRouterProtocol {
    
    static weak var viewController: UIViewController?
    static var navigationController: UINavigationController?
    
    static func createModule() -> UIViewController {
        
        let view = UIStoryboard(name:"Main",bundle: Bundle.main).instantiateViewController(withIdentifier: "RootViewController") as? RootViewController;
        let presenter: ViewToPresenterProtocol & InterectorToPresenterProtocol = RootPresenter();
        let interactor: PresentorToInterectorProtocol = RootInteractor();
        let router: PresenterToRouterProtocol = RootRouter();
        
        view?.presenter = presenter;
        presenter.view = view;
        presenter.router = router;
        presenter.interector = interactor;
        interactor.presenter = presenter;
        
        viewController = view
        
        navigationController = UINavigationController(rootViewController: view!)
        
        return navigationController!
    }
    
    func showCart() {
        
    }
}
