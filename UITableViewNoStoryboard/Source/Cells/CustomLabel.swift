//
//  CustomLabel.swift
//  CustomSwitches
//
//  Created by chloe korzh on 22/01/2023.
//

import Foundation
import UIKit

@IBDesignable open class CustomLabel : UILabel {
    
    func setUnderline(){
        let attrs = NSAttributedString(string: self.text ?? "",
                                       attributes: [NSAttributedString.Key.font : self.font ?? UIFont.systemFont(ofSize: 17.0), NSAttributedString.Key.foregroundColor : self.textColor,
                                                    NSAttributedString.Key.underlineStyle : 1])
        self.attributedText = attrs
    }
    
    
    override open func awakeFromNib() {
    }
    
    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
 
        self.lineBreakMode = NSLineBreakMode.byTruncatingTail
        
        self.adjustsFontForContentSizeCategory = true
        self.minimumScaleFactor = 2.0
    
    }
    
    @IBInspectable var setFont: Int = 1 {
        didSet{
            if setFont == 0 {
                self.font = Fonts.fontLight(size: textSize)
            }else if setFont == 1 {
                self.font = Fonts.fontRegular(size: textSize)
            }else if setFont == 2 {
                self.font = Fonts.fontMeduim(size: textSize)
            }else if setFont == 3  {
                self.font = Fonts.fontSemiBold(size: textSize)
            }else if setFont == 4  {
                self.font = Fonts.fontBold(size: textSize)
            }else if setFont == 5  {
                self.font = Fonts.fontHeavy(size: textSize)
            }else {
                self.font = Fonts.fontRegular(size: textSize)
            }
            self.adjustsFontForContentSizeCategory = true
        }
    }
    
    
    @IBInspectable var textSize:CGFloat = UIFont.labelFontSize {
        didSet {
            if setFont == 0 {
                self.font = Fonts.fontLight(size: textSize)
            }else if setFont == 1 {
                self.font = Fonts.fontRegular(size: textSize)
            }else if setFont == 2 {
                self.font = Fonts.fontMeduim(size: textSize)
            }else if setFont == 3 {
                self.font = Fonts.fontSemiBold(size: textSize)
            }else if setFont == 4 {
                self.font = Fonts.fontBold(size: textSize)
            }else if setFont == 5 {
                self.font = Fonts.fontHeavy(size: textSize)
            }else{
                 self.font = Fonts.fontRegular(size: textSize)
            }
            self.adjustsFontForContentSizeCategory = true
        }
        
    }
    
    
  
    
    
    
    
    
    
    
}
