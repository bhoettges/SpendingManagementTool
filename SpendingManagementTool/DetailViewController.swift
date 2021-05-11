//
//  DetailViewController.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 10/05/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!


    func configureView() {
        // Update the user interface for the detail item.
        if let category = category {
            detailDescriptionLabel.text = category.name
            }
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var category: Category?


}


