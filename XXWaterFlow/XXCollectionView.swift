//
//  XXCollectionView.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/12/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class XXCollectionView: UICollectionView {
    
    var columnCount:Int{
        get{
            if (self.delegate? as XXCollectionViewDelegate).respondsToSelector("numberOfColumn:") == true{
                return (self.delegate! as XXCollectionViewDelegate).numberOfColumn!(self)
            }else{
                return 1
            }
        }
    }
    
    var columnWidth:CGFloat{
        get{
            return (self.frame.width - CGFloat(columnCount + 1)*margin)/CGFloat(columnCount)
        }
    }
    
    var margin:CGFloat = 10
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initParameters()
    }
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        
        initParameters()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initParameters()
    }
    
    private func initParameters(){
       
    }
   
    
    
}
