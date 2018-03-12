//
//  RootViewController.swift
//  Sample
//
//  Created by imranhishaam on 3/07/17.
//Copyright © 2018 imranhishaam. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class RootViewController: UIViewController {
    
    private var cartButton: UIBarButtonItem!
    @IBOutlet private var tableView: UITableView!
    let allIcecreams = Observable.just(Icecream.ofEurope)
    
    private let disposeBag = DisposeBag()
    
    var presenter: ViewToPresenterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        cartButton = UIBarButtonItem(title: "Add Item", style: .done, target: self, action:  #selector(showCart))
        self.navigationItem.rightBarButtonItem = cartButton
        
        setupCellConfiguration()
        setupCellTapHandling()
        setupCartObserver()
    
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func setupCellConfiguration() {
        //Equivalent of cell for row at index path
        
        allIcecreams.bind(to: tableView.rx.items) { (tableView, row, element) in
            let cell = tableView.dequeueReusableCell(withIdentifier: IcecreamCell.Identifier) as! IcecreamCell
                cell.configureWithIcecream(icecream: element)
                return cell
            }
            .disposed(by: disposeBag)
    
    }
    
    private func setupCellTapHandling() {
        //Equivalent of did select row at index path
        tableView
            .rx
            .modelSelected(Icecream.self)
            .subscribe(onNext: {
                icecream in
                self.presenter?.handleTableCellSelect(icecream: icecream)
                
                if let selectedRowIndexPath = self.tableView.indexPathForSelectedRow {
                    self.tableView.deselectRow(at: selectedRowIndexPath, animated: true)
                }
            })
            .disposed(by: disposeBag)
    }
    
    private func setupCartObserver() {
        ShoppingCart.sharedCart.icecreams.asObservable()
            .subscribe(onNext: {
                icecreams in
                self.cartButton.title = "\(icecreams.count) \u{1f36b}"
            })
            .disposed(by: disposeBag)
    }
    
    @objc private func showCart() {
        self.presenter?.showCart()
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension RootViewController: PresenterToViewProtocol {
    
    func showError() {
        
    }
    
    
   
}
