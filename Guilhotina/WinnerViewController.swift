//
//  WinnerViewController.swift
//  Guilhotina
//
//  Created by senac2018 on 13/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import UIKit

class WinnerViewController: UIViewController {
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4571455717, green: 0.6585432887, blue: 1, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Categorias", style: .done, target: self, action: #selector(home))
        
    }
    
    @objc func home() {
        performSegue(withIdentifier: "volta", sender: self)
        
        
    }
}
