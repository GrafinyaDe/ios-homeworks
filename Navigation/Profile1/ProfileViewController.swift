//
//  ProfileViewController.swift
//  Navigation
//
//  Created by apple on 13.04.2022.
//

import UIKit

class ProfileViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
    }
    override func viewWillLayoutSubviews() {
        let header = ProfileHeaderView()
        view.addSubview(header)
        header.frame = view.frame
        header.addView()
        
    }
    
}
