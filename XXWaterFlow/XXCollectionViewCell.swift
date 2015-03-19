//
//  XXCollectionViewCell.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/12/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

class XXCollectionViewCell: UICollectionViewCell {
    var scrollView:UIScrollView?
    var titleBar:UIView?
    var imageView:UIImageView?
    private var titleBarHeight:CGFloat = 40
    var indexPath:NSIndexPath?
    
    var image:UIImage?{
        didSet{
            self.imageView?.image = image
            self.setNeedsLayout()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        initParameters()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        initParameters()
    }
    
    private func initParameters(){
  
        self.layer.cornerRadius = 5
        self.clipsToBounds = true
        
        if self.scrollView == nil {
            self.scrollView = UIScrollView(frame: CGRectMake(0, 0, self.frame.width, self.frame.height - 20 ))
            self.scrollView?.userInteractionEnabled = false
            self.contentView.addSubview(scrollView!)
            
            self.scrollView?.setTranslatesAutoresizingMaskIntoConstraints(false )
            self.contentView.addConstraints([NSLayoutConstraint(item: self.scrollView!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.scrollView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.scrollView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.scrollView!, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: -titleBarHeight )])
            
            self.imageView = UIImageView(frame: self.scrollView!.frame)
            self.imageView?.contentMode = UIViewContentMode.ScaleToFill
            self.scrollView?.addSubview(self.imageView!)
        }
        if self.titleBar == nil {
            self.titleBar = UIView(frame: CGRectMake(0 , self.frame.height - 20, self.frame.width, 20 ))
            self.contentView.addSubview(titleBar!)
            self.titleBar?.backgroundColor = UIColor.whiteColor()
//            self.titleBar?.alpha = 0.5
            
            //constraints
            self.titleBar?.setTranslatesAutoresizingMaskIntoConstraints(false )
            self.contentView.addConstraints([NSLayoutConstraint(item: self.titleBar!, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.titleBar!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.scrollView!, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.titleBar!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0),
                NSLayoutConstraint(item: self.titleBar!, attribute:.Bottom, relatedBy: .Equal, toItem: self.contentView, attribute: .Bottom, multiplier: 1, constant: 0)])
        }
    }
    
    func cellSizeWithWidth(width:CGFloat)->CGSize{
        if let image = self.image{
            return CGSizeMake(width, width/image.size.width * image.size.height + self.titleBarHeight)
        }else{
            return CGSizeZero
        }
    }
    
    override func layoutSubviews() {

        if let imageView = self.imageView {
            if let scrollView = self.scrollView{
                //更新frame
                self.scrollView?.frame.size.height = self.bounds.height - self.titleBarHeight
                self.titleBar?.frame.origin.y = self.scrollView!.frame.height
                
                var width = imageView.image!.size.width
                var height = imageView.image!.size.height
                
                //计算出图片缩放后的尺寸
                var imgHeight = scrollView.frame.width / width * height
                self.imageView?.frame = CGRectMake(0, 0, scrollView.frame.width, imgHeight)
                self.scrollView?.contentSize = CGSizeMake(scrollView.frame.width, imgHeight)
            }
        }
    }
    
    
}
