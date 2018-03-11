//
//  Questions.swift
//  Guilhotina
//
//  Created by senac2018 on 09/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

import Foundation

class Questions {
    var questionsAnswers = ["Nome de cidade:":"Sao Paulo"]
    private func char(questao: String) -> [Character] {
        //Returns all the characters in the answer of the question asked
        var resp: [Character] = []
        for i in questionsAnswers[questao]! {
            let str = String(i).lowercased()
            resp.append(Character(str))
        }
        return resp
    }
    func getQuestion() -> (question: String, answer: [Character]) {
        let randonNumberGenerator2000 = Int(arc4random_uniform(UInt32(questionsAnswers.count - 1)))
        var keys = Array(questionsAnswers.keys)
        let randonKey = keys[randonNumberGenerator2000]
        let answerChar = char(questao: randonKey)
        return (question: randonKey, answer: answerChar)
    }
    func categorias() -> [String] {
        //TODO:
        return ["--","Gerais"]
    }
}
