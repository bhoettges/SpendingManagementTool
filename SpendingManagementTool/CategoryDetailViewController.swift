//
//  CategoryDetailViewController.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 11/05/2021.
//

import UIKit

class CategoryDetailViewController: UIViewController {

    @IBOutlet weak var labelCategoryName: UILabel!
    @IBOutlet weak var labelCategoryMonthlyBudget: UILabel!
    
    var categoryName = ""
    var categoryMonthlyBudget = ""
    var category:Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelCategoryName.text = categoryName
        labelCategoryMonthlyBudget.text = categoryMonthlyBudget
        
        // Do any additional setup after loading the view.
    }
    
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
