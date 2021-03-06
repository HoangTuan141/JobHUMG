//
//  ExtensionDate.swift
//  Mock
//
//  Created by TuanHA-D1 on 12/19/19.
//  Copyright © 2019 TuanHA-D1. All rights reserved.
//

import Foundation
import UIKit

extension Date {
    enum StyleDate: String {
        case dayAndDate = "EEE yyyy/MM/dd"
        case dateOnly = "yyyy/MM/dd"
        case hourOnly = "HH:mm a"
        case dateAndHour = "yyyy/MM/dd HH:mm"
        case dateAndTime = "yyyy/MM/dd HH:mm:ss"
        case full = "EEE yyyy/MM/dd HH:mm"
        case fullTime = "EEE yyyy/MM/dd HH:mm:ss"
        case dayMonthYear = "dd/MM/yyyy"
        case yearMonth = "yyyy-MM"
        case dateOnlyFromServer = "yyyy-MM-dd"
        case dateTime = "dd/MM/yyyy HH:mm"
        case dateTimeFromServer = "yyyy-MM-dd HH:mm:ss"
        case dateHourMinuteServer = "yyyy-MM-dd HH:mm"
        case monthYear = "MM/yyyy"
        case timeOnly = "HH:mm"
        case ggFull = "yyyy-MM-dd'T'HH:mm:ssZ"
        case concurrenceEvent = "yyyyMMdd'T'HHmmssZ"
    }
    
    func toString(formatter: Date.StyleDate) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = formatter.rawValue
        let dateString = dateFormatter.string(from: self)
        return dateString
    }
}
