//
//  ContentView.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/14/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit


class ContentView: UIView {
  
  
  let cellid = "cellid"
  
  lazy var collectionView: UICollectionView = {
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
    cv.delegate = self
    cv.dataSource = self
    return cv
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    collectionView.isPagingEnabled = true
    collectionView.backgroundColor = .white
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: cellid)
    collectionView.showsHorizontalScrollIndicator = false
    addSubview(collectionView)
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":collectionView]))
    
    
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  
}


extension ContentView: UICollectionViewDelegate,UICollectionViewDataSource {
  
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellid, for: indexPath)
    let index = indexPath.row
    
    switch index {
      
        case 0:
          cell.backgroundView = UIImageView(image: #imageLiteral(resourceName: "01"))
          break
        case 1:
          cell.backgroundView = UIImageView(image: #imageLiteral(resourceName: "message"))
          break
        default:
          break
    }
    return cell
  }
}

extension ContentView: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 0
  }
  
  
}
