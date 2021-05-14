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
    @IBOutlet weak var ColorPicker: UISegmentedControl!
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let namealert = UIAlertController (title: "Wrong Input!", message: "Please enter a category name and budget to add a category!", preferredStyle: .alert
    )
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func closePopUp(){
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateData(){
    }
    
    @IBAction func saveCategory(_ sender: UIButton) {
        namealert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        
        
        
        if (self.textFieldCategoryName.text == "" || self.textFieldCategoryBudget.text == ""){
            
            self.present(namealert,animated: true)
            
            }
           
        else {
            let newCategory = Category(context: context)

            newCategory.name = self.textFieldCategoryName.text
            newCategory.monthlybudget = Double(self.textFieldCategoryBudget.text!)!
            newCategory.colour = Int16(ColorPicker.selectedSegmentIndex)

//            newCategory.colour = self.text.text ADD COLOUR PICKER
            newCategory.notes = self.textFieldCategoryNotes.text
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            closePopUp()
            updateData()
            
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
