//
//  RootPresenter.swift
//  Sample
//
//  Created by imranhishaam on 3/07/17.
//Copyright © 2018 imranhishaam. All rights reserved.
//

import Foundation

class RootPresenter: ViewToPresenterProtocol {
    
    var view: PresenterToViewProtocol?;
    var interector: PresentorToInterectorProtocol?;
    var router: PresenterToRouterProtocol?
    
    func handleTableCellSelect(icecream: Icecream) {
        ShoppingCart.sharedCart.icecreams.value.append(icecream)
    }
    
    func showCart() {
        router?.showCart()
    }
}


extension RootPresenter: InterectorToPresenterProtocol {
    
    
}
