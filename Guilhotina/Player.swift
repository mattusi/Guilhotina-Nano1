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
    private var rightAnswers: [Character] = [] //stores the right answers, for scorekeeping
    private var wrongAnswers: [Character] = []// stores the wrong answers, for scorekeeping
    var lifes = 4
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
    func gotRight() {
        //TODO: when the player gets a question right add it to the array
    }
    func gotWrong() {
        //TODO: when the player gets something wrong add it to the array
    }
}
