//
//  UITextField_LineStyle.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/12/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit

@IBDesignable class UITextFieldFixed: UITextField,UITextFieldDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    func setup(){
        self.borderStyle = .none
        self.layer.backgroundColor = UIColor.white.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 1.0
        self.layer.shadowRadius = 0.0
    }
    /*func getWidth(text:String?) -> CGFloat
    {
        let textField = UITextField(frame: zero)
        textField.text = text
        textField.sizeToFit()
        return textField.frame.size.width
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let width = getWidth(textField.text!)
        if(UIScreen.mainScreen().bounds.width - 55 > width)
        {
            let txtWidthOfName.constant = 0.0
            if(width > txtWidthOfName.constant)
            {
                txtWidthOfName.constant = width
            }
            view.layoutIfNeeded()
        }
        return true
    }*/
    
    
}
