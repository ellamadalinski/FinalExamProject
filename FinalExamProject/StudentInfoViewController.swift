//
//  StudentInfoViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/3/21.
//

import UIKit

class StudentInfoViewController: UIViewController {
    
   
    
    @IBOutlet weak var studentNameLabel: UILabel!
    
    var incomingStudent = Students()
    @IBOutlet weak var absentDaysTextViewOutlet: UITextView!
    @IBOutlet weak var extraNotesTextViewOutlet: UITextView!
    @IBOutlet weak var yearLabelOutlet: UILabel!
    
    let transparentView = UIView()
    //to try to make push work fosho
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("appeared")
        
        
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        studentNameLabel.text = incomingStudent.name
        yearLabelOutlet.text = "Year: \(incomingStudent.year)"
        
        var absentDays = ""
        for day in incomingStudent.daysMissed {
            absentDays += "\(String(day))\n"
        }
        absentDaysTextViewOutlet.text = absentDays
        
        var notes = ""
        for note in incomingStudent.studentNotes {
            notes += "\(note)\n"
        }
        extraNotesTextViewOutlet.text = notes
        
    }
    
    func addTransparentView(){
        let window = UIApplication.shared.keyWindow
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
        }, completion: nil)
    }
    
    @objc func removeTransparentView(){
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
        }, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "studentInfoToChangeStudent"{
            let nvc = segue.destination as! ChangeStudentViewController
            nvc.incomingStudent = incomingStudent
        }
    }
    
}
