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
    
    var basicLength:CGFloat = 20
    var stepLength:CGFloat = 15
    
    var lineColor = UIColor(rgb:0x32D8AB,alphaVal:1.0)
    var lineWidth:CGFloat = 1.0
    
    @IBOutlet weak var textField:UITextField!
    
     //run as the button click?
    override func layoutSubviews() {
        
        
    }
   
    override func awakeFromNib() {
        super.awakeFromNib()
        textField.addTarget(self, action: #selector(editingChanged(sender:)), for: .editingChanged)
        
        //addBottomLine(width: lineWidth, color: lineColor, ratio: (textField.text?.characters.count)!)
    }
    
    public func addBottomLine(width: CGFloat,color: UIColor,ratio: Int){
        
        bottomLine.backgroundColor = color.cgColor
        
        let length:CGFloat = basicLength + stepLength * CGFloat(ratio)
        
        bottomLine.frame = CGRect(x:(self.frame.size.width - length)/2 , y:self.frame.height - width , width:length, height: width)

        self.layer.addSublayer(bottomLine)
    }
    
    func adjustBottomLine(width: CGFloat,color: UIColor,ratio: Int)
    {
        bottomLine.backgroundColor = color.cgColor
        
        let length:CGFloat = basicLength + stepLength * CGFloat(ratio)
        
        bottomLine.frame = CGRect(x: (self.frame.size.width - length)/2 , y: self.frame.height - width, width:length, height: width)
    }
    
    func editingChanged(sender:AnyObject){
        
        let tempTextField = sender as! UITextField
        adjustBottomLine(width: lineWidth, color: lineColor, ratio: (tempTextField.text?.characters.count)!)
    }
    
    
}
