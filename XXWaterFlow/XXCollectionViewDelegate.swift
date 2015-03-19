//
//  XXCollectionViewDelegate.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/12/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import Foundation
import UIKit

@objc protocol XXCollectionViewDelegate:UICollectionViewDelegateFlowLayout{
    
    optional func numberOfColumn(collectionView:XXCollectionView)->Int
    
    func collectionView(collectionView: XXCollectionView, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
}