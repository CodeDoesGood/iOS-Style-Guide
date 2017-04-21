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


extension UIAlertController {
    func featureNotImplementedAlert() {
        let alert = UIAlertController(title: "This feature is not yet implemented", message: nil, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: "OK", style: .cancel, handler: nil)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func customUIAlert(title : String, message : String, buttonName: String?, action : @escaping ((UIAlertAction) -> Void?)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        guard let buttonName = buttonName else { return }
        
        let customButtonAction = UIAlertAction(title: buttonName, style: .default, handler: action as? (UIAlertAction) -> Void)
        alert.addAction(customButtonAction)
    }
}
