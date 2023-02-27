//
//  Decimal+Ext.swift
//  Bankey
//
//  Created by Furkan Sarı on 27.02.2023.
//

import Foundation

extension Decimal {
    var doubleValue : Double {
        return NSDecimalNumber(decimal: self).doubleValue
    }
}
