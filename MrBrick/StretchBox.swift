//
//  StretchBox.swift
//  MrBrick
//
//  Created by Xueliang Chen on 9/20/17.
//  Copyright © 2017 Conceptual. All rights reserved.
//

import UIKit

 @IBDesignable class StretchBox: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var bottomLine:CALayer = CALayer()
    
    @IBOutlet weak var textField:UITextField!
    
     //run as the button click?
    override func layoutSubviews() {
        
        
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.addTarget(self, action: #selector(editingChanged(sender:)), for: .editingChanged)
        
        addBottomLine(width: 3, color: UIColor.red)
    }
    
    func addBottomLine(width: CGFloat,color: UIColor){
        let basicLength:CGFloat = 20
        let stepLength:CGFloat = 5
        
        bottomLine.backgroundColor = color.cgColor
        
        bottomLine.frame = CGRect(x:(self.frame.size.width - basicLength)/2 , y:self.frame.height - width , width:basicLength, height: width)

        self.layer.addSublayer(bottomLine)
    }
    
    func adjustBottomLine(width: CGFloat,color: UIColor,ratio: Int)
    {
        bottomLine.backgroundColor = UIColor.green.cgColor
        
        let basicLength:CGFloat = 20
        let stepLength:CGFloat = 5
        
        let length:CGFloat = basicLength + stepLength * CGFloat(ratio)
        
        bottomLine.frame = CGRect(x: (self.frame.size.width - length)/2 , y: self.frame.height - width, width:length, height: width)
    }
    
    func editingChanged(sender:AnyObject){
        
        let tempTextField = sender as! UITextField
        adjustBottomLine(width: 3.0, color: UIColor.green, ratio: (tempTextField.text?.characters.count)!)
    }
    
    
}
