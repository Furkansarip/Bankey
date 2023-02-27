//
//  CurrencyFormatterTests.swift
//  BankeyUnitTests
//
//  Created by Furkan Sarı on 27.02.2023.
//

import Foundation
import XCTest
@testable import Bankey

class Test : XCTestCase {
    var formatter : CurrencyFormatter!
    
    override func setUp()  {
        super.setUp()
        formatter = CurrencyFormatter()
    }
    
    func testDolarFormatted() throws {
        let result = formatter.dollarsFormatted(929466.63)
        XCTAssertEqual(result, "$929,466.63")
    }
    
    func zeroDolarFormatted() throws {
        let result = formatter.dollarsFormatted(0)
        XCTAssertEqual(result, "$0.00")
        
    }
    
}
