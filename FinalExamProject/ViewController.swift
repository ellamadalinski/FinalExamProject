//
//  ViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 11/30/21.
//

import UIKit

class ViewController: UIViewController {
    
    var hasNameBeen = false
    
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        if hasNameBeen {
            
        }
        else{
        self.presentAlertController()
            hasNameBeen = true
        }
    }
    func presentAlertController() {
        let alertController = UIAlertController(title: "name",
                                                message: nil,
                                                preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "name"
        }
        
        let continueAction = UIAlertAction(title: "Continue",
                                           style: .default) { [weak alertController] _ in
                                            guard let textFields = alertController?.textFields else { return }
                                            
                                            if let emailText = textFields[0].text {
                                                StaticStuff.name = emailText
                                                self.nameLabel.text = StaticStuff.name
                                            }
        }

        alertController.addAction(continueAction)
        
        self.present(alertController,
                     animated: true)
    }

}

