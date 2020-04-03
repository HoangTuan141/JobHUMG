//
//  ExtensionUILabel.swift
//  jobHUMG
//
//  Created by Hoàng Tuấn on 4/3/20.
//  Copyright © 2020 TuanHA-D1. All rights reserved.
//

import Foundation
import UIKit

extension UILabel {
    func underlineAttribute(text: String) {
        let underlineAttribute = [NSAttributedString.Key.underlineStyle: NSUnderlineStyle.single.rawValue]
        let underline = NSAttributedString(string: text, attributes: underlineAttribute)
        self.attributedText = underline
    }
}
