//
//  RootContract.swift
//  Sample
//
//  Created by imranhishaam on 3/07/17.
//Copyright © 2018 imranhishaam. All rights reserved.
//

import UIKit

protocol PresenterToViewProtocol: class{
   
    func showError();
}

protocol InterectorToPresenterProtocol: class{

}

protocol PresentorToInterectorProtocol: class{
    var presenter: InterectorToPresenterProtocol? {get set} ;
    
}

protocol ViewToPresenterProtocol: class{
    var view: PresenterToViewProtocol? {get set};
    var interector: PresentorToInterectorProtocol? {get set};
    var router: PresenterToRouterProtocol? {get set}
    
    func handleTableCellSelect(icecream: Icecream)
    func showCart()
}

protocol PresenterToRouterProtocol: class{
    static func createModule() -> UIViewController;
    func showCart()
}
