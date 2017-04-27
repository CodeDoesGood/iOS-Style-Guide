//
//  CodeDoesGoodiOS+UIAlert.swift
//  CodeDoesGood-iOSTemplate
//
//  Created by Christopher Myers on 4/26/17.
//  Copyright © 2017 Code Does Good. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    func featureNotImplementedAlert() {
        let alert = UIAlertController(title: "This feature is not yet implemented", message: nil, preferredStyle: .alert)
        let okayAction = UIAlertAction(title: Constants.Alerts().ok, style: .cancel, handler: nil)
        alert.addAction(okayAction)
        self.present(alert, animated: true, completion: nil)
    }
    
    func customUIAlert(title : String, message : String, buttonName: String?, action : @escaping ((UIAlertAction) -> Void?)) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: Constants.Alerts().cancel, style: .cancel, handler: nil)
        alert.addAction(cancelAction)
        
        guard let buttonName = buttonName else { return }
        
        let customButtonAction = UIAlertAction(title: buttonName, style: .default, handler: action as? (UIAlertAction) -> Void)
        alert.addAction(customButtonAction)
    }
}
