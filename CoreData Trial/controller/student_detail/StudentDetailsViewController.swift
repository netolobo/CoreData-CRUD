//
//  StudentDetailsViewController.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 19/09/23.
//

import UIKit

class StudentDetailsViewController: UIViewController {
    @IBOutlet weak var studentDetailsTableView: UITableView! {
        didSet {
            studentDetailsTableView.delegate = self
            studentDetailsTableView.dataSource = self
        }
        }
        
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        studentDetailsTableView.reloadData()
    }

}
