//
//  CardSelectionVC.swift
//  CardWorkout-ProgrammaticUIKit
//
//  Created by Umut Can Ertürk on 6.10.2022.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView   = UIImageView()
    let stopButton      = CWButton(backgroundColor: .systemRed, title: "Stop")
    let restartButton   = CWButton(backgroundColor: .systemGreen, title: "Restart")
    let rulesButton     = CWButton(backgroundColor: .systemBlue, title: "Rules")

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .systemBackground
        configureUI()
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
        cardImageView.image = UIImage(named: "AS")
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -75)
        
        ])
    }
    
    func configureStopButton() {
        self.view.addSubview(stopButton)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 260),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        
        ])
        
    }
    
    func configureRestartButton() {
        self.view.addSubview(restartButton)
        
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
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor, constant: 0),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20)
        ])
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true)
    }

}
