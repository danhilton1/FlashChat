//
//  MyLoginButton.swift
//  Flash Chat
//
//  Created by Daniel Hilton on 16/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit
import ChameleonFramework

class MyLoginButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setUpButton()
    }
    
    
    private func setUpButton() {
        
        backgroundColor = UIColor.flatMint()
        titleLabel?.font = UIFont(name: "HelveticaNeue-Light", size: 20)
        layer.cornerRadius = frame.size.height/2
        setTitleColor(.white, for: .normal)
        
    }
}
