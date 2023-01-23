//  SwitchCell.swift
//  tableviewCells
//
//  Created by Tigran on 2/1/21.
//  Copyright © 2021 Tigran. All rights reserved.
//

import UIKit

class SwitchCell: UITableViewCell {

    // instance variables
    var title = ""
    var subtitle = ""

    private var lastTouch: CGPoint?

    
    private let stackView = UIStackView()
    private let titleLabel = CustomLabel()
    private let subtitleLabel = CustomLabel()

    //constraint constants
    private let stackViewTop: CGFloat = 11
    private let stackViewLeading: CGFloat = 0
    private let stackViewBottom: CGFloat = -11
    private let stackViewTrailing: CGFloat = -56 //default 48
    private var stackViewHeight: CGFloat = 0
    /*
    guard let customFont = UIFont(name: "Chirp-Regular", size: UIFont.labelFontSize) else {
        fatalError("""
            Failed to load the "CustomFont-Light" font.
            Make sure the font file is included in the project and the font name is spelled correctly.
            """
        )
    }
    */
    public static func fontRegular(size : CGFloat = UIFont.labelFontSize)-> UIFont {
        
        if let customFont = UIFont(name: "Chirp-Regular",size: size   ) {
            return UIFontMetrics.default.scaledFont(for: customFont)
        }else{
            return UIFont.systemFont(ofSize: 19.0)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.bounds.size.height = 200
    }
    func getCellSize() -> CGFloat {
        return 100
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func installInkView() {
        selectionStyle = .none
    }
    
    
 
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setActive(selected)
    }

    func setActive(_ active: Bool) {
        //title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textSize = 15
        titleLabel.setFont = 4
        
        //subtitle label
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = true
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = UIColor(hexString: "#8B98A5")
        subtitleLabel.numberOfLines = 0
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.textSize = 13
        subtitleLabel.setFont = 2
        subtitleLabel.lineBreakMode = NSLineBreakMode.byTruncatingTail

        //stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 1//CONTORLS THE SPACE BETWEEN TITTLE AND SUBTITLE
        
        self.addSubview(stackView)
  
        
        
        NSLayoutConstraint.activate([
            //stackview
            //stackview
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: stackViewLeading),
            stackView.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor , constant: stackViewTrailing),
            stackView.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.topAnchor, constant: 6),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.bottomAnchor, constant: 6),
            
            ])
                
    }
    
}

extension UILabel{

public var requiredHeight: CGFloat {
    let label = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: CGFloat.greatestFiniteMagnitude))
    label.numberOfLines = 0
    label.lineBreakMode = NSLineBreakMode.byTruncatingTail //YT MUSIC USES OPTION 4
    label.font = font
    label.text = text
    label.attributedText = attributedText
    label.sizeToFit()
    return label.frame.height
  }
}


