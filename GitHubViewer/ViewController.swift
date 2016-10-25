//
//  ViewController.swift
//  GitHubViewer
//
//  Created by Rahman, Munaz on 2016-10-11.
//  Copyright © 2016 Rahman, Munaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    // MARK: Properties
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var searchButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.isEnabled = false
        usernameTextField.delegate = self;
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: TextField Delegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if checkValidUsername() {
            print("Username valid : " + textField.text!)
        } else {
            print("Username invalid")
        }
    }
    
    func checkValidUsername() -> Bool {
        let username = usernameTextField.text ?? ""
        searchButton.isEnabled = !username.isEmpty
        
        return !username.isEmpty
    }
    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if (checkValidUsername()) {
            let username = usernameTextField.text ?? ""
            let nav = segue.destination as! UINavigationController
            let userViewController = nav.topViewController as! UserViewController
            
            userViewController.username = username
        }
    }
    
}
