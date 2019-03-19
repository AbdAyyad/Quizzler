//
//  ViewController.swift
//  Quizzler
//
//  Created by Angela Yu on 25/08/2015.
//  Copyright (c) 2015 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //Place your instance variables here
    let bank : QuestionBank = QuestionBank()
    var pickedAnswer : Bool = false
    var questionIdx : Int = 0
    var score : Int = 0
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet var progressBar: UIView!
    @IBOutlet weak var progressLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstQuestion = bank.list[questionIdx]
        questionLabel.text = firstQuestion.questionBody
        updateUI()
    }


    @IBAction func answerPressed(_ sender: AnyObject) {
        if sender.tag == 1 {
            pickedAnswer = true
        } else {
            pickedAnswer = false
        }
        checkAnswer()
        nextQuestion()
    }
    
    
    func updateUI() {
        scoreLabel.text = "Score: \(score)"
        progressLabel.text = "\(questionIdx + 1) / 13"
        progressBar.frame.size.width = (view.frame.size.width / 13) * CGFloat(questionIdx + 1)
    }
    

    func nextQuestion() {
        if questionIdx < bank.list.count - 1 {
            questionIdx += 1
            questionLabel.text = bank.list[questionIdx].questionBody
        }  else {
            let alert = UIAlertController(title: "Awsome", message: "you finished all the questions do you want tot restart", preferredStyle: .alert)
            let restartAction = UIAlertAction(title: "Restart", style: .default) { (UIAlertAction) in
                self.startOver()
            }
            alert.addAction(restartAction)
            present(alert,animated: true,completion: nil)
        }
    }
    
    
    func checkAnswer() {
        let correctAnswer = bank.list[questionIdx].answer
        if correctAnswer == pickedAnswer {
            print("correct")
            score+=1
            ProgressHUD.showSuccess("correct")
        } else {
            print("wrong")
            ProgressHUD.showError("error")
        }
        updateUI()
    }
    
    
    func startOver() {
        score = 0
       questionIdx = -1
       nextQuestion()
    }
    

    
}
