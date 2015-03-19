//
//  XXViewController.swift
//  XXWaterFlow
//
//  Created by xin.xin on 3/16/15.
//  Copyright (c) 2015 aitim. All rights reserved.
//

import UIKit

let reuseableIdentifier = "cell"

class XXViewController: UIViewController,XXCollectionViewDelegate,XXCollectionViewDataSource {
    var collectionView:XXCollectionView?

    private var images:[String] = ["1.jpg","2.jpg","3.jpg","4.jpg","5.jpg","6.jpg","7.jpg","8.jpg","9.jpg","10.jpg","11.jpg","12.jpg","13.jpg","1.jpg","7.jpg","8.jpg","9.jpg",]
    private var columnCount:Int = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.yellowColor()
        
        var layout = XXCollectionViewLayout()
        self.collectionView = XXCollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        self.collectionView?.backgroundColor = UIColor(red: 0.914, green: 0.914, blue: 0.914, alpha: 1.00)
        self.collectionView?.delegate = self
        self.collectionView?.dataSource = self
        
        self.collectionView?.registerClass(XXCollectionViewCell.self , forCellWithReuseIdentifier: reuseableIdentifier)
        self.view.addSubview(self.collectionView!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /**** Delegate and DataSource ***/
    func numberOfColumn(collectionView: XXCollectionView) -> Int {
        return columnCount
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.images.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseableIdentifier, forIndexPath: indexPath) as XXCollectionViewCell
        cell.backgroundColor = UIColor.grayColor()
        cell.image = UIImage(named: self.images[indexPath.row])
        cell.indexPath = indexPath
        return cell
    }
    
    func collectionView(collectionView: XXCollectionView, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        var width = (collectionView.frame.width - CGFloat(columnCount + 1)*collectionView.margin)/CGFloat(columnCount)
        
        var image = UIImage(named: self.images[indexPath.row])

        var height = image!.size.height * width / image!.size.width
        
        return CGSizeMake(width,height+40)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
