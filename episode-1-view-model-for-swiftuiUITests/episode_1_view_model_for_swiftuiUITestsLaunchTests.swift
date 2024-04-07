//
//  episode_1_view_model_for_swiftuiUITestsLaunchTests.swift
//  episode-1-view-model-for-swiftuiUITests
//
//  Created by Dawid on 07/04/2024.
//

import XCTest

final class episode_1_view_model_for_swiftuiUITestsLaunchTests: XCTestCase {

    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testLaunch() throws {
        let app = XCUIApplication()
        app.launch()

        // Insert steps here to perform after app launch but before taking a screenshot,
        // such as logging into a test account or navigating somewhere in the app

        let attachment = XCTAttachment(screenshot: app.screenshot())
        attachment.name = "Launch Screen"
        attachment.lifetime = .keepAlways
        add(attachment)
    }
}
