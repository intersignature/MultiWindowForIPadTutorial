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

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        view.window?.windowScene?.userActivity = user?.activity
    }

       override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)

        view.window?.windowScene?.userActivity = nil
    }

    func setupForMultipleWindow() {

        let leftBackButton = UIBarButtonItem(title: "Done", style: .done, target: self, action: #selector(removeFromScene))
        navigationItem.leftBarButtonItem = leftBackButton
    }

    @objc private func removeFromScene() {

        guard let session = view.window?.windowScene?.session else { return }
        let option = UIWindowSceneDestructionRequestOptions()

        UIApplication.shared.requestSceneSessionDestruction(session, options: option)
    }
}
