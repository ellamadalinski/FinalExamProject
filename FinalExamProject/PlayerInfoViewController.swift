//
//  PlayerInfoViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/3/21.
//

import UIKit

class PlayerInfoViewController: UIViewController {
    
    var incomingPlayer = Students()
    
    
    @IBOutlet weak var playerNameLabelOutlet: UILabel!
    @IBOutlet weak var studentYearLabelOutlet: UILabel!
    @IBOutlet weak var weightLabelOutlet: UILabel!
    @IBOutlet weak var heightLabelOutlet: UILabel!
    @IBOutlet weak var absentDaysTextViewOutlet: UITextView!
    @IBOutlet weak var extraNotesTextViewOutlet: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        playerNameLabelOutlet.text = incomingPlayer.name
        studentYearLabelOutlet.text = "Year: \(incomingPlayer.year)"
        weightLabelOutlet.text = "Weight: \(incomingPlayer.weight)"
        heightLabelOutlet.text = "Height: \(incomingPlayer.height)"
        absentDaysTextViewOutlet.text = ""
        extraNotesTextViewOutlet.text = ""
        
        var absentDays = ""
        for day in incomingPlayer.daysMissed {
            absentDays += "\(String(day))\n"
        }
        absentDaysTextViewOutlet.text = absentDays
        
        var notes = ""
        for note in incomingPlayer.studentNotes {
            notes += "\(note)\n"
        }
        extraNotesTextViewOutlet.text = notes
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "playerInfoToChangePlayer"{
            let nvc = segue.destination as! ChangePlayerViewController
            nvc.delegate = self
            nvc.incomingPlayer = incomingPlayer
        }
    }

}
