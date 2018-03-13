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
    @IBOutlet weak var keyboardPositionConstraint: NSLayoutConstraint!
    @IBOutlet weak var perguntaLbl: UILabel!
    
    @IBOutlet weak var lamina: UIImageView!
    var sounds = Sounds()
    var questions = Questions()
    var player = Player(name: "player")
    
    var categoriaSelecionada: String?
    func errou(){
        
        player.lifes -= 1
        if player.lifes > 0 {
            sounds.soundLamina()
            UIView.animate(withDuration: 2, animations:  {
            self.lamina.center.y += 40
            })
        } else {
            sounds.soundDeath()
            UIView.animate(withDuration: 0.4, animations: {self.lamina.center.y += 100})
            
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main game"
        let currentQA = questions.getQuestion()
        if let categoriaNome = categoriaSelecionada {
            self.title = categoriaNome
            perguntaLbl.text = currentQA.question
            
        }
        if UIDevice().userInterfaceIdiom == .phone {
            switch UIScreen.main.nativeBounds.height {
            case 2436:
                print("iPhone X")
                keyboardPositionConstraint.constant = 50
            default:
                keyboardPositionConstraint.constant = 5
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func test(_ sender: Any) {
        errou()
    }
    
}

