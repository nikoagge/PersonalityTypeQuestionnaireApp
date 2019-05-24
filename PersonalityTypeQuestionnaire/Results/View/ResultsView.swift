//
//  ResultsView.swift
//  PersonalityTypeQuestionnaire
//
//  Created by Nikolas on 04/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class ResultsView: UIView {

    
    let resultsLabel: UILabel = {
        
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        return label
    }()
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        setupViews()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setupViews() {
        
        addSubview(resultsLabel)
        
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0": resultsLabel]))
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutConstraint.FormatOptions(), metrics: nil, views: ["v0":resultsLabel]))
    }
}
