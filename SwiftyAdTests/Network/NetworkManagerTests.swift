//
//  NetworkManagerTests.swift
//  SwiftyAdTests
//
//  Created by Francisco Rosa on 16/03/2025.
//

@testable import SwiftyAd
import XCTest

final class NetworkManagerTests: XCTestCase {

    override func setUpWithError() throws {
        URLProtocol.registerClass(MockURLProtocol.self)
    }

    override func tearDownWithError() throws {
        URLProtocol.unregisterClass(MockURLProtocol.self)
    }

    func testFetchAds_Success() async throws {
        guard let adsData = adsData else {
            XCTFail("Missing ads data, unable to continue test!")
            return
        }
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, adsData)
        }
        
        let ads = await NetworkManager.shared.fetchAds()
        XCTAssertNotNil(ads)
        XCTAssertEqual(ads?.count, 1)
        XCTAssertEqual(ads?.first?.title, "Ad 1")
        XCTAssertEqual(ads?.first?.categoryID, 1)
        XCTAssertEqual(ads?.first?.price, 100)
        XCTAssertEqual(ads?.first?.description, "Test ad")
        XCTAssertEqual(ads?.first?.imagesURL.small, "https://smallImage.png")
        XCTAssertEqual(ads?.first?.imagesURL.thumb, "https://thumbImage.png")
        XCTAssertEqual(ads?.first?.creationDate, "2022-10-10T10:00:00Z")
        XCTAssertEqual(ads?.first?.isUrgent, false)
    }
    
    func testFetchAds_Failure() async throws {
        MockURLProtocol.requestHandler = { _ in
            throw URLError(.badServerResponse)
        }
        
        let ads = await NetworkManager.shared.fetchAds()
        XCTAssertNil(ads)
    }
    
    func testFetchAdCategories_Success() async throws {
        guard let adsCategoriesData = adsCategoriesData else {
            XCTFail("Missing ads categories data, unable to continue test!")
            return
        }
        
        MockURLProtocol.requestHandler = { request in
            let response = HTTPURLResponse(url: request.url!, statusCode: 200, httpVersion: nil, headerFields: nil)!
            return (response, adsCategoriesData)
        }
        
        let categories = await NetworkManager.shared.fetchAdCategories()
        XCTAssertNotNil(categories)
        XCTAssertEqual(categories?.count, 1)
        XCTAssertEqual(categories?.first?.id, 1)
        XCTAssertEqual(categories?.first?.name, "Category 1")
    }
    
    func testFetchAdCategories_Failure() async throws {
        MockURLProtocol.requestHandler = { _ in
            throw URLError(.notConnectedToInternet)
        }
        
        let categories = await NetworkManager.shared.fetchAdCategories()
        XCTAssertNil(categories)
    }
}
