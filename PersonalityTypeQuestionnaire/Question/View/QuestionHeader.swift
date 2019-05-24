//
//  QuestionHeader.swift
//  PersonalityTypeQuestionnaire
//
//  Created by Nikolas on 04/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class QuestionHeader: UITableViewHeaderFooterView {
    
    
    override init(reuseIdentifier: String?) {
        
        super.init(reuseIdentifier: reuseIdentifier)
        
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented.")
    }
    
    
    let nameLabel: UILabel = {
        
        let label = UILabel()
        label.text = "Sample Header"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        return label
    }()
    
    
    func setupViews() {
        
        addSubview(nameLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": nameLabel]))
    }
}
