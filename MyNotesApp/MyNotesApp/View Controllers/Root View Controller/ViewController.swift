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
    
    
    @IBOutlet weak var themeButton: UIButton!
    @IBOutlet weak var buttonView: UIView!
    @IBOutlet weak var addNoteButton: UIButton!
    @IBOutlet weak var floatingButton: UIButton!
    @IBOutlet weak var notificationButton: UIButton!
    
    private var coreDataManager = CoreDataManager(modelName: "Notes")
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setUpButtonMenu()
        self.setCoreData()
    }
    
    //function for initial settings of the button menu
    func setUpButtonMenu() {
        
        self.buttonView.transform = CGAffineTransform(scaleX: 0.001, y: 0.001)
        self.buttonView.layer.cornerRadius = 170.0
        self.addNoteButton.transform = CGAffineTransform(translationX: 15, y: 15)
        self.notificationButton.transform = CGAffineTransform(translationX: 15, y: 15)
        self.themeButton.transform = CGAffineTransform(translationX: 15, y: 15)
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
            self.animateMenuButtons()
        })
        
    }
    
    func animateMenuButtons() {
        
        UIView.animate(withDuration: 0.5, delay: 0.25, usingSpringWithDamping: 0.3, initialSpringVelocity: 0, options: [], animations: {
            
            if(self.addNoteButton?.transform == .identity) {
                self.addNoteButton.transform = CGAffineTransform(translationX: 15, y: 15)
            } else {
                self.addNoteButton.transform = .identity
            }
            if(self.notificationButton?.transform == .identity) {
                self.notificationButton.transform = CGAffineTransform(translationX: 15, y: 15)
            } else {
                self.notificationButton.transform = .identity
            }
            if(self.themeButton?.transform == .identity) {
                self.themeButton.transform = CGAffineTransform(translationX: 15, y: 15)
            } else {
                self.themeButton.transform = .identity
            }
        }, completion: nil)
    }
    
    @IBAction func onTapFloatingButton(_ sender: Any) {
        
        self.beginTracking()
        
    }
    
    
}
