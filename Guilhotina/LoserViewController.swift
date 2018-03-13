//
//  LoserViewController.swift
//  Guilhotina
//
//  Created by senac2018 on 13/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import UIKit

class LoserViewController: UIViewController {
    
    @IBOutlet weak var palavraCorretaLbl: UILabel!
    public var palavraCerta: String?
    
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.4070948362, blue: 0.2171087265, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        palavraCorretaLbl.text = palavraCerta!
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Categorias", style: .done, target: self, action: #selector(home))
        
    }
    
    @objc func home() {
        performSegue(withIdentifier: "volta", sender: self)
        
        
    }
}
