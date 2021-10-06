//
//  pageViewButton.swift
//  Task 1
//
//  Created by Mohamed Attar on 06/10/2021.
//

import UIKit

@IBDesignable class pageViewButton: UIButton {
    
    let view = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
        configure()
    }
    
    func configure() {
        // Configure View
        addSubview(view)
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: bottomAnchor),
            view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: -5),
            view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 5),
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 3
    }
    
    // Overriding the isSelected variable to reconfigure the button's selected and normal states
    override var isSelected: Bool {
        didSet {
            backgroundColor = isSelected ? UIColor.clear : UIColor.clear
            view.backgroundColor = isSelected ? .systemBlue : .secondaryLabel
            setTitleColor(.secondaryLabel, for: .normal)
            setTitleColor(.systemBlue, for: .selected)
            isHighlighted = false
            tintColor = .clear
            
            setNeedsDisplay()
        }
    }
    
}
