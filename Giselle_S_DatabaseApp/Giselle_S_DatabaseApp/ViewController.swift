//
//  ViewController.swift
//  Giselle_S_DatabaseApp
//
//  Created by Giselle Salgado on 8/12/20.
//  Copyright © 2020 Giselle Salgado. All rights reserved.
//

import UIKit
import Foundation
import CoreData

class ViewController: UIViewController {
    
    
    @IBAction func saveRecordButton(_ sender: Any) {
        var dataManager : NSManagedObjectContext!
        var listArray = [NSManagedObject]()
    }
    
    
    @IBAction func deleteRecordButton(_ sender: Any) {
    }
    
    
    
    @IBOutlet weak var enterPhotoDescription: UITextField!
    
    
    
    @IBOutlet weak var displayDataHere: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        dataManager = appDelegate.persistentContainer.viewContext
        displayDataHere.text?.removeAll()
        fetchData()
    }

    
    func fetchData(){
        let fetchRequest : NSFetchRequest<NSFetchRequestResult> = NSFetchRequest(entityName: "Item")
        do{
            let result = try dataManager.fetch(fetchRequest)
            listArray = result as! [NSManagedObject]
            for item in listArray{
                let product = item.value(forKey:"about") as! String
                displayDataHere.text! += product
            }
        } catch {
            print("Error retreiving data")
        }
    }

}

