//
//  ChangeStudentViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/8/21.
//

import UIKit

class ChangeStudentViewController: UIViewController {

    var incomingStudent = Students()
    
    @IBOutlet weak var monthTextFieldOutlet: UITextField!
    @IBOutlet weak var dayTextFieldOutlet: UITextField!
    @IBOutlet weak var yearTextFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func addButtonAction(_ sender: UIButton) {
        if let monthText = monthTextFieldOutlet.text{
            if let dayText = dayTextFieldOutlet.text{
                if let yearText = yearTextFieldOutlet.text{
                    let dayMissedText = monthText+dayText+yearText
                    if let dayMissed = Int(dayMissedText){
                        incomingStudent.daysMissed.append(dayMissed)
                    }
                }
            }
        }
        
        else{
            let alertController = UIAlertController(title: "Invalid Month, Day, or Year", message: "Be sure that the month, day, and year are entered as numbers", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: false, completion: nil)
        }
    }
    

}
