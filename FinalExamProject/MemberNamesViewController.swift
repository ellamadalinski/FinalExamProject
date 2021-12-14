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

                    self.incomingClub.studentsArray.append(Students(n: memberName, dm: [String](), sn: "", w: 0, h: 0, y: 0, a: false))

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
    
    
    
}
