//
//  ViewController.swift
//  InstagramAccelerator
//
//  Created by OminextMobile on 9/13/17.
//  Copyright © 2017 OminextMobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let cellid = "cellid"
  let height = UIScreen.main.bounds.height
  let blackView = UIView()
  
  lazy var tableView: UITableView = {
    
    let tbv = UITableView()
    tbv.translatesAutoresizingMaskIntoConstraints = false
    tbv.delegate = self
    tbv.dataSource = self
    return tbv
    
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .white
    navigationItem.title = "Instagram"
    setupNavigationBar()
    setupTableView()
  }
  
  //MARK: - Setup UI
  
  func setupTableView(){
    
    tableView.register(UINib(nibName: "InstagramCell", bundle: nil), forCellReuseIdentifier: cellid)
    tableView.separatorStyle = .none
    tableView.allowsSelection = false
    tableView.showsVerticalScrollIndicator = false
    view.addSubview(tableView)
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
    view.addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[v0]|", options: NSLayoutFormatOptions(), metrics: nil, views: ["v0":tableView]))
  }
    
  func setupNavigationBar(){
    let imageCamera = UIImage(named: "photo-camera")?.withRenderingMode(.alwaysTemplate)
    let imageCusor = UIImage(named: "cursor")?.withRenderingMode(.alwaysTemplate)
    let leftBar = UIBarButtonItem(image: imageCamera, style: .plain, target: self, action: #selector(handleLeftBar))
    let rightBar = UIBarButtonItem(image: imageCusor, style: .plain, target: self, action: #selector(handleRightBar))
    navigationItem.leftBarButtonItem = leftBar
    navigationItem.rightBarButtonItem = rightBar
    leftBar.tintColor = .black
    rightBar.tintColor = .black
  }
  
  //MARK: - Setup Action
  
  func handleLongGesture(imageView: UIImageView){
    
    if let window = UIApplication.shared.keyWindow {
      
      blackView.backgroundColor = UIColor(white: 0.5, alpha: 0.5)
      blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleDismiss)))
      window.addSubview(blackView)
      blackView.frame = window.frame
      blackView.alpha = 0
      imageView.translatesAutoresizingMaskIntoConstraints = false
      blackView.addSubview(imageView)
      imageView.centerXAnchor.constraint(equalTo: blackView.centerXAnchor).isActive = true
      imageView.centerYAnchor.constraint(equalTo: blackView.centerYAnchor).isActive = true
      imageView.widthAnchor.constraint(equalTo: blackView.widthAnchor, multiplier: 0.6).isActive = true
      imageView.heightAnchor.constraint(equalTo: blackView.heightAnchor, multiplier: 0.3).isActive = true
      
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
        
        self.blackView.alpha = 1
      }, completion: nil)
    }

  }
  
  func handleDismiss(){
    
    UIView.animate(withDuration:0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
      
      self.blackView.alpha = 0
    }, completion: nil)
    
  }
    
  func handleSwitch(imageView: UIImageView){
    let switchVC = SwitchController()
    switchVC.imageView = imageView
    navigationController?.pushViewController(switchVC, animated: true)
    
  }
  
  func handleLeftBar(){
    
  }
  
  func handleRightBar(){
    
  }
  

}

//MARK: - Setup UITableViewDelegate,UITableViewDataSource

extension ViewController: UITableViewDelegate,UITableViewDataSource {
  
  func scrollViewShouldScrollToTop(_ scrollView: UIScrollView) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 5
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as! InstagramCell
    cell.handlePreView = { imageView in
      self.handleLongGesture(imageView: imageView!)
    }
    cell.handleSwitch = { imageView in
      self.handleSwitch(imageView: imageView!)
    }
    cell.handleDismiss = {
      self.handleDismiss()
    }
    return cell
  }
 
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 0.9*height
  }
  
}




