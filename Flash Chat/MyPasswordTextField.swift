//
//  MyPasswordTextField.swift
//  Flash Chat
//
//  Created by Daniel Hilton on 16/03/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class MyPasswordTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpField()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init( coder: aDecoder )
        setUpField()
    }
    
    
    private func setUpField() {
        tintColor             = .blue
        textColor             = .darkGray
        font                  = UIFont(name: "HelveticaNeue-Light", size: 18)
        backgroundColor       = UIColor(white: 1.0, alpha: 0.9)
        autocorrectionType    = .no
        layer.cornerRadius    = 25.0
        clipsToBounds         = true
        
        let placeholder       = "Password"
        let placeholderFont   = UIFont(name: "HelveticaNeue-Light", size: 18)!
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes:
            [NSAttributedString.Key.foregroundColor: UIColor.lightGray,
             NSAttributedString.Key.font: placeholderFont])
        
//        let indentView        = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
//        leftView              = indentView
//        leftViewMode          = .always
    }
}
