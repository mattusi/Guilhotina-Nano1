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
    
    @IBOutlet weak var clouds: UIImageView!
    @IBOutlet weak var categoriaPickerView: UIPickerView!
    
    var pickerData: [String] = []
    var categoriaSelecionada: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timer = Timer.scheduledTimer(timeInterval: 5, target: self, selector: #selector(cloudsMove), userInfo: nil, repeats: true)
        pickerData = questions.categorias()
        
        self.categoriaPickerView.delegate = self
        self.categoriaPickerView.dataSource = self
        
    }
    
    @objc func cloudsMove() {
        if isItLeft{
            UIView.animate(withDuration: 5, animations: {
                self.clouds.center.x += 90})
            isItLeft = false
        } else {
            UIView.animate(withDuration: 5, animations: {
                self.clouds.center.x -= 90})
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
        if pickerData[row] != "--" {
            categoriaSelecionada = pickerData[row]
            print(categoriaSelecionada)
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
            categoriaSelecionada = nil
        }
        
    }
    
}
