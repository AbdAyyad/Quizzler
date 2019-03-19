//
//  Question.swift
//  Quizzler
//
//  Created by Abdelrahman Ayyad on 3/18/19.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import Foundation

class Question {
    let questionBody : String
    let answer : Bool
    
    init(text : String,correctAnswer : Bool) {
        self.questionBody = text
        self.answer = correctAnswer
    }
}
