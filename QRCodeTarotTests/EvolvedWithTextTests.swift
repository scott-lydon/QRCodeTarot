//
//  EvolvedWithTextTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 6/7/22.
//

import Foundation
import XCTest
@testable import Pointy_Hat_Tarot

class EvolvedWithTextTests: XCTestCase {

    func testOnlyUnevolved() {
        let evolvedViewModel = EvolvedWithText.ViewModel(
            labelLeftModel: nil,
            labelRightModel: LabelLabel.ViewModel(
                topText: "Unevolved",
                bottomText: "blablabla",
                lineCount: 4
            ),
            switchViewModel: TarotSwitchView.ViewModel(
                isLeft: true,
                switchedToLeft: nil,
                leftText: "Evolved",
                rightText: "Unevolved"
            ),
            switchedToLeft: nil
        )
        XCTAssertTrue(evolvedViewModel.hideSwitch)
        XCTAssertFalse(evolvedViewModel.hideLabelLabel)
    }

    func testOnlyEvolved() {
        let evolvedViewModel = EvolvedWithText.ViewModel(
            labelLeftModel: LabelLabel.ViewModel(
                topText: "Evolved",
                bottomText: "blablabla",
                lineCount: 4
            ),
            labelRightModel: nil,
            switchViewModel: TarotSwitchView.ViewModel(
                isLeft: true,
                switchedToLeft: nil,
                leftText: "Evolved",
                rightText: "Unevolved"
            ),
            switchedToLeft: nil
        )
        XCTAssertTrue(evolvedViewModel.hideSwitch)
        XCTAssertFalse(evolvedViewModel.hideLabelLabel)
    }

    func testHasNeither() {
        let evolvedViewModel = EvolvedWithText.ViewModel(
            labelLeftModel: nil,
            labelRightModel: nil,
            switchViewModel: TarotSwitchView.ViewModel(
                isLeft: true,
                switchedToLeft: nil,
                leftText: "Evolved",
                rightText: "Unevolved"
            ),
            switchedToLeft: nil
        )
        XCTAssertTrue(evolvedViewModel.hideSwitch)
        XCTAssertTrue(evolvedViewModel.hideLabelLabel)
    }

    func testHasBoth() {
        let evolvedViewModel = EvolvedWithText.ViewModel(
            labelLeftModel: LabelLabel.ViewModel(
                topText: "Evolved",
                bottomText: "blablabla",
                lineCount: 4
            ),
            labelRightModel: LabelLabel.ViewModel(
                topText: "Unevolved",
                bottomText: "blablabla",
                lineCount: 4
            ),
            switchViewModel: TarotSwitchView.ViewModel(
                isLeft: true,
                switchedToLeft: nil,
                leftText: "Evolved",
                rightText: "Unevolved"
            ),
            switchedToLeft: nil
        )
        XCTAssertFalse(evolvedViewModel.hideSwitch)
        XCTAssertFalse(evolvedViewModel.hideLabelLabel)
    }
}
