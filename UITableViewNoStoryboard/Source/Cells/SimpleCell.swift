//
//  SimpleCell.swift
//  CustomSwitches
//
//  Created by chloe korzh on 22/01/2023.
//

import Foundation
import UIKit

class SimpleCell: UITableViewCell {
    //instance variables
    var title = ""
    var subtitle = ""
    var rightSide = ""
    var enableAccessoryType = false
    
    private let stackView = UIStackView()
    private let titleLabel = CustomLabel()
    private let subtitleLabel = CustomLabel()
    private let rightSideLabel = UILabel()
    
    //constraints
    private let stackViewTop: CGFloat = 10
    private let stackViewLeading: CGFloat = 0
    private let stackViewBottom: CGFloat = -10
    private let stackViewTrailing: CGFloat = -49
    private var stackViewHeight: CGFloat = 0
    
    private let rightSideTrailing: CGFloat = -8
    

    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        //title label
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = title
        titleLabel.textColor = .white
        titleLabel.numberOfLines = 0
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textSize = 15
        titleLabel.setFont = 4
        
        //rightSideLabel
        rightSideLabel.translatesAutoresizingMaskIntoConstraints = false
        rightSideLabel.text = rightSide
        rightSideLabel.textColor = .white
        rightSideLabel.numberOfLines = 0
        rightSideLabel.sizeToFit()
        rightSideLabel.adjustsFontSizeToFitWidth = true
        
        //subtitle label
        subtitleLabel.translatesAutoresizingMaskIntoConstraints = false
        subtitleLabel.text = subtitle
        subtitleLabel.textColor = UIColor(hexString: "#8B98A5")
        subtitleLabel.numberOfLines = 0
        subtitleLabel.sizeToFit()
        subtitleLabel.adjustsFontSizeToFitWidth = true
        subtitleLabel.textSize = 13
        subtitleLabel.setFont = 2
        
        
        
        //stackview
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.axis = .vertical
        stackView.distribution = .equalSpacing
        stackView.spacing = 1
        
        self.addSubview(stackView)
        self.addSubview(rightSideLabel)
        
        NSLayoutConstraint.activate([
            //stackview
            stackView.leadingAnchor.constraint(equalTo: self.layoutMarginsGuide.leadingAnchor, constant: stackViewLeading),
            stackView.trailingAnchor.constraint(equalTo: rightSideLabel.layoutMarginsGuide.trailingAnchor , constant: stackViewTrailing),
            stackView.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
            stackView.topAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.topAnchor, constant: 5),
            stackView.bottomAnchor.constraint(greaterThanOrEqualTo: self.layoutMarginsGuide.bottomAnchor, constant: 5),
            //rightSideLabel
            rightSideLabel.trailingAnchor.constraint(equalTo: self.layoutMarginsGuide.trailingAnchor, constant: rightSideTrailing),
            rightSideLabel.centerYAnchor.constraint(equalTo: self.layoutMarginsGuide.centerYAnchor),
            
            
        ])
        
    }
}
