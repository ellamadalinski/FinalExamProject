//
//  MemberNamesViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/1/21.
//

import UIKit

class MemberNamesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableViewOutlet: UITableView!
    var incomingClub = Club(c: "default", sa: [Students]())
    var whichClicked = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return incomingClub.studentsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = incomingClub.studentsArray[indexPath.row].name
        return cell
    }

    @IBAction func addMemberAction(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Member Name", message: nil, preferredStyle: .alert)
        alertController.addTextField { (textField) in
            textField.placeholder = "Member Name"

        }


        let addMemberAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }

                if let memberName = textFields[0].text {

                    self.incomingClub.studentsArray.append(Students(n: memberName, dm: [String](), sn: [String](), w: 0, h: 0, y: 0, a: false))

                }
            self.tableViewOutlet.reloadData()
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.addAction(addMemberAction)

        self.present(alertController,
                     animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        whichClicked = indexPath.row
        performSegue(withIdentifier: "membersToMemberInfo", sender: nil)
    }
    
    func tableView(_ tableView: UITableView,
                   leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
let action = UIContextualAction(style: .normal, title: "Change Name") { [weak self] (action, view, completionHandler) in

     let alertController = UIAlertController(title: "Change Name", message: nil, preferredStyle: .alert)
     alertController.addTextField { (textField) in
         textField.placeholder = "Change Name"

     }


     let changeNameAction = UIAlertAction(title: "Add", style: .default) { [weak alertController] _ in guard let textFields = alertController?.textFields else { return }

             if let studentName = textFields[0].text {

                 self?.incomingClub.studentsArray[indexPath.row].name = studentName

             }
         tableView.reloadData()
     }
     let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
     alertController.addAction(cancelAction)
     alertController.addAction(changeNameAction)

self?.present(alertController,animated: true)



completionHandler(true)
}
        
action.backgroundColor = .systemBlue
return UISwipeActionsConfiguration(actions: [action])
}
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "membersToMemberInfo" {
            let nvc = segue.destination as! MemberInfoViewController
            nvc.incomingMember = incomingClub.studentsArray[whichClicked]
        }
        
        if segue.identifier == "memberNamesToAttendance" {
            let nvc = segue.destination as! MemberAttendanceViewController
            nvc.newIncomingMember = incomingClub
        }
    }
    
}
