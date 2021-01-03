//
//  ViewController.swift
//  MultiWindowForIPadTutorial
//
//  Created by Drink Sirichai on 30/11/2563 BE.
//  Copyright © 2563 Drink Sirichai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!

    private var users: [User]!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        users = prepareData()

        title = "UserList"

        collectionView.register(UINib(nibName: "UserCollectionViewCell", bundle: .main), forCellWithReuseIdentifier: "UserCollectionViewCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func prepareData() -> [User] {

        var users: [User] = []

        for i in 1...10 {
            users.append(.init(name: "name of \(i)"))
        }

        return users
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let detailVC = DetailViewController(nibName: "DetailViewController", bundle: nil)

        detailVC.user = users[indexPath.row]

        navigationController?.pushViewController(detailVC, animated: true)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.bounds.width, height: 60)
    }
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return users.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let model = users[indexPath.row]

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UserCollectionViewCell", for: indexPath) as! UserCollectionViewCell

        cell.nameLabel.text = model.name

        return cell
    }
}
