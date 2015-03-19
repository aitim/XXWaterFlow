//
//  XXCollectionViewLayout.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/12/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class XXCollectionViewLayout: UICollectionViewFlowLayout {
    private var cellAttributes:[XXCollectionViewLayoutAttributes] = []
    //    private var columnHeights:[CGFloat] = [] //保存每一列的高度
    
    override var collectionView:XXCollectionView?{
        get{
            return super.collectionView as? XXCollectionView
        }
    }
    
    override func prepareLayout() {
        NSLog("prepare")
        
        super.prepareLayout()
        
        //初始化各cell的attributes
        var columnHeights:[CGFloat] = [] //记录每一列的高度
        for i in 0..<self.collectionView!.columnCount{
            columnHeights.append(0)
        }
        
        var section = 0
        var itemCount = self.collectionView!.numberOfItemsInSection(section)
        for i in 0..<itemCount{
            var size:CGSize = (self.collectionView!.delegate! as XXCollectionViewDelegate).collectionView(self.collectionView!, sizeForItemAtIndexPath: NSIndexPath(forItem:i, inSection: section))
            //找出高度最小的列
            var minColumnHeight:CGFloat = CGFloat.max
            var minColumnIndex:Int = 0
            for j in 0..<self.collectionView!.columnCount{
                if minColumnHeight > columnHeights[j]{
                    minColumnHeight = columnHeights[j]
                    minColumnIndex = j
                }
            }
            columnHeights[minColumnIndex] = minColumnHeight + (size.height + self.collectionView!.margin)
            //得到cell的frame
            var frame = CGRectMake(CGFloat(minColumnIndex+1)*self.collectionView!.margin + CGFloat(minColumnIndex)*size.width, minColumnHeight + self.collectionView!.margin, size.width, size.height)
            
            var attributes = XXCollectionViewLayoutAttributes(forCellWithIndexPath: NSIndexPath(forItem: i , inSection: section))
            attributes.frame = frame
            attributes.alpha = 1
            
//            NSLog("cell \(i) frame:\(frame) heights:\(columnHeights)")
            self.cellAttributes.append(attributes)
        }
    }
    
    //返回collectionView的内容的尺寸
    override func collectionViewContentSize() -> CGSize {
        NSLog("返回contentSize")
        
        var height:CGFloat = 0
        for i in 0..<self.cellAttributes.count{
            if (self.cellAttributes[i].frame.height+self.cellAttributes[i].frame.origin.y) > height {
                height = (self.cellAttributes[i].frame.height + self.cellAttributes[i].frame.origin.y)
            }
        }
        
        return CGSizeMake(self.collectionView!.frame.width, height + self.collectionView!.margin)
    }
    //返回rect中的所有的元素的布局属性
    override func layoutAttributesForElementsInRect(rect: CGRect) -> [AnyObject]? {
        NSLog("返回rect中的所有的元素的布局属性")
       
        var attributes:[UICollectionViewLayoutAttributes] = []
        for i in 0..<self.cellAttributes.count{
            if CGRectIntersectsRect(rect, self.cellAttributes[i].frame){
                attributes.append(self.cellAttributes[i])
            }
        }
        return attributes
    }
    //返回对应于indexPath的位置的cell的布局属性
    override func layoutAttributesForItemAtIndexPath(indexPath: NSIndexPath) -> UICollectionViewLayoutAttributes! {
        NSLog("返回对应于indexPath的位置的cell的布局属性")
        return self.cellAttributes[indexPath.item]
    }
    
}
