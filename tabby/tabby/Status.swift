//
//  Status.swift
//  tabby
//
//  Created by Adolphe M. on 12/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import Foundation
import UIKit

struct Status {
    var message = String.uppercased("En Ligne")()
    let colors = [#colorLiteral(red: 0.5519025922, green: 0.09252373129, blue: 0.08709152788, alpha: 1), #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), #colorLiteral(red: 0.08417192847, green: 0.329955548, blue: 0.7506465316, alpha: 1), #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)]
    var index: Int = 0
    var tint: UIColor = .black
    var color: UIColor {
        didSet {
            tint = .white
            switch color {
            case #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1):
                message = String.uppercased("Présent")()
                tint = #colorLiteral(red: 0.1294117719, green: 0.2156862766, blue: 0.06666667014, alpha: 1)
            case #colorLiteral(red: 0.5519025922, green: 0.09252373129, blue: 0.08709152788, alpha: 1):
                message = String.uppercased("Occupé")()
                tint = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
            case #colorLiteral(red: 0.08417192847, green: 0.329955548, blue: 0.7506465316, alpha: 1):
                message = String.uppercased("En Ligne")()
                tint = #colorLiteral(red: 0.4745098054, green: 0.8392156959, blue: 0.9764705896, alpha: 1)
            default:
                message = String.uppercased("Absent")()
                tint = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
        }
    }
}
