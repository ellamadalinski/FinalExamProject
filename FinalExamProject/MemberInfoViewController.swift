//
//  MemberInfoViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/3/21.
//

import UIKit

class MemberInfoViewController: UIViewController {

    var incomingMember = Students()
    
    @IBOutlet weak var memberNameLabelOutlet: UILabel!
    @IBOutlet weak var memberYearLabelOutlet: UILabel!
    @IBOutlet weak var absentDaysTextViewOutlet: UITextView!
    @IBOutlet weak var extraNotesTextViewOutlet: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        memberNameLabelOutlet.text = incomingMember.name
        memberYearLabelOutlet.text = "Year: \(incomingMember.year)"
        absentDaysTextViewOutlet.text = ""
        extraNotesTextViewOutlet.text = ""
        
        var absentDays = ""
        for day in incomingMember.daysMissed {
            absentDays += "\(String(day))\n"
        }
        absentDaysTextViewOutlet.text = absentDays
        
        var notes = ""
        for note in incomingMember.studentNotes {
            notes += "\(note)\n"
        }
        extraNotesTextViewOutlet.text = notes
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "memberInfoToChangeMember"{
            let nvc = segue.destination as! ChangeMemberViewController
            nvc.delegate = self
            nvc.incomingMember = incomingMember
        }
    }
    
}
