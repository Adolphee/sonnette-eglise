//
//  SignUpViewController.swift
//  tabby
//
//  Created by Adolphe M. on 12/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit
import FirebaseAuth
import Firebase

class SignUpViewController: UIViewController {

    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBAction func signUpEvent(_ sender: UIButton) {
        // Validation
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        } else {
            // Persistence
            Auth.auth().createUser(withEmail: <#T##String#>, password: <#T##String#>, completion: { (res, err) in
                if err != nil {
                    self.showError("Error creating user.")
                }
            })
            // Segue to homescreen
        }
    }
    
    func showError(_ message: String){
        errorMessageLabel.text = message
        errorMessageLabel.alpha = 1
    }
    
    func validateFields() -> String? {
        if firstNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || lastNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
        {
            return "Please fill in all fields."
        }
        
        let cleanPass = passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines)
        if !Utilities.isPasswordValid(cleanPass!) {
           return "please make sure your password contains at least 8 characters contains at least a special character and a number."
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpElements()
        // Do any additional setup after loading the view.
    }
    

    func setUpElements(){
        errorMessageLabel.alpha = 0 // Hide
        Utilities.styleTextField(firstNameTextField)
        Utilities.styleTextField(lastNameTextField)
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(signUpButton)
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
