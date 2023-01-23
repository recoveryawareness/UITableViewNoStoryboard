//
//  Fonts.swift
//  BlueLabs
//
//  Created by chloe korzh on 13/01/2023.
//

import Foundation
import UIKit

enum FontName : String {
    // english fonts
    case FONT_LIGHT = "Chirp-Light"
    case FONT_REGULAR = "Chirp-Regular"
    case FONT_MEDUIM = "Chirp-Medium"
    case FONT_SEMI_BOLD = "Chirp-SemiBold"
    case FONT_BOLD = "Chirp-Bold"
    case FONT_HEAVY = "Chirp-Heavy"
    
    
}

open class  Fonts {
    
    private static func fontPathLight() -> FontName{

            return .FONT_LIGHT
    }
    
    private static func fontPathRegular() -> FontName{
   
            return .FONT_REGULAR
    }
    
    private static func fontPathMeduim() -> FontName{

            return .FONT_MEDUIM
    }
    
    
    private static func fontPathSemiBold() -> FontName{

            return .FONT_SEMI_BOLD
    }
    
    private static func fontPathBold() -> FontName{

            return .FONT_BOLD
    }
    
    private static func fontPathHeavy() -> FontName{

            return .FONT_HEAVY
    }
    
    
    
    
    public static func fontLight(size : CGFloat = UIFont.labelFontSize )-> UIFont {
        if let customFont = UIFont(name: fontPathLight().rawValue , size: size  ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }
    
    public static func fontRegular(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        
        if let customFont = UIFont(name: fontPathRegular().rawValue ,size:  size   ) {
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 13.0)
        }
    }
    
    
    public static func fontMeduim(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathMeduim().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }
    
    public static func fontSemiBold(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathSemiBold().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
        
    }
    
    public static func fontBold(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathBold().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 15.0)
        }
        
    }
    
    public static func fontHeavy(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        if let customFont = UIFont(name: fontPathHeavy().rawValue , size: size ){
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 18.0)
        }
        
    }


}
