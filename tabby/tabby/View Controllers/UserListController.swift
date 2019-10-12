//
//  UserListController.swift
//  tabby
//
//  Created by Adolphe M. on 12/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit

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

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
