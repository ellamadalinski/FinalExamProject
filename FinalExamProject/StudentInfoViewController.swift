//
//  StudentInfoViewController.swift
//  FinalExamProject
//
//  Created by ELLA MADALINSKI on 12/3/21.
//

import UIKit

class StudentInfoViewController: UIViewController {
    
    @IBOutlet weak var monthButtonOutlet: UIButton!
    @IBOutlet weak var dayButtonOutlet: UIButton!
    @IBOutlet weak var yearButtonOutlet: UIButton!
    
    let transparentView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func monthButtonAction(_ sender: UIButton) {
    }
    @IBAction func dayButtonAction(_ sender: UIButton) {
    }
    @IBAction func yearButtonAction(_ sender: UIButton) {
    }
    
    
}