//
//  String+ExtensionTests.swift
//  SwiftyAdTests
//
//  Created by Francisco Rosa on 16/03/2025.
//

@testable import SwiftyAd
import XCTest

final class String_ExtensionTests: XCTestCase {

    func testFormatDate_ValidDate() {
        let dateString = "2024-03-16T14:30:00Z"
        let formatted = dateString.formatDate()
        XCTAssertEqual(formatted, "16/03/2024")
    }
    
    func testFormatDate_AnotherValidDate() {
        let dateString = "2020-07-01T08:15:45Z"
        let formatted = dateString.formatDate()
        XCTAssertEqual(formatted, "01/07/2020")
    }
    
    func testFormatDate_InvalidDate() {
        let dateString = "2024/03/16"
        let formatted = dateString.formatDate()
        XCTAssertEqual(formatted, dateString)
    }
    
    func testFormatDate_EmptyString() {
        let dateString = ""
        let formatted = dateString.formatDate()
        XCTAssertEqual(formatted, "")
    }
}
