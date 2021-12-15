//
//  ChangePlayerViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/8/21.
//

import UIKit

class ChangePlayerViewController: UIViewController {
    
    var incomingPlayer = Students()
    var delegate : PlayerInfoViewController!
    var choice = 0
    
    @IBOutlet weak var numberTextFieldOutlet: UITextField!
    @IBOutlet weak var monthTextFieldOutlet: UITextField!
    @IBOutlet weak var dayTextFieldOutlet: UITextField!
    @IBOutlet weak var yearTextFieldOutlet: UITextField!
    @IBOutlet weak var extraNotesTextFieldOutlet: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //print("disappearing")
        delegate.viewWillAppear(true)
    }
    
    @IBAction func playerSegControl(_ sender: UISegmentedControl) {
        choice = sender.selectedSegmentIndex
    }
    
    @IBAction func changeYearWeightHeightButtonAction(_ sender: UIButton) {
        if let numberString = numberTextFieldOutlet.text{
            if let number = Int(numberString){
                switch choice {
                case 0:
                    incomingPlayer.year = number
                case 1:
                    incomingPlayer.weight = number
                case 2:
                    incomingPlayer.height = number
                default:
                    incomingPlayer.year = number
                }
                numberTextFieldOutlet.text = ""
            }
            else{
                let alertController = UIAlertController(title: "Invalid Entry", message: "Be sure you entered a valid number", preferredStyle: .alert)
                let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
                alertController.addAction(okAction)
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func addAbsentDayButtonAction(_ sender: UIButton) {
        if let monthText = monthTextFieldOutlet.text{
            if let dayText = dayTextFieldOutlet.text{
                if let yearText = yearTextFieldOutlet.text{
                    if (monthText.count == 1 || monthText.count == 2) && (dayText.count == 1 || dayText.count == 2) && (yearText.count == 4){
                        if let month = Int(monthText){
                            if let day = Int(dayText){
                                if let year = Int(yearText){
                                    let dayMissed = "\(monthText)/\(dayText)/\(yearText)"
                                    incomingPlayer.daysMissed.append(dayMissed)
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
    
    @IBAction func addExtraNoteButtonAction(_ sender: UIButton) {
        if let missingAssignment = extraNotesTextFieldOutlet.text{
            incomingPlayer.studentNotes.append(missingAssignment)
            extraNotesTextFieldOutlet.text = ""
        }
        else{
            let alertController = UIAlertController(title: "Invalid Input", message: "Be sure you have typed a short note in the text box.", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "Ok", style: .default, handler: nil)
            alertController.addAction(okAction)
            self.present(alertController, animated: false, completion: nil)
        }
    }
    

}
