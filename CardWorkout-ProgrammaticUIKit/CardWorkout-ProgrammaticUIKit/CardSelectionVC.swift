//
//  CardSelectionVC.swift
//  CardWorkout-ProgrammaticUIKit
//
//  Created by Umut Can Ertürk on 6.10.2022.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop", image: "stop.circle")
    let restartButton   = CWButton(backgroundColor: .systemGreen, title: "Restart", image: "arrow.clockwise.circle")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules", image: "list.bullet")
    var timer: Timer!
    let values = ["2", "3", "4", "5", "6", "7", "8", "9", "10", "J", "Q", "K", "A"]
    let types = ["C", "D", "H", "S"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureUI()
        startTimer()
    }
    
    func configureUI() {
        configureCardImageView()
        configureStopButton()
        configureRestartButton()
        configureRulesButton()
        
    }
    
    func configureCardImageView(){
        self.view.addSubview(cardImageView)
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        cardImageView.image = UIImage(named: selectRandomCard())
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -75)
        ])
    }
    
    func configureStopButton() {
        self.view.addSubview(stopButton)
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
        
    }
    
    func configureRestartButton() {
        self.view.addSubview(restartButton)
        restartButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        restartButton.addTarget(self, action: #selector(startTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor, constant: 0),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    func configureRulesButton() {
        self.view.addSubview(rulesButton)
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside)
        rulesButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 0),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
}

extension CardSelectionVC {
    //There are 13 values and 4 different types so we can create this random cards using for loops to choose random names
    
    
    func selectRandomCard() -> String{
        
        
        return "\(values[Int.random(in: 0..<13)])\(types[Int.random(in: 0..<4)])"
        
    }
    
    @objc func stopTimer() {
        timer.invalidate()
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }
    
    @objc func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(showRandomCard), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomCard() {
        cardImageView.image = UIImage(named: selectRandomCard())
    }
    
}
