//
//  BaseViewController.swift
//  CodeDoesGood-iOSTemplate
//
//  Created by Christopher Myers on 4/12/17.
//  Copyright © 2017 Code Does Good. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    func dismissKeyboardWhenTapped() {
        let tap = UIGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc private func hideKeyboard() {
        view.endEditing(true)
    }
}


