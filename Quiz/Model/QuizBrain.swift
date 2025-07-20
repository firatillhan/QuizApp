//
//  QuizBrain.swift
//  Quiz
//
//  Created by Fırat İlhan on 20.07.2025.
//

import Foundation

struct QuizBrain {
    let quiz =
     [
        Question(q: "Swift, Apple tarafından geliştirilen bir programlama dilidir.", a: "Doğru"),
        Question(q: "Storyboard, SwiftUI projelerinde zorunlu olarak kullanılır.", a: "Yanlış"),
        Question(q: "UIKit, SwiftUI'den önce kullanılan bir kullanıcı arayüzü framework'üdür.", a: "Doğru"),
        Question(q: "@IBOutlet, arayüz elemanlarını kodla bağlamak için kullanılır.", a: "Doğru"),
        Question(q: "ViewController sınıfı, UIKit içinde yer almaz.", a: "Yanlış"),
        Question(q: "AppDelegate, uygulama yaşam döngüsünü yönetmede görev alır.", a: "Doğru"),
        Question(q: "TableView, liste biçiminde veri göstermek için kullanılır.", a: "Doğru"),
        Question(q: "UICollectionView sadece yatay liste gösterebilir.", a: "Yanlış"),
        Question(q: "Xcode, iOS uygulamaları geliştirmek için kullanılan IDE’dir.", a: "Doğru"),
        Question(q: "Simulator, gerçek cihaz olmadan uygulama test etmeyi sağlar.", a: "Doğru"),
        Question(q: "Swift dilinde sınıflar struct'lara göre daha az bellek kullanır.", a: "Yanlış"),
        Question(q: "MVVM, iOS projelerinde kullanılan bir mimari modeldir.", a: "Doğru"),
        Question(q: "Auto Layout, arayüzü farklı ekranlara göre esnek hale getirir.", a: "Doğru"),
        Question(q: "CocoaPods, iOS'ta bağımlılık yönetimi için kullanılan bir araçtır.", a: "Doğru"),
        Question(q: "DispatchQueue.main.async, arka planda işlem başlatmak için kullanılır.", a: "Yanlış"),
        Question(q: "UserDefaults, küçük verileri kalıcı olarak saklamak için uygundur.", a: "Doğru"),
        Question(q: "Realm ve CoreData, veritabanı işlemleri için alternatiflerdir.", a: "Doğru"),
        Question(q: "Firebase, sadece Android için kullanılabilir.", a: "Yanlış"),
        Question(q: "SwiftUI, declarative (bildirime dayalı) bir kullanıcı arayüzü geliştirme yöntemidir.", a: "Doğru"),
        Question(q: "NavigationController, sayfalar arası geçiş yapmayı kolaylaştırır.", a: "Doğru")
        ]
    var questionNumber = 0
    var score = 0
    var testFinish: Bool = false
    var tekrarOyun:Bool = false
    
    mutating func checkAnswer(_ userAnswer:String) -> Bool{
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            return false
        }
    }
    
    func getQuestionText() -> String{
        return quiz[questionNumber].text
    }
    func getProgress() -> Float {
        let progress = Float(questionNumber + 1) / Float(quiz.count)
       
        return progress
    }
    
    mutating func nextQuestion() {
        if questionNumber + 1 < quiz.count {
            questionNumber += 1
            testFinish = false
        } else {
            testFinish = true

//            questionNumber = 0
//            score = 0
            
            
        }
    }
    func getScore() -> Int {
        return score
    }
    
    
    
    mutating func isTestFinish() -> Bool{
         return testFinish
    }
    
    mutating func tekrarOyna(){
        questionNumber = 0
        score = 0
        tekrarOyun = false
        print("tekrarOyna fonksiyonu çalıştı")
    }
    
    
    
    
    
    
    
}
