//
//  InstagramCell.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/13/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//



// Do Van Thanh
// Do Van Thanh
// Do Van Thanh
// Do Van Thanh
// Do Van Thanh
// Do Van Thanh
// Do Van Thanh
// Do Van Thanh

import UIKit

class InstagramCell: UITableViewCell {

  
    @IBOutlet weak var cursorImageView: UIImageView!
    @IBOutlet weak var iconImageView: UIImageView!
  
    @IBOutlet weak var viewContent: UIView!
    var handlePreView: ((_ imageView: UIImageView?)->())? = nil
    var handleSwitch: ((_ imageView: UIImageView?)->())? = nil
    var handleDismiss: (()->())? = nil
  
    override func awakeFromNib() {
      super.awakeFromNib()
      setupUI()
      
    }
  
  
    func setupUI(){
      iconImageView.layer.cornerRadius = 20
      iconImageView.layer.masksToBounds = true
      iconImageView.addGestureRecognizer(UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress)))
      iconImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleSwitchProfile)))
      let doubleGestureTap = UITapGestureRecognizer(target: self, action: #selector(handleDoubleTap))
      doubleGestureTap.numberOfTapsRequired = 2
      cursorImageView.addGestureRecognizer(doubleGestureTap)
      let contentView = ContentView(frame: viewContent.frame)
      viewContent.addSubview(contentView)
    }

    //MARK: - Handle Action
  
    func handleSwitchProfile(){
       switchImageView()
    }
  
    func handleLongPress(gesture: UILongPressGestureRecognizer){
      
      if gesture.state == .began {
        presentImageView()
      }else if gesture.state == .ended {
        handleDismissPresent()
      }
      
    }
  
    func handleDoubleTap(){
       presentImageView()
    }
  
    private func presentImageView(){
      
      let imageView = UIImageView(image: #imageLiteral(resourceName: "01"))
      handlePreView?(imageView)
    }
    
    private func switchImageView(){
        
      let imageView = UIImageView(image: #imageLiteral(resourceName: "01"))
      handleSwitch?(imageView)
    }
  
    private func handleDismissPresent(){
    
       handleDismiss?()
    }
  
}
