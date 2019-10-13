//
//  RootViewController.swift
//  tabby
//
//  Created by Adolphe M. on 13/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addBackground(withBlur: true)
        setUpElements()
        loginButton.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        loginButton.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    @IBAction func buttonPressed(_ sender: UIButton) {
        self.navigationController?.overrideUserInterfaceStyle = .light
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
           return .lightContent
       }
    
    func setUpElements(){
        Utilities.styleFilledButton(signUpButton)
        Utilities.styleHollowButton(loginButton)
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
