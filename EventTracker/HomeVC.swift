//
//  ViewController.swift
//  EventTracker
//
//  Created by Abhishek H P on 9/9/16.
//  Copyright © 2016 Abhishek H P. All rights reserved.
//

import UIKit
import CoreData

class HomeVC: UIViewController {

    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var userNameValLbl: UILabel!
    @IBOutlet weak var userNameExistsLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameValLbl.hidden = true
        userNameExistsLbl.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func shouldPerformSegueWithIdentifier(identifier: String, sender: AnyObject?) -> Bool {
        if identifier == "submitPressed" {
            guard let name  = userNameTxtField.text where name != ""  else {
                userNameValLbl.hidden = false
                return false
            }
            if !checkIfUserNameExists(name) {
                createUserName(name)
                return true
            } else {
                userNameExistsLbl.hidden = false
                return false
            }
        }
        return false
    }
}

func createUserName(name: String) {
    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appdelegate.managedObjectContext
    let entity = NSEntityDescription.entityForName("Person", inManagedObjectContext: context)
    let person = Person(entity: entity!, insertIntoManagedObjectContext: context)
        person.name = name
        do {
            context.insertObject(person)
            try context.save()
        }
        catch let err as NSError! {
            print(err.debugDescription)
        }

}

func checkIfUserNameExists(name: String) -> Bool {
    let appdelegate = UIApplication.sharedApplication().delegate as! AppDelegate
    let context = appdelegate.managedObjectContext
    let personFetchRequest = NSFetchRequest(entityName: "Person")
    do {
        let result = try context.executeFetchRequest(personFetchRequest) as! [Person]
        for person in result {
            print("\(person.name)")
            if person.name == name {
                return true
            }
        }
    } catch let err as NSError! {
        print(err.debugDescription)
    }
    return false
}