//
//  UserListController.swift
//  tabby
//
//  Created by Adolphe M. on 12/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit
import Firebase

struct TrueState {
    var icon: String
    var status: String
    init(icon: String, msg: String) {
        self.icon = icon
        self.status = msg
    }
}

struct State {
    let available = TrueState(icon: "✅", msg: "Présent")
    let busy  = TrueState(icon: "🔴", msg: "Occupé")
    let absent = TrueState(icon: "🔶", msg: "Absent")
    let online = TrueState(icon: "🌀", msg: "En ligne")
}

class Card {
    var title = "Elvira"
    var icon = State().available
    var avatar = UIImage(named: "avatar1")
    
    init(title: String, icon: TrueState) {
        self.title = title
        self.icon = icon
    }
}

class CardViewCell: UITableViewCell {
    @IBOutlet var cardTitle: UILabel!
    @IBOutlet var cardIcon: UILabel!
    @IBOutlet var cardStatus: UILabel!
    @IBOutlet var cardAvatar: UIImageView!
}


class UserListController: UITableViewController {

    var headlines = [
        Card(title: "Catalina", icon: State().available),
        Card(title: "Wilson", icon: State().online),
        Card(title: "Fabian", icon: State().online),
        Card(title: "Evelien", icon: State().available),
        Card(title: "Sean", icon: State().busy),
        Card(title: "Adolphe", icon: State().absent),
        Card(title: "Ward", icon: State().absent),
        Card(title: "John", icon: State().absent),
        ]
    var users: [User]? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func calculateTrueState(from status: String) -> TrueState{
        switch status {
            case "AVAILABLE":
                return State().available
            case "BUSY":
                return State().busy
            case "ONLINE":
                return State().online
        default:
            return State().absent
        }
    }
    

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let db = Firestore.firestore()
        var headlines = [Card]()
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    let user = document.data()
                    headlines.append(Card(title: "\(String(describing: user["firstName"])) \(String(describing: user["lastName"]))", icon: self.calculateTrueState(from: user["status"] as! String)))
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
        return headlines.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CardViewCell", for: indexPath) as! CardViewCell
        
        let headline = headlines[indexPath.row]
        cell.cardTitle?.text = headline.title
        cell.cardIcon?.text = headline.icon.icon
        cell.cardStatus?.text = headline.icon.status
        cell.cardAvatar?.image = UIImage(named: "avatar" + String(indexPath.row+1))
        
        return cell
    }
}
