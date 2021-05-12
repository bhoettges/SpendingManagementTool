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
//        if let category = category {
//        }
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }

    var category: Category?
    
    // MARK: NAVIGATION
    
    override func prepare (for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier
            {
            case "categoryDetail":
            let destVC = segue.destination as! CategoryDetailViewController
                if let name = self.category?.name{
                    
                    destVC.categoryName = name
                }
                if let monthlybudget = self.category?.monthlybudget{
                    
                    destVC.categoryMonthlyBudget = monthlybudget
                }
                
                //case "add expense" - pass the category
            
            default:
                break
            }
        }
    }
    



}


