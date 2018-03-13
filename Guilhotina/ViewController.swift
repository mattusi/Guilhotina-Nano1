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
    @IBOutlet weak var wrongLettersLbl: UILabel!
    @IBOutlet weak var respostaLbl: UILabel!
    
    @IBOutlet weak var lamina: UIImageView!
    
    
    
    var sounds = Sounds()
    var questions = Questions()
    var player = Player(name: "player")
    var currentQA: (question: String, answer: [Character])!
    var categoriaSelecionada: String?
  
    func errou(wrongLetter: Character){
        wrongLettersLbl.text = player.gotWrong(char: wrongLetter)
        
        if player.lifes >= 0 {
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
        currentQA = questions.getQuestion()
        if let categoriaNome = categoriaSelecionada {
            self.title = categoriaNome
            perguntaLbl.text = currentQA.question
            
            for _ in currentQA.answer {
               player.rightAnswers.append("_")
            }
            var string = String(player.rightAnswers)
            string.insert(separator: " ", every: 1)
            respostaLbl.text = string
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

    @IBAction func keyobard(theButton: UIButton) {
        theButton.isEnabled = false
        let buttonText = Character(theButton.titleLabel!.text!)
        var taErrado = true
        for i in 0 ..< currentQA.answer.count {
            if currentQA.answer[i] == buttonText {
                taErrado = false
                player.rightAnswers[i] = buttonText
                var string = String(player.rightAnswers)
                string.insert(separator: " ", every: 1)
                respostaLbl.text = string
            }
        }
        if taErrado {
            errou(wrongLetter: buttonText)
        }
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

