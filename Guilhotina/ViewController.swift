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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(_ sender: Any) {
        errou(imgView: lamina)
    }
    
    
    @IBOutlet weak var frenchButton: UIButton!
    @IBOutlet weak var spanishButton: UIButton!
    @IBOutlet weak var englishButton: UIButton!
    
    @IBAction func screenButtons(_ sender: UIButton) {
        var letra : String!
        
        switch sender.tag {
        case 1:
             letra = sender.tag
                for i in 0..<
        case 2:
           
        case 3:
        
        case 4:
        
        case 5:
        
        case 6:
        
        case 7:
        
        case 8:
        
        case 9:
        
        case 10:
        
        case 11:
        
        case 12:
        
        case 13:
        
        case 14:
        
        case 15:
        
        case 16:
        
        case 17:
        
        case 18:
        
        case 19:
        
        case 20:
        
        case 21:
        
        case 22:
            
        case 23:
            
        case 24:
            
        case 25:
            
        case 26:

        default:
            break
            
        }
        
    }
    
    
}

