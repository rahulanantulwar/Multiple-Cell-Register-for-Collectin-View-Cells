//
//  TableViewCellForFirstSection.swift
//  MultipleCellRegisterInCollectionViewAndTableView
//
//  Created by Rahul Anantulwar on 10/8/18.
//  Copyright © 2018 Rahul Anantulwar. All rights reserved.
//

import UIKit

class TableViewCellForFirstSection: UITableViewCell {

    @IBOutlet var collectionView: UICollectionView!
    fileprivate let sectionInsets = UIEdgeInsets(top: 5.0, left: 10.0, bottom: 5.0, right: 10.0)
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(UINib(nibName: "CollectionViewCellForSection1", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCellForSection1")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

extension TableViewCellForFirstSection: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCellForSection1", for: indexPath) as! CollectionViewCellForSection1
        cell.imageView.image = #imageLiteral(resourceName: "Glucoma")
        cell.name.text = "By Matthew E from AAO"
        cell.date.text = "Sep 05 2018"
        return cell
    }
}

extension TableViewCellForFirstSection: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let itemsPerRow:CGFloat = 1
        let hardCodedPadding:CGFloat = 5
        let itemWidth = ((collectionView.frame.size.width - 60) / itemsPerRow) - hardCodedPadding
        let itemHeight = collectionView.frame.size.height - 20.0
        let itemWidth2 = ((collectionView.frame.size.width - 20) / itemsPerRow) - hardCodedPadding
        let itemHeight2 = collectionView.frame.size.height - 20.0
        let orientation = UIApplication.shared.statusBarOrientation
        
        if(orientation == .landscapeLeft || orientation == .landscapeRight)
        {
            print("********************************In Landscape mode:- \(collectionView)")
            return CGSize(width: itemWidth2, height: itemHeight2)
        } else {
            print("*********************************In portrait mode:- \(collectionView)")
            //collectionView.reloadData()
            return CGSize(width: itemWidth, height: itemHeight)
        }
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
}
