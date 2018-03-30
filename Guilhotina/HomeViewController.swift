//
//  HomeViewController.swift
//  Guilhotina
//
//  Created by Matheus Tusi on 10/03/18.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    var questions = Questions()
    var timer: Timer?
    var isItLeft = true
    
    @IBOutlet weak var playBtn: UIButton!
    @IBOutlet weak var clouds: UIImageView!
    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var categoriaPickerView: UIPickerView!
    
    var pickerData: [String] = []
    var categoriaSelecionada: String?
    
    //dynamic alert
    var overlayView: UIView!
    var alertView: UIView!
    var animator: UIDynamicAnimator!
    var attachmentBehavior: UIAttachmentBehavior!
    var snapBehavior: UISnapBehavior!
    
    @IBAction func unwindToVC1(segue: UIStoryboardSegue) {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4571455717, green: 0.6585432887, blue: 1, alpha: 1)
        self.navigationController?.navigationBar.tintColor = .white
    }
    
    
    override func loadView() {
        super.loadView()
        animator = UIDynamicAnimator(referenceView: view)
        //create alert stuff
        createOverlay()
        createAlert()
    }
    
    //create overlay
    func createOverlay() {
        overlayView = UIView(frame: view.bounds)
        overlayView.backgroundColor = #colorLiteral(red: 0.4571455717, green: 0.6585432887, blue: 1, alpha: 1)
        overlayView.alpha = 0.0
        view.addSubview(overlayView)
    }
    
    func createAlert() {
        // Here the red alert view is created. It is created with rounded corners and given a shadow around it
        let alertWidth: CGFloat = 310
        let alertHeight: CGFloat = 300
        let alertViewFrame: CGRect = CGRect(x: 0, y: 0, width: alertWidth, height: alertHeight)
        alertView = UIView(frame: alertViewFrame)
        alertView.backgroundColor = UIColor(white: 1, alpha: 0)
        alertView.alpha = 0.0
        alertView.layer.cornerRadius = 10;
        alertView.layer.shadowColor = UIColor.black.cgColor;
        alertView.layer.shadowOffset = CGSize(width: 0, height: 5)
        alertView.layer.shadowOpacity = 0.3;
        alertView.layer.shadowRadius = 10.0;
        //image
        let imageView = UIImageView(frame: alertViewFrame)
        imageView.image = #imageLiteral(resourceName: "placa-sem-pes")
        imageView.contentMode = .scaleAspectFit
        alertView.addSubview(imageView)
        //label
        let label = UILabel(frame: CGRect(x: 0, y: (alertHeight/2) - 60 , width: alertWidth, height: 100))
        label.text = "Por favor selecione uma categoria"
        label.textAlignment = .center
        label.textColor = UIColor.white
        label.numberOfLines = 3
        label.font = label.font.withSize(30)
        alertView.addSubview(label)
        // Create a button and set a listener on it for when it is tapped. Then the button is added to the alert view
        let button = UIButton(type: UIButtonType.system) as UIButton
        button.setTitle("Fechar", for: UIControlState.normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 25)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.6449871208, green: 0.4024748754, blue: 0.2158198369, alpha: 1)
        button.frame = CGRect(x: 0, y: alertHeight - 80, width: 100, height: 40.0)
        button.center.x = alertView.center.x
        button.addTarget(self, action: #selector(dismissAlert), for: UIControlEvents.touchUpInside)
        
        alertView.addSubview(button)
        view.addSubview(alertView)
    }
    
    func showAlert() {
        // When the alert view is dismissed, I destroy it, so I check for this condition here
        // since if the Show Alert button is tapped again after dismissing, alertView will be nil
        // and so should be created again
        if (alertView == nil) {
            createAlert()
        }
        
        // I create the pan gesture recognizer here and not in ViewDidLoad() to
        // prevent the user moving the alert view on the screen before it is shown.
        // Remember, on load, the alert view is created but invisible to user, so you
        // don't want the user moving it around when they swipe or drag on the screen.
        createGestureRecognizer()
        
        animator.removeAllBehaviors()
        
        // Animate in the overlay
        UIView.animate(withDuration: 0.4) {
            self.overlayView.alpha = 0.5
        }
        
        // Animate the alert view using UIKit Dynamics.
        alertView.alpha = 1.0
        
        let snapBehaviour: UISnapBehavior = UISnapBehavior(item: alertView, snapTo: view.center)
        animator.addBehavior(snapBehaviour)
    }
    
    @objc func dismissAlert() {
        
        animator.removeAllBehaviors()
        
        let gravityBehaviour: UIGravityBehavior = UIGravityBehavior(items: [alertView])
        gravityBehaviour.gravityDirection = CGVector(dx: 0, dy: 10)
        animator.addBehavior(gravityBehaviour)
        
        // This behaviour is included so that the alert view tilts when it falls, otherwise it will go straight down
        let itemBehaviour: UIDynamicItemBehavior = UIDynamicItemBehavior(items: [alertView])
        itemBehaviour.addAngularVelocity(CGFloat(-Double.pi / 2), for: alertView)
        animator.addBehavior(itemBehaviour)
        
        // Animate out the overlay, remove the alert view from its superview and set it to nil
        // If you don't set it to nil, it keeps falling off the screen and when Show Alert button is
        // tapped again, it will snap into view from below. It won't have the location settings we defined in createAlert()
        // And the more it 'falls' off the screen, the longer it takes to come back into view, so when the Show Alert button
        // is tapped again after a considerable time passes, the app seems unresponsive for a bit of time as the alert view
        // comes back up to the screen
        UIView.animate(withDuration: 0.4, animations: {
            self.overlayView.alpha = 0.0
        }, completion: {
            (value: Bool) in
            self.alertView.removeFromSuperview()
            self.alertView = nil
        })
        
    }
    
    @IBAction func showAlertView(sender: UIButton) {
        showAlert()
    }
    
    func createGestureRecognizer() {
        let panGestureRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(sender:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    // This gets called when a pan gesture is recognized. It was set as the selector for the UIPanGestureRecognizer in the
    // createGestureRecognizer() function
    // We check for different states of the pan and do something different in each state
    // In Began, we create an attachment behaviour. We add an offset from the center to make the alert view twist in the
    // the direction of the pan
    // In Changed we set the attachment behaviour's anchor point to the location of the user's touch
    // When the user stops dragging (In Ended), we snap the alert view back to the view's center (which is where it was originally located)
    // When the user drags the view too far down, we dismiss the view
    // I check whether the alert view is not nil before taking action. This ensures that when the user dismisses the alert view
    // and drags on the screen, the app will not crash as it tries to move a view that hasn't been initialized.
    @objc func handlePan(sender: UIPanGestureRecognizer) {
        
        if (alertView != nil) {
            let panLocationInView = sender.location(in: view)
            let panLocationInAlertView = sender.location(in: alertView)
            
            if sender.state == UIGestureRecognizerState.began {
                animator.removeAllBehaviors()
                
                let offset = UIOffsetMake(panLocationInAlertView.x - alertView.bounds.midX, panLocationInAlertView.y - alertView.bounds.midY);
                attachmentBehavior = UIAttachmentBehavior(item: alertView, offsetFromCenter: offset, attachedToAnchor: panLocationInView)
                
                animator.addBehavior(attachmentBehavior)
            }
            else if sender.state == UIGestureRecognizerState.changed {
                attachmentBehavior.anchorPoint = panLocationInView
            }
            else if sender.state == UIGestureRecognizerState.ended {
                animator.removeAllBehaviors()
                snapBehavior = UISnapBehavior(item: alertView, snapTo: view.center)
                animator.addBehavior(snapBehavior)
                
                if sender.translation(in: view).y > 100 {
                    dismissAlert()
                }
            }
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 0.4571455717, green: 0.6585432887, blue: 1, alpha: 1)
        
        self.navigationController?.navigationBar.tintColor = .white
       
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(cloudsMove), userInfo: nil, repeats: true)
        pickerData = questions.categorias()
        UIView.animate(withDuration: 5) {
            self.clouds.center.x -= 90
            self.logo.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
        }
        self.categoriaPickerView.delegate = self
        self.categoriaPickerView.dataSource = self
        
    }
    
    @objc func cloudsMove() {
        if isItLeft{
            UIView.animate(withDuration: 5, animations: {
                self.clouds.center.x += 90
                self.logo.transform = CGAffineTransform(scaleX: 1, y: 1)
            })
            isItLeft = false
        } else {
            UIView.animate(withDuration: 5, animations: {
                self.clouds.center.x -= 90
               self.logo.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
            isItLeft = true
        }
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerData[row] != "Categorias:" {
            categoriaSelecionada = pickerData[row]
            
        } else {
            categoriaSelecionada = nil
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let pickerLabel = UILabel()
        let titleData = pickerData[row]
        let myTitle = NSAttributedString(string: titleData, attributes: [NSAttributedStringKey.font:UIFont(name: "Helvetica-Bold", size: 20.0)!,NSAttributedStringKey.foregroundColor:UIColor.white])
        pickerLabel.attributedText = myTitle
        pickerLabel.backgroundColor = #colorLiteral(red: 0.7399110198, green: 0.459803462, blue: 0.2446458638, alpha: 1)
        pickerLabel.textAlignment = .center
        
        return pickerLabel
    }
    
    @IBAction func goBtn(_ sender: Any) {
       let mainGameVC = storyboard?.instantiateViewController(withIdentifier: "mainGame") as! ViewController
        if let passarCategoria = categoriaSelecionada {
            mainGameVC.categoriaSelecionada = passarCategoria
            self.navigationController?.pushViewController(mainGameVC, animated: true)
            
        } else {
            showAlert()

        }
        
    }
    
}
