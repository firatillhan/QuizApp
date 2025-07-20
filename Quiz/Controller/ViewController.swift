//
//  ViewController.swift
//  Quiz
//
//  Created by Fırat İlhan on 10.07.2025.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var tekrarla: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        trueButton.setTitle("Doğru", for: .normal)
        falseButton.setTitle("Yanlış", for: .normal)
        questionLabel.layer.cornerRadius = 20
        questionLabel.clipsToBounds = true
        
        trueButton.layer.cornerRadius = 20
        trueButton.clipsToBounds = true
        
        falseButton.layer.cornerRadius = 20
        falseButton.clipsToBounds = true
        updateUI()
        tekrarla.isHidden = true
    }


    

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        let sonuc = quizBrain.isTestFinish()
        if sonuc == true {
            
            trueButton.isEnabled = false
            falseButton.isEnabled = false
            trueButton.setTitle("", for: .normal)
            falseButton.setTitle("", for: .normal)
            alert(title: "Oyun bitti", message: "Doğru sayısı: \(quizBrain.getScore()) \n Tekrar Oynamak istermisiniz?")
        }
        
    }
    @IBAction func tekrarButton(_ sender: Any) {
        tekrarla.isHidden = true
        trueButton.isEnabled = true
        falseButton.isEnabled = true
        quizBrain.tekrarOyna()
        updateUI()
        
    }
    
    @objc func updateUI(){
        
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        trueButton.backgroundColor = UIColor.systemGray6
        falseButton.backgroundColor = UIColor.systemGray6
        trueButton.layer.cornerRadius = 20
        trueButton.clipsToBounds = true
        
        falseButton.layer.cornerRadius = 20
        falseButton.clipsToBounds = true

        trueButton.setTitle("Doğru", for: .normal)
        falseButton.setTitle("Yanlış", for: .normal)
        
    }
    
    
    
    func alert(title:String,message:String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Hayır", style: .default) { (UIAlertAction) in
            self.testFinishButton()
        }
        let tekrarButton = UIAlertAction(title: "Evet", style: .default) { (UIAlertAction) in
            self.testTekrarButton()
        }
        
        alert.addAction(okButton)
        alert.addAction(tekrarButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    @objc func testFinishButton(){
        print("test finish button")
        questionLabel.text = " "
        scoreLabel.text = "0"
        tekrarla.isHidden = false
    }
    
    @objc func testTekrarButton(){
        print("test tekrar button basıldı")
        trueButton.isEnabled = true
        falseButton.isEnabled = true
        quizBrain.tekrarOyna()
        updateUI()
    }
    
    
}

