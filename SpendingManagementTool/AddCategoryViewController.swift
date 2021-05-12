//
//  AddCategoryViewController.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 11/05/2021.
//

import UIKit

class AddCategoryViewController: UIViewController {

   
    @IBOutlet weak var textFieldCategoryName: UITextField!
    @IBOutlet weak var textFieldCategoryBudget: UITextField!
    @IBOutlet weak var textFieldCategoryNotes: UITextField!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func saveCategory(_ sender: UIButton) {
        let newCategory = Category(context: context)
        if self.textFieldCategoryName.text != ""
        {
            newCategory.name = self.textFieldCategoryName.text
            newCategory.monthlybudget = self.textFieldCategoryBudget.text
//            newCategory.colour = self.text.text ADD COLOUR PICKER
            newCategory.notes = self.textFieldCategoryNotes.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
        }
        else {
            //ADD ALERT IF NO ARTIST NAME IS FILLED OUT
        }
        
    }
    
     // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//

}
