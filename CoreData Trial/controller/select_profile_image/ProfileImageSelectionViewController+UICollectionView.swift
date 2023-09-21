//
//  ProfileImageSelectionViewController+UICollectionView.swift
//  CoreData Trial
//
//  Created by Neto Lobo on 16/09/23.
//

import Foundation
import UIKit

extension ProfileImageSelectionViewController : UICollectionViewDataSource, UICollectionViewDelegate {

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        ProfileImageList.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageCell", for: indexPath) as! CustomCollectionViewCell
        
        cell.profileImage.image = UIImage(named: ProfileImageList.images[indexPath.row])
        
        return cell
    }
    
   
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        StudentManager.student.profileImage = ProfileImageList.images[indexPath.row]
    }

}
