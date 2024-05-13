//
//  ViewController.swift
//  Counter
//
//  Created by Marina Kireeva on 06.05.2024.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - IBOutlet
    @IBOutlet weak private var plusButton: UIButton!
    @IBOutlet weak private var minusButton: UIButton!
    @IBOutlet weak private var cleanButton: UIButton!
    @IBOutlet weak private var counterLabel: UILabel!
    @IBOutlet weak private var changeHistoryTextView: UITextView!
    
    // MARK: - Private Properties
    private var counter = 0
    private var messages = ["История изменений:"]
    
    // MARK: - Public methods
    override func viewDidLoad() {
        super.viewDidLoad()
        changeHistoryTextView.isScrollEnabled = true
    }

    // MARK: - Private Methods
    private func displayScore() {
        counterLabel.text = String(counter)
    }
    
    private func displayChangeHistory(message: String) {
        let dayAndTime = getDayAndTime()
        let stringOfMessage = "\(dayAndTime) \(message)"
        messages.append(stringOfMessage)
        
        changeHistoryTextView.text = messages.joined(separator: "\n")
    }

    private func getDayAndTime() -> String {
        let dayAndTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH.mm"
        
        let dayAndTimeToString = dateFormatter.string(from: dayAndTime)
        return dayAndTimeToString
    }
    
    @IBAction private func plusButtonDidTap(_ sender: Any) {
        counter += 1
        displayScore()
        displayChangeHistory(message: "значение изменено на +1")
    }
    
    // MARK: - IBAction
    @IBAction private func minusButtonDidTap(_ sender: Any) {
        if counter > 0 {
            counter -= 1
            displayScore()
            displayChangeHistory(message: "значение изменено на -1")
        } else {
            displayChangeHistory(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    @IBAction private func cleanButtonDidTap(_ sender: Any) {
        counter = 0
        displayScore()
        displayChangeHistory(message: "значение сброшено")
    }
    
}

