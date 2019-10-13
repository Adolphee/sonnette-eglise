//
//  FirstViewController.swift
//  tabby
//
//  Created by Adolphe M. on 11/10/2019.
//  Copyright © 2019 Adolphe M. All rights reserved.
//

import UIKit
import Firebase

class FirstViewController: UIViewController {

    @IBOutlet var statusBtn: RoundButton!
    var status = Status(color: .darkGray)
    
    @IBAction func statusChange(_ sender: UIButton) {
        status.index += (status.index < 3 ? 1 : -3)
        
        // TODO: Update status in Firebase
        // TODO: Notify other users
        
        updateStatusButton()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        status.index = 2; // start with blue
        statusBtn.borderWidth = 5
        statusBtn.cornerRadius = 75
        statusBtn.borderColor = .white
        self.view.addBackground(withBlur: true)
        updateStatusButton()
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    func updateStatusButton(){
        status.color = status.colors[status.index]
        statusBtn.setTitle(status.message, for: .normal)
        statusBtn.backgroundColor = status.color
        statusBtn.tintColor = status.tint
    }

}

extension UIView {
    func addBackground(withBlur please: Bool) {
        // screen width and height:
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height

        let imageViewBackground = UIImageView(frame: CGRect(x:0, y:0, width: width, height: height))
        imageViewBackground.layer.zPosition = -5;
        if(please) {
            imageViewBackground.blur(style: .systemUltraThinMaterialDark)
        }
        imageViewBackground.image = UIImage(named: "christ1")

        // you can change the content mode:
        imageViewBackground.contentMode = UIView.ContentMode.scaleAspectFill

        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
    
    // Blur any UIView element
    func blur(style: UIBlurEffect.Style){
        let blurEffect = UIBlurEffect(style: style)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = self.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.addSubview(blurEffectView)
    }

}



