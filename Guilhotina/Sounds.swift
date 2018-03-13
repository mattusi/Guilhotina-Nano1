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
    private var laminaSoundEffect: AVAudioPlayer?
    private var deathSoundEffect: AVAudioPlayer?
    func soundLamina() {
        
        if let asset = NSDataAsset(name: "lamina") {
            do {
                laminaSoundEffect = try AVAudioPlayer(data: asset.data, fileTypeHint: "caf")
                laminaSoundEffect?.volume = 2
                laminaSoundEffect?.play()
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
    func soundDeath() {
        if let asset = NSDataAsset(name: "Wilhelm-Scream") {
            do {
                laminaSoundEffect = try AVAudioPlayer(data: asset.data, fileTypeHint: "caf")
                laminaSoundEffect?.play()
                
            } catch let error as NSError {
                print(error.localizedDescription)
            }
        }
    }
}
