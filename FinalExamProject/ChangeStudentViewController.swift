//
//  ChangeStudentViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/8/21.
//

import UIKit

class ChangeStudentViewController: UIViewController {

    var incomingStudent = Students()
    var delegate : StudentInfoViewController!
    
    @IBOutlet weak var studentYearTextFieldOutlet: UITextField!
    @IBOutlet weak var monthTextFieldOutlet: UITextField!
    @IBOutlet weak var dayTextFieldOutlet: UITextField!
    @IBOutlet weak var yearTextFieldOutlet: UITextField!
    @IBOutlet weak var missingTextFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("disappearing")
        delegate.viewWillAppear(true)
    }
    
    

    @IBAction func addAbsentDay(_ sender: UIButton) {
        if let monthText = monthTextFieldOutlet.text{
            if let dayText = dayTextFieldOutlet.text{
                if let yearText = yearTextFieldOutlet.text{
                    if (monthText.count == 1 || monthText.count == 2) && (dayText.count == 1 || dayText.count == 2) && (yearText.count == 4){
                        if let month = Int(monthText){
                            if let day = Int(dayText){
                                if let year = Int(yearText){
                                    let dayMissed = "\(monthText)/\(dayText)/\(yearText)"
                                    incomingStudent.daysMissed.append(dayMissed)
                                    //print(incomingStudent.daysMissed)
                                    monthTextFieldOutlet.text = ""
                                    dayTextFieldOutlet.text = ""
                                    yearTextFieldOutlet.text = ""
                                }
                                else{
                                    let alertController = UIAlertController(title: "Invalid Month, Day, or Year", message: "Be sure that the month, day, and year are entered as valid numbers. Example: Month-2 Day-16 Year-2024", preferredStyle: .alert)
                                    let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                    alertController.addAction(okAction)
                                    self.present(alertController, animated: true, completion: nil)
                                }
                            }
                            else{
                                let alertController = UIAlertController(title: "Invalid Month, Day, or Year", message: "Be sure that the month, day, and year are entered as valid numbers. Example: Month-2 Day-16 Year-2024", preferredStyle: .alert)
                                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                                alertController.addAction(okAction)
                                self.present(alertController, animated: true, completion: nil)
                            }
                        }
                        else{
                            let alertController = UIAlertController(title: "Invalid Month, Day, or Year", message: "Be sure that the month, day, and year are entered as valid numbers. Example: Month-2 Day-16 Year-2024", preferredStyle: .alert)
                            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                            alertController.addAction(okAction)
                            self.present(alertController, animated: true, completion: nil)
                        }
                    }
                    else{
                        let alertController = UIAlertController(title: "Invalid Month, Day, or Year", message: "Be sure that the month, day, and year are entered as valid numbers. Example: Month-2 Day-16 Year-2024", preferredStyle: .alert)
                        let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                        alertController.addAction(okAction)
                        self.present(alertController, animated: true, completion: nil)
                    }
                }
            }
        }
        
    }
    
    
    @IBAction func addMissingAssignment(_ sender: UIButton) {
        if let missingAssignment = missingTextFieldOutlet.text{
            incomingStudent.studentNotes.append(missingAssignment)
            missingTextFieldOutlet.text = ""
        }
        else{
            let alertController = UIAlertController(title: "Invalid Input", message: "Be sure you have typed a short note in the text box.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: false, completion: nil)
        }
    }
    
    
    @IBAction func changeStudentYear(_ sender: UIButton) {
        if let studentYearString = studentYearTextFieldOutlet.text{
            if let studentYear = Int(studentYearString){
                incomingStudent.year = studentYear
                studentYearTextFieldOutlet.text = ""
            }
        }
    }
    
}
