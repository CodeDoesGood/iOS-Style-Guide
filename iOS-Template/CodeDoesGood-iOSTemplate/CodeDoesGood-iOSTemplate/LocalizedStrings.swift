//
//  LocalizedStrings.swift
//  CodeDoesGood-iOSTemplate
//
//  Created by Eric Kenny on 4/27/17.
//  Copyright © 2017 Code Does Good. All rights reserved.
//

/**
 Localized string with args example
 
 static func greeting(with name: String) -> String {
    let string =  NSLocalizedString("Hello %@", comment: "Hello { name }")
    return String(format: string, name)
 }
*/

import Foundation

struct LocalizedStrings {
    struct Alerts {
        static func cancel() -> String {
            return String(format: NSLocalizedString("cancel", comment: "Cancel button"))
        }

        static func okay() -> String {
            return String(format: NSLocalizedString("okay", comment: "Okay (acknowledgement / proceeed) button"))
        }

        static func thanks() -> String {
            return String(format: NSLocalizedString("thank you", comment: "Thank you button"))
        }
    }
}
