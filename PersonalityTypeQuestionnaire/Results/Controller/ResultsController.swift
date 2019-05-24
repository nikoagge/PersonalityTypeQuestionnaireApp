//
//  ResultsController.swift
//  PersonalityTypeQuestionnaire
//
//  Created by Nikolas on 04/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


class ResultsController: UIViewController {

    
    var childView = ResultsView()
    
    
    override func viewDidLoad() {

        // Do any additional setup after loading the view.
        super.view = childView
        childView.backgroundColor = .white
        
        navigationController?.navigationBar.tintColor = .white
       
        navigationItem.title = "Results"
        
        let names = ["Ross", "Chandler", "Joey", "Phoebe", "Monica", "Rachel"]
        
        var score = 0
        
        for question in questionsList {
            
            score += question.selectedAnswerIndex!
        }
        
        let result = names[score % names.count]
        
        childView.resultsLabel.text = "Congratulations, you 're a total \(result)"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(done))
    }
    
    
    @objc func done() {
        
        navigationController?.popToRootViewController(animated: true)
    }
}
