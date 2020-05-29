//
//  Workflow_iOSUITests.swift
//  Workflow-iOSUITests
//
//  Created by Jagoth Jyoti Dey on 26.05.20.
//  Copyright © 2020 Jagoth. All rights reserved.
//

import XCTest

class Workflow_iOSUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

   func testInitialViewState() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        let textField      = app.textFields.element
        let enterNameLabel = app.staticTexts["enterNameLabel"]
        let greeterLabel   = app.staticTexts["greetingTextLabel"]
        
        XCTAssert(enterNameLabel.exists)
        XCTAssertEqual(enterNameLabel.label, "Please enter your name below")

        XCTAssert(greeterLabel.exists)
        XCTAssert(greeterLabel.label.isEmpty)

        XCTAssert(textField.exists)
        XCTAssertEqual(textField.placeholderValue, "Your name")
        snapshot("1st")
    }
    
    func testGreeter() {
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()

        let textLabel = app.staticTexts["greetingTextLabel"]
        let textField = app.textFields.element
        
        textField.tap()
        textField.typeText("J")
        textField.typeText("o")
        textField.typeText("n")
        textField.typeText("y")
        
        XCTAssertEqual(textLabel.label, "Nice to meet you, Jony.")
        snapshot("2nd")
    }
}
