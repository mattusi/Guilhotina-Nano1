//
//  Sounds.swift
//  Guilhotina
//
//  Created by senac2018 on 09/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import UIKit
import AVFoundation
class Sounds {
    var laminaSoundEffect: AVAudioPlayer?
    func soundLamina() {
        
        if let asset = NSDataAsset(name: "lamina") {
            do {
                laminaSoundEffect = try AVAudioPlayer(data: asset.data, fileTypeHint: "caf")
                laminaSoundEffect?.play()
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
