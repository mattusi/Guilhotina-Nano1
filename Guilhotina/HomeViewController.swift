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
    
    @IBOutlet weak var categoriaPickerView: UIPickerView!
    
    var pickerData: [String] = []
    var categoriaSelecionada: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        pickerData = questions.categorias()
        
        self.categoriaPickerView.delegate = self
        self.categoriaPickerView.dataSource = self
        
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
        }
    }
    @IBAction func goBtn(_ sender: Any) {
       // let mainGameVC = storyboard?.instantiateViewController(withIdentifier: "mainGame") as! ViewController
        //if let passarCategoria
    }
    
}
