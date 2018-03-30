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
    
    //haptic feedback
    let notification = UINotificationFeedbackGenerator()
    func errou(wrongLetter: Character){
        wrongLettersLbl.text = player.gotWrong(char: wrongLetter)
        notification.prepare()
        if player.lifes >= 0 {
            //errou uma letra
            sounds.soundLamina()
            //haptic feedback
            notification.notificationOccurred(.error)
            //lamina animation
            UIView.animate(withDuration: 2, animations:  {
                self.lamina.center.y += 40
                
            })
        
        } else {
            sounds.soundDeath()
            UIView.animate(withDuration: 0.4, animations: {self.lamina.center.y += 100})
            //chamar tela de morte
            let loserVC = storyboard?.instantiateViewController(withIdentifier: "loser") as! LoserViewController
            let passarCategoria = String(currentQA.answer)
            loserVC.palavraCerta = passarCategoria
            self.navigationController?.pushViewController(loserVC, animated: true)
                
            
        }
    }
    override func loadView() {
        super.loadView()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4571455717, green: 0.6585432887, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor : UIColor.white]
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Main game"
        currentQA = questions.getQuestion()
        if let categoriaNome = categoriaSelecionada {
            self.title = categoriaNome
            
            //self.navigationController?.navigationBar.isTranslucent = false
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
                case 1920, 2208:
                    keyboardPositionConstraint.constant = 60
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
        if respostaLbl.text?.range(of: "_") == nil {
            //chama a tela de vencedor
            let winnerVC = storyboard?.instantiateViewController(withIdentifier: "winner") as! WinnerViewController
            
            self.navigationController?.pushViewController(winnerVC, animated: true)
        }
        if taErrado {
            errou(wrongLetter: buttonText)
        } else {
            notification.notificationOccurred(.success)
        }
    }
    
}

