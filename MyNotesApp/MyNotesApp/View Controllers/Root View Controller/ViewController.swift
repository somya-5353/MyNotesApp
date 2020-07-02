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

    
    @IBOutlet weak var buttonView: UIView!
    
    @IBOutlet weak var floatingButton: UIButton!
    
    private var coreDataManager = CoreDataManager(modelName: "Notes")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buttonView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        self.buttonView.layer.cornerRadius = 170.0
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
   
    func animateView(isHidden: Bool) {
        
        UIView.animate(withDuration: 0.3, delay: 0.05, options: .curveEaseOut, animations: {
            self.buttonView.isHidden = isHidden
        }, completion: nil)
    }
    
    func beginTracking() {
        
        UIView.animate(withDuration: 0.3, animations: {
            if(self.floatingButton.alpha == 1) {
            self.floatingButton.alpha = 0.7
            } else {
                self.floatingButton.alpha = 1
            }
            if(self.floatingButton.transform == .identity) {
            self.floatingButton.transform = CGAffineTransform(rotationAngle: 45 * (.pi/180))
                self.buttonView.transform = .identity
            } else {
                self.floatingButton.transform = .identity
                self.buttonView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
            }
        })
        
    }
    
    func endTracking() {
        
        UIView.animate(withDuration: 0.3, animations: {
            self.floatingButton.alpha = 1
        })
        print(self.floatingButton.state)
        self.floatingButton.setImage(UIImage(named: "cross"), for: .normal)
    }
    
    @IBAction func onTapFloatingButton(_ sender: Any) {
        
        self.beginTracking()
        
    }
    
    
}
