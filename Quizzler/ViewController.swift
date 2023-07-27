//
//  ViewController.swift
//  Quizzler
//
//  Created by Sadia on 27/7/23.
//

import UIKit

class ViewController: UIViewController {
    
    let questionBank = QuestionBank()
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    @IBOutlet weak var choice3Button: UIButton!
    @IBOutlet weak var progressbar: UIProgressView!
    
    var questionNumber = 0
    var correctAns = ""
    var score = 0
    
    var isFinished = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupQueandAns()
    }
    
    
    @IBAction func answerPressed(_ sender: UIButton) {
        guard !isFinished else {return}
        
        
        let givenAns = sender.currentTitle
        
        if givenAns == correctAns{
            score += 1
        }
        
        if questionNumber == (questionBank.quiz.count-1){
            isFinished = true
        }
        
        
        if questionNumber < (questionBank.quiz.count-1){
            questionNumber += 1
            
            let progressValue = Float(questionNumber+1)/Float(questionBank.quiz.count)
            progressbar.progress = progressValue
        }
        
        setupQueandAns()
    }
    
    func setupQueandAns(){
        let question = questionBank.quiz[questionNumber].q
        let choice1 = questionBank.quiz[questionNumber].a[0]
        let choice2 = questionBank.quiz[questionNumber].a[1]
        let choice3 = questionBank.quiz[questionNumber].a[2]
        
        correctAns = questionBank.quiz[questionNumber].correctAnswer
        
        questionLabel.text = question
        
        scoreLabel.text = "Score: \(score)"
        
        choice1Button.setTitle(choice1, for: .normal)
        choice2Button.setTitle(choice2, for: .normal)
        choice3Button.setTitle(choice3, for: .normal)
    }
    
    
    
}

