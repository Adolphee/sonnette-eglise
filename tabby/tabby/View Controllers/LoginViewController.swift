//
//  LoginViewController.swift
//  tabby
//
//  Created by Adolphe M. on 12/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseCore

class LoginViewController: UIViewController {
    static var user: User?
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBAction func loginEvent(_ sender: UIButton) {
        // Validation
        let error = validateFields()
        
        if error != nil {
            showError(error!)
        } else {
            let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            Auth.auth().signIn(withEmail: email, password: password){ (res, err)
                in if err != nil {
                    self.showError("Invalid username or password.")
                } else {
                    LoginViewController.user = res?.user
                    self.transitionToHomeScreen()
                }
            }
        }
    }
    
    func showError(_ message: String){
           errorMessageLabel.text = message
           errorMessageLabel.alpha = 1
       }
       
       func validateFields() -> String? {
           if  emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
           {
               return "Please fill in all fields."
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
        Utilities.styleTextField(emailTextField)
        Utilities.styleTextField(passwordTextField)
        Utilities.styleFilledButton(loginButton)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func transitionToHomeScreen(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.Storyboard.homeViewController) as? UITabBarController
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }

}
