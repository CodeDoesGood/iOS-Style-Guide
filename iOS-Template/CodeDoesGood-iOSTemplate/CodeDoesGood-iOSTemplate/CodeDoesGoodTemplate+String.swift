//
//  CodeDoesGoodTemplate+String.swift
//  
//
//  Created by Christopher Myers on 4/26/17.
//
//

import Foundation

extension String {
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
}
