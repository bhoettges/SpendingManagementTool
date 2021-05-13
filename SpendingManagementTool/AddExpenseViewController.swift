//
//  AddExpenseViewController.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 12/05/2021.
//

import UIKit

class AddExpenseViewController: UIViewController {


    @IBOutlet weak var textFieldAmount: UITextField!
    @IBOutlet weak var textFieldNotes: UITextField!
    @IBOutlet weak var OccurenceControl: UISegmentedControl!
    @IBOutlet weak var DatePicker: UIDatePicker!
    @IBOutlet weak var switchToggleCalendar: UISwitch!
    
    @IBOutlet weak var labelCategoryName: UILabel!
    
    var category: Category?
    var expense: Expense?
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let namealert = UIAlertController (title: "Wrong Input!", message: "Please enter an amount/notes to add an expense!", preferredStyle: .alert)
    let noCategoryAlert = UIAlertController (title: "Warning", message: "Please create a Category before adding an expense.", preferredStyle: .alert)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        self.labelCategoryName.text = self.category?.name
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func saveExpense(_ sender: UIButton) {
        let newexpense = Expense(context: context)
        
        if (self.category == nil){
            noCategoryAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
            self.present(noCategoryAlert, animated: true)
        }
       
        else if (self.textFieldAmount.text == "" || self.textFieldNotes.text == ""){
                namealert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
                self.present(namealert,animated: true)
        }
        else {
            newexpense.category = category?.name
            newexpense.amount = Double(textFieldAmount.text!)!
            newexpense.notes = self.textFieldNotes.text
            newexpense.date = self.DatePicker.date
            newexpense.expenseCategory = category
            newexpense.occurrence = Int16(OccurenceControl.selectedSegmentIndex)
            newexpense.reminderflag = switchToggleCalendar.isOn
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
                
                print("expense:", newexpense)
            //update PIE CHART!
            
                
        }
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
