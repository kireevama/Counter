//
//  ViewController.swift
//  Counter
//
//  Created by Marina Kireeva on 06.05.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var plusButton: UIButton!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var cleanButton: UIButton!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var changeHistoryTextView: UITextView!
    
    var counter = 0
    var messages = ["История изменений:"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        changeHistoryTextView.isScrollEnabled = true
        changeHistoryTextView.scrollRectToVisible(<#T##rect: CGRect##CGRect#>, animated: true)
        // Do any additional setup after loading the view.
    }

    @IBAction func plusButtonDidTap(_ sender: Any) {
        counter += 1
        displayScore()
        displayChangeHistory(message: "значение изменено на +1")
    }
    
    @IBAction func minusButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            displayScore()
            displayChangeHistory(message: "значение изменено на -1")
        } else {
            displayChangeHistory(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction func cleanButtonDidTap(_ sender: Any) {
        counter = 0
        displayScore()
        displayChangeHistory(message: "значение сброшено")
    }
    
    func displayScore() {
        counterLabel.text = String(counter)
    }
    
    func displayChangeHistory(message: String) {
        let dayAndTime = getDayAndTime()
        let stringOfMessage = "\(dayAndTime) \(message)"
        messages.append(stringOfMessage)
        
        changeHistoryTextView.text = messages.joined(separator: "\n")
    }

    func getDayAndTime() -> String {
        let dayAndTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
        
        let dayAndTimeToString = dateFormatter.string(from: dayAndTime)
        return dayAndTimeToString
    }
    
}

