//
//  ViewController.swift
//  PersonalityTypeQuestionnaire
//
//  Created by Nikolas on 04/11/2018.
//  Copyright © 2018 Nikolas. All rights reserved.
//

import UIKit


var questionsList: [Question] = [Question.init(questionString: "What is your favourite type of food?", possibleAnswers: ["Avocado", "Souvlaki", "Pasta", "Pizza", "Seafood", "Burger"], selectedAnswerIndex: nil), Question.init(questionString: "What do you do for a living?", possibleAnswers: ["Paleontologist", "Marketer", "Actor", "Musician", "Chef", "Model"], selectedAnswerIndex: nil), Question.init(questionString: "What is your favourite colour?", possibleAnswers: ["Black", "Yellow", "Blue", "Red", "Green", "White"], selectedAnswerIndex: nil)]


class QuestionViewController: UITableViewController {

    
    let cellId = "cellId"
    let headerId = "headerId"
    
    
    var question = Question.init(questionString: "What is your favourite type of food?", possibleAnswers: ["Avocado", "Souvlaki", "Pasta", "Pizza"], selectedAnswerIndex: nil)
    
    
    //If you want this, you must set it in every ViewController.
    override var preferredStatusBarStyle: UIStatusBarStyle {
        
        return .lightContent
    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        navigationItem.title = "Question"
        navigationController?.navigationBar.tintColor = .white
        
        tableView.register(AnswerCell.self, forCellReuseIdentifier: cellId)
        tableView.register(QuestionHeader.self, forHeaderFooterViewReuseIdentifier: headerId)
        
        tableView.sectionHeaderHeight = 50
        
        tableView.tableFooterView = UIView()
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! AnswerCell
        
        if let index = navigationController?.viewControllers.index(of: self) {
            
            let question = questionsList[index]
            
            cell.textLabel?.text = question.possibleAnswers![indexPath.row]

        }
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let index = navigationController?.viewControllers.index(of: self) {
            
            let question = questionsList[index]
            
            if let count = question.possibleAnswers?.count {
                
                return count
            }
        }
        
        return 0
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerId) as! QuestionHeader
        
        if let index = navigationController?.viewControllers.index(of: self) {
            
            let question = questionsList[index]
            
            header.nameLabel.text = question.questionString
        }
        
        return header
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let index = navigationController?.viewControllers.index(of: self) {
            
            questionsList[index].selectedAnswerIndex = indexPath.item
            
            //Implement next question logic.
            if index < questionsList.count - 1 {
                
                let questionController = QuestionViewController()
                navigationController?.pushViewController(questionController, animated: true)
            } else {
                
                let controller = ResultsController()
                
                navigationController?.pushViewController(controller, animated: true)
            }
            
            navigationItem.backBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: nil, action: nil)
        }
    }
}

