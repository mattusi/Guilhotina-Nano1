//
//  Questions.swift
//  Guilhotina
//
//  Created by senac2018 on 09/03/2018.
//  Copyright © 2018 SenacAcademy. All rights reserved.
//

    import Foundation

    class Questions {
        var questionsAnswers = ["De quem é a famosa frase “Penso, logo existo?":"Descartes",
                                "De onde é a invenção do chuveiro elétrico?" : "Brasil",
                                "Qual o menor país do mundo?" : "Vaticano",
                                "Qual o maior país mundo?" : "Rússia",
                                "Qual o livro mais vendido no mundo a seguir à Bíblia?" : "Dom Quixote",
                                "Qual os país que têm a maior expectativa de vida do mundo?" : "Japão",
                                "Qual os país que têm a menor expectativa de vida do mundo?" : "Serra Leoa",
                                "Em qual período da pré-história o fogo foi descoberto?" : "Paleolítico",
                                "Em qual local da Ásia o português é língua oficial?" : "Macau",
                                "Qual foi o recurso utilizado inicialmente pelo homem para explicar a origem das coisas?" : "Mitologia",
                                "Júpiter é correlato romano a qual deus grego?" : "Zeus",
                                "Plutão é correlato romano a qual deus grego?" : "Hades",
                                "Quem é o deus grego do amor?" : "Eros",
                                "Quem é o deus grego da festa, vinho e do prazer?" : "Dionísio",
                                "Qual é o corpo celeste que não possui luz própria?" : "Planetas",
                                "Qual oceano está entre os continentes Americano e Africano?" : "Atlântico",
                                "Qual a capital do Canada?" : "Ottawa",
                                "Qual é a vegetação rasteira encontrada próximo às regiões polares?" : "Tundra",
                                "Qual o nome comum de todos os insetos da ordem dos Sifonápteros?" : "Pulga",
                                "Kuala Lumpur é a capital de qual país?" : "Malásia",
                                "Qual a capital da Autrália?" : "Camberra",
                                "Qual é o significado de untar?" : "Lubrificar",
                                "Que outro nome recebe o Contratorpedeiro?" : "Destroyer",
                                "Qual o nome da força devido a diferença de intensidade faz o avião voar?" : "Sustentação",
                                "Como é chamado o ponto mais alto da cabeça?": "Cocoruto",
                                "Qual é o maior golfo do mundo?": "Mexicano"
            
            
                                ]
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
        
        func convertToUndescore(arrayChar: [Character]) -> [String]{
            var arrayUnderline : [String]
            for i in 0..<arrayChar.count{
                arrayUnderline[i] = "_"
                
            }
            return arrayUnderline
        }
        
        func verificaLetra(arrayChar: [Character], letra: Character) -> [Character] {
            var arrayUnderline: [Character] = []
            for i in 0..<arrayChar.count{
                if (letra == arrayChar[i]){
                    arrayUnderline[i] = arrayChar[i]
                }
            }
            return arrayUnderline
        }

        
        func categorias() -> [String] {
        //TODO:
        return ["","Gerais","Historia","Apple", "Carros", "Animes"]
    }
}
