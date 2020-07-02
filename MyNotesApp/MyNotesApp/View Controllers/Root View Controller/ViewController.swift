//
//  ViewController.swift
//  MyNotesApp
//
//  Created by Somya on 26/06/20.
//  Copyright © 2020 Somya. All rights reserved.
//
import CoreData
import UIKit

class ViewController: UIViewController {

    private var coreDataManager = CoreDataManager(modelName: "Notes")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setCoreData()
    }

   //function to setUp CoreData
    func setCoreData() {
        
        //getting entity description
        if let entityDesc = NSEntityDescription.entity(forEntityName: "Note", in: coreDataManager.managedObjectContext) {
       //initializing managed object
            let note = NSManagedObject(entity: entityDesc, insertInto: coreDataManager.managedObjectContext)
        
      //configuring managed object
            note.setValue("My First Note", forKey: "title")
            note.setValue(NSDate(), forKey: "createdAt")
            note.setValue(NSDate(), forKey: "updatedAt")
            
            if let title = note.value(forKey: "title") as? String {
                print(title)
            }
      //saving managedObjectContext to the persistence Store
            do {
                try coreDataManager.managedObjectContext.save()
            } catch {
                print("Unable to save managed object context!")
            }
     }
    
  }

}
