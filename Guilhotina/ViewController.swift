//
//  ViewController.swift
//  Guilhotina
//
//  Created by senac2018 on 09/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var topConstrain: NSLayoutConstraint!
    
    @IBOutlet weak var lamina: UIImageView!
    var sounds = Sounds()
    
    var categoriaSelecionada: String?
    func errou(imgView: UIImageView){
        sounds.soundLamina()
        UIView.animate(withDuration: 2, animations:  {
            self.lamina.center.y += 50
        })
     
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main game"
        if let categoriaNome = categoriaSelecionada {
            self.title = categoriaNome
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(_ sender: Any) {
        errou(imgView: lamina)
    }
    
}

