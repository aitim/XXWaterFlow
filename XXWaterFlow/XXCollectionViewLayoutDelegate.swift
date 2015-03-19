//
//  XXCollectionViewLayoutDelegate.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/16/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import Foundation
import UIKit

@objc protocol XXCollectionViewLayoutDelegate:NSObjectProtocol{
    func numberOfColumn(collectionView:UICollectionView)->Int
}