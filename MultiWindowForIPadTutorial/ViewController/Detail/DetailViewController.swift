//
//  DetailViewController.swift
//  MultiWindowForIPadTutorial
//
//  Created by Drink Sirichai on 30/11/2563 BE.
//  Copyright © 2563 Drink Sirichai. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    var user: User?

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "User Detail"

        guard let user = user else { return }

        nameLabel.text = user.name
    }
}
