//
//  CategoryDetailViewController.swift
//  SpendingManagementTool
//
//  Created by Balthasar Hoettges on 11/05/2021.
//

import UIKit
import CoreData

class CategoryDetailViewController: UIViewController, NSFetchedResultsControllerDelegate{

    @IBOutlet weak var labelCategoryName: UILabel!
    @IBOutlet weak var labelCategoryMonthlyBudget: UILabel!
    
    var categoryName = ""
    var categoryMonthlyBudget = ""
    var category:Category?
    
    var expenses = [Expense]()
    
    let managedObjectContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var _fetchedResultsController: NSFetchedResultsController<Expense>? = nil
    
    var fetchedResultsController: NSFetchedResultsController<Expense> {
        if _fetchedResultsController != nil {
            return _fetchedResultsController!
        }
        
        //build the fetch request
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        let sortDescriptor = NSSortDescriptor(key: "amount", ascending: true, selector: #selector(NSString.localizedStandardCompare(_:)))
        //add the sort to the request
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        let predicate = NSPredicate(format: "category = %@", categoryName)
        fetchRequest.predicate = predicate

        let aFetchedResultsController = NSFetchedResultsController<Expense>(
            fetchRequest: fetchRequest,
            managedObjectContext: managedObjectContext, sectionNameKeyPath: #keyPath(Expense.category),cacheName: nil)
        //set the delegate
        aFetchedResultsController.delegate = self
        
        _fetchedResultsController = aFetchedResultsController
        
        //preform the fetch
        do {
            try _fetchedResultsController!.performFetch()
            
        } catch{
          let nserror = error as NSError
            fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
        
        }
        
        return _fetchedResultsController!
    }
    func getRandomColor() -> UIColor {
         //Generate between 0 to 1
         let red:CGFloat = CGFloat(drand48())
         let green:CGFloat = CGFloat(drand48())
         let blue:CGFloat = CGFloat(drand48())

         return UIColor(red:red, green: green, blue: blue, alpha: 1.0)
    }
    
    let pieChartView = PieChartView()
    
    var sumOfExpenses = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        expenses = fetchedResultsController.fetchedObjects!
        
        for (index, expense) in expenses.enumerated() {
            print("Amount \(index):",expense.amount)
            
            sumOfExpenses = sumOfExpenses+expense.amount
        }
        print("Sum of Expenses: ",sumOfExpenses)
        print("    ")
        let padding: CGFloat = 20
            let height = (view.frame.height - padding * 3) / 2

        
        labelCategoryName.text = categoryName
        labelCategoryMonthlyBudget.text = categoryMonthlyBudget
        
        pieChartView.frame = CGRect(
             x: 0, y: 0,//height + padding * 2,
             width: view.frame.size.width, height: height
           )

           pieChartView.segments = [
//             Segment(color: .red,    value: 1),
//             Segment(color: .blue,   value: 2),
//             Segment(color: .green,   value: 10),
           ]
        for (index, expense) in expenses.enumerated() {
            pieChartView.segments.append(Segment(color: getRandomColor(), value: CGFloat(expense.amount)))
            
        }
        
        
           view.addSubview(pieChartView)
        
        
        // Do any additional setup after loading the view.
    }
    
    
    // 1. Fetch total budget from category
    // 2. Fetch all expenses
    // 3. Add expenses
    // 4. remaining: create segment
    // 4a. spent: create segments per expense
    // 4b. segment per expense
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
