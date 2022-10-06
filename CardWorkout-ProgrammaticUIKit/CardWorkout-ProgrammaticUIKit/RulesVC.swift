//
//  RulesVC.swift
//  CardWorkout-ProgrammaticUIKit
//
//  Created by Umut Can Ertürk on 6.10.2022.
//

import UIKit

class RulesVC: UIViewController {
    
    let titleLable      = UILabel()
    let rulesLable      = UILabel()
    let exercisesLabel  = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = .systemBackground
        configureUI()
    }
    
    func configureUI() {
        configureTitleLabel()
        configureRulesLabel()
        configureExercisesLabel()
    }
    
    func configureTitleLabel() {
        self.view.addSubview(titleLable)
        titleLable.translatesAutoresizingMaskIntoConstraints = false
        titleLable.text = "Rules"
        titleLable.font = .systemFont(ofSize: 40, weight: .bold)
        titleLable.textAlignment = .center
        
        NSLayoutConstraint.activate([
            titleLable.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            titleLable.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        
    }
    
    func configureRulesLabel() {
        self.view.addSubview(rulesLable)
        rulesLable.translatesAutoresizingMaskIntoConstraints = false
        rulesLable.text = "The value of each card represents the number of exercise you do. \n\nJ = 11, Q = 12, K = 13, A = 14"
        rulesLable.font = .systemFont(ofSize: 20, weight: .semibold)
        rulesLable.textAlignment = .center
        rulesLable.lineBreakMode = .byWordWrapping
        rulesLable.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            rulesLable.topAnchor.constraint(equalTo: titleLable.bottomAnchor, constant: 25),
            rulesLable.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30),
            rulesLable.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30)
        ])
        
    }
    
    func configureExercisesLabel() {
        self.view.addSubview(exercisesLabel)
        exercisesLabel.translatesAutoresizingMaskIntoConstraints = false
        
        exercisesLabel.text = "♠️ = Push-ups\n\n❤️ = Sit-ups\n\n♣️ = Burpees\n\n♦️ = Jumping Jacks"
        exercisesLabel.font = .systemFont(ofSize: 20, weight: .semibold)
        exercisesLabel.textAlignment = .left
        exercisesLabel.numberOfLines = 0
        
        NSLayoutConstraint.activate([
            exercisesLabel.topAnchor.constraint(equalTo: rulesLable.bottomAnchor, constant: 50),
            //exercisesLabel.widthAnchor.constraint(equalToConstant: 200),
            exercisesLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        
        ])
    }
    
    
    
    
    
    
}
