//
//  TabBarController.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/14/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController,UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }

    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {
      
      if let nav = viewController as? UINavigationController {
        if let vc = nav.viewControllers.first as? ViewController {
          let indexPath = IndexPath(item: 0, section: 0)
          vc.tableView.scrollToRow(at: indexPath, at: .none, animated: true)
        }
      }
    
    
    
  }
  
  
}
