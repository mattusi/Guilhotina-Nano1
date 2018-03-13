//
//  Player.swift
//  Guilhotina
//
//  Created by Matheus Tusi on 09/03/18.
//  Copyright © 2018 senac2018. All rights reserved.
//Ola

import Foundation



class Player {
    var name: String! //stores the player name
    var rightAnswers: [Character] = [] //stores the right answers, for scorekeeping
    private var wrongAnswers: [Character] = [" ", " ", " ", " "]// stores the wrong answers, for scorekeeping
    var lifes = 3
    init(name: String) {
        self.name = name
    }
    func getPoints() -> Int {
        let finalPoints = (rightAnswers.count * 300) - (wrongAnswers.count * 100)
        if finalPoints < 0 {
            return 0
        } else {
            return finalPoints
        }
    }
    func gotRight(char: Character) {
        rightAnswers.append(char)
    }
    func gotWrong(char: Character) -> String {
        wrongAnswers.remove(at: lifes)
        wrongAnswers.append(char)
        lifes -= 1
        var string = String(wrongAnswers.reversed())
        string.insert(separator: " ", every: 1)
        return string
        
    }
}
