//
//  NotificationTests.swift
//  NotificationTests
//
//  Created by Christian Otkjær on 18/02/16.
//  Copyright © 2016 Christian Otkjær. All rights reserved.
//

import XCTest
@testable import Notification

class NotificationTests: XCTestCase
{
    func test_simple()
    {
        let nhm = NotificationsHandler()
        
        let expect = expectation(description: "called")
        
        nhm.onAny(from: self) { 
            expect.fulfill()
        }
        
        NotificationCenter.default.post(name: NSNotification.Name("TestName"), object: self)
        
        waitForExpectations(timeout: 0.1) { (error) in
            
            XCTAssertNil(error)
        }
    }
    
    func testPerformanceExample()
    {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
