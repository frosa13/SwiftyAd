//
//  Float+ExtensionTests.swift
//  SwiftyAdTests
//
//  Created by Francisco Rosa on 16/03/2025.
//

@testable import SwiftyAd
import XCTest

final class Float_ExtensionTests: XCTestCase {

    func testFormattedPrice_WholeNumber() {
        let price: Float = 2000
        let formatted = price.formattedPrice()
        XCTAssertEqual(formatted, "2 000€")
    }
    
    func testFormattedPrice_DecimalWithTwoDigits() {
        let price: Float = 1500.75
        let formatted = price.formattedPrice()
        XCTAssertEqual(formatted, "1 500,75€")
    }
    
    func testFormattedPrice_DecimalWithOneDigit() {
        let price: Float = 1500.5
        let formatted = price.formattedPrice()
        XCTAssertEqual(formatted, "1 500,50€")
    }
    
    func testFormattedPrice_SmallDecimal() {
        let price: Float = 19.99
        let formatted = price.formattedPrice()
        XCTAssertEqual(formatted, "19,99€")
    }
    
    func testFormattedPrice_Zero() {
        let price: Float = 0
        let formatted = price.formattedPrice()
        XCTAssertEqual(formatted, "0€")
    }
}
