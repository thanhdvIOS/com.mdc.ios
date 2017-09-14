//
//  SwitchController.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/14/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class SwitchController: UIViewController {

    
    var imageView: UIImageView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let iv = imageView {
            iv.frame = view.frame
            view.addSubview(iv)
        }
        

    }


}
