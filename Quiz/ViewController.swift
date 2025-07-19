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
    
    let timer = Timer()
    let quiz =
     [
        Question(text: "Swift, Apple tarafından geliştirilen bir programlama dilidir.", answer: "Doğru"),
        Question(text: "Storyboard, SwiftUI projelerinde zorunlu olarak kullanılır.", answer: "Yanlış"),
        Question(text: "UIKit, SwiftUI'den önce kullanılan bir kullanıcı arayüzü framework'üdür.", answer: "Doğru"),
        Question(text: "@IBOutlet, arayüz elemanlarını kodla bağlamak için kullanılır.", answer: "Doğru"),
        Question(text: "ViewController sınıfı, UIKit içinde yer almaz.", answer: "Yanlış"),
        Question(text: "AppDelegate, uygulama yaşam döngüsünü yönetmede görev alır.", answer: "Doğru"),
        Question(text: "TableView, liste biçiminde veri göstermek için kullanılır.", answer: "Doğru"),
        Question(text: "UICollectionView sadece yatay liste gösterebilir.", answer: "Yanlış"),
        Question(text: "Xcode, iOS uygulamaları geliştirmek için kullanılan IDE’dir.", answer: "Doğru"),
        Question(text: "Simulator, gerçek cihaz olmadan uygulama test etmeyi sağlar.", answer: "Doğru"),
        Question(text: "Swift dilinde sınıflar struct'lara göre daha az bellek kullanır.", answer: "Yanlış"),
        Question(text: "MVVM, iOS projelerinde kullanılan bir mimari modeldir.", answer: "Doğru"),
        Question(text: "Auto Layout, arayüzü farklı ekranlara göre esnek hale getirir.", answer: "Doğru"),
        Question(text: "CocoaPods, iOS'ta bağımlılık yönetimi için kullanılan bir araçtır.", answer: "Doğru"),
        Question(text: "DispatchQueue.main.async, arka planda işlem başlatmak için kullanılır.", answer: "Yanlış"),
        Question(text: "UserDefaults, küçük verileri kalıcı olarak saklamak için uygundur.", answer: "Doğru"),
        Question(text: "Realm ve CoreData, veritabanı işlemleri için alternatiflerdir.", answer: "Doğru"),
        Question(text: "Firebase, sadece Android için kullanılabilir.", answer: "Yanlış"),
        Question(text: "SwiftUI, declarative (bildirime dayalı) bir kullanıcı arayüzü geliştirme yöntemidir.", answer: "Doğru"),
        Question(text: "NavigationController, sayfalar arası geçiş yapmayı kolaylaştırır.", answer: "Doğru")
        ]
    
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        trueButton.tag = 1
        falseButton.tag = 2
        trueButton.setTitle("Doğru", for: .normal)
        falseButton.setTitle("Yanlış", for: .normal)
        questionLabel.layer.cornerRadius = 20
        questionLabel.clipsToBounds = true
        
        trueButton.layer.cornerRadius = 20
        trueButton.clipsToBounds = true
        
        falseButton.layer.cornerRadius = 20
        falseButton.clipsToBounds = true
        updateUI()
    }


    

    @IBAction func answerButtonPressed(_ sender: UIButton) {

        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber].answer
       
        print("Kullanıcının cevabı:\(userAnswer!), Doğru cevap: \(actualAnswer)")
       
        if userAnswer == actualAnswer {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red

        }
        
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            
        } else {
            questionNumber = 0

        }
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        


    }
    
    @objc func updateUI(){
        questionLabel.text = quiz[questionNumber].text
        trueButton.backgroundColor = UIColor.systemGray6
        falseButton.backgroundColor = UIColor.systemGray6
        trueButton.layer.cornerRadius = 20
        trueButton.clipsToBounds = true
        
        falseButton.layer.cornerRadius = 20
        falseButton.clipsToBounds = true
        progressBar.progress = Float(questionNumber + 1) / Float(quiz.count)

    }
    
    
}

