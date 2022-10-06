//
//  CWButton.swift
//  CardWorkout-ProgrammaticUIKit
//
//  Created by Umut Can Ertürk on 6.10.2022.
//

import UIKit

class CWButton: UIButton {
    
    init(backgroundColor: UIColor, title: String, image: String) {
        super.init(frame: .zero)
        self.configuration = .tinted()
        self.configuration?.title = title
        self.configuration?.baseBackgroundColor = backgroundColor
        self.configuration?.baseForegroundColor = backgroundColor
        self.configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
        self.configuration?.image = UIImage(systemName: image)
        self.configuration?.imagePadding = 5
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
   
    
}
