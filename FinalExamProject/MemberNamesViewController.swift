//
//  MemberNamesViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/1/21.
//

import UIKit

class MemberNamesViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{

    @IBOutlet weak var tableViewOutlet: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewOutlet.delegate = self
        tableViewOutlet.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }

}
