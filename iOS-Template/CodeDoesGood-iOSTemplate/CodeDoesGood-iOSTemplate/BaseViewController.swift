//
//  BaseViewController.swift
//  CodeDoesGood-iOSTemplate
//
//  Created by Christopher Myers on 4/12/17.
//  Copyright © 2017 Code Does Good. All rights reserved.
//

import UIKit
// import Keys

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    //    let keys = CodeDoesGoodIOSTemplateKeys()
    //    print(keys.networkAPIToken)
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
