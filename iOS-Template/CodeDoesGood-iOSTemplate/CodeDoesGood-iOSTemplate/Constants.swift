//
//  Constants.swift
//  CodeDoesGood-iOSTemplate
//
//  Created by Christopher Myers on 4/26/17.
//  Copyright © 2017 Code Does Good. All rights reserved.
//

import Foundation

struct Constants {
    struct BaseViewController {
        var title: String?
        var infoLabel: String?
    }

    struct Global {
        var title = "CodeDoesGood"
        var error = "Error"

    }

    struct Alerts {
        var cancel = "Cancel"
        var okay = "Okay"
        var thanks = "Thank you!"
        var message: String?
        var feedback: String?

        init() {

        }

        init(message: String, feedback: String) {
            self.message = message
            self.feedback = feedback
        }
    }
}
