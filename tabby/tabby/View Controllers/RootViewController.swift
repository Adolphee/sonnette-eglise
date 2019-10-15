//
//  RootViewController.swift
//  tabby
//
//  Created by Adolphe M. on 13/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit

struct Todo: Decodable {
    let userId, id: Int
    let title: String
    let completed: Bool
}

class RootViewController: UIViewController {
    @IBOutlet weak var signUpButton: UIButton!
    @IBOutlet weak var loginButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchTodos { (todos, err) in
            if let err = err {
                print("FAILED: \(err)"); return
            }
            
            todos?.forEach({
                (todo) in print(todo.title)
            })
        }
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
    
    fileprivate func fetchTodos(completion: @escaping ([Todo]?, Error?) -> ()) {
        let urlString = "https://jsonplaceholder.typicode.com/todos/"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let err = error {
                 completion(nil, err)
                return
               }
            do{
                let todos = try JSONDecoder().decode([Todo].self, from: data!)
                completion(todos, nil)
            } catch let jsonError {
                completion(nil, jsonError)
            }
               }.resume()
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
