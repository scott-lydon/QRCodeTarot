//
//  CollapsibleViewModelTests.swift
//  QRCodeTarotTests
//
//  Created by Scott Lydon on 6/3/22.
//

import XCTest
import QRCodeReader
@testable import QRCodeTarot

class CollapsibleViewModelTests: XCTestCase {

    func testCollapsableLabelLabelViewModel() {
        let viewModel: CollapsableLabelLabel.ViewModel = .init(
            bottomText: "asdflkjlkj lkj lkj lkj lkaj sdlfkj lakjsd flkajs dflkja sldkjf alskdjf laksjdf laksjd flkj    asdflkj asdlfkj alskdjf asldkfj alksjd flkja sldkfja lskdjf alksjdf lkajsd flkja sldkfj",
            lineCutoff: 4,
            actualLineCount: 20
        )
        XCTAssertFalse(viewModel.buttonIsHidden)
        XCTAssertEqual(viewModel.labelLabelViewModel.lineCount, 4)
    }

    func testCollapsableLabelLabelViewModel2() {
        let viewModel: CollapsableLabelLabel.ViewModel = .init(
            bottomText: "asdflkjlkj lkj lkj lkj lkaj sdlfkj lakjsd flkajs dflkja sldkjf alskdjf laksjdf laksjd flkj    asdflkj asdlfkj alskdjf asldkfj alksjd flkja sldkfja lskdjf alksjdf lkajsd flkja sldkfj",
            lineCutoff: 4,
            actualLineCount: 1
        )
        XCTAssertTrue(viewModel.buttonIsHidden)
        XCTAssertEqual(viewModel.labelLabelViewModel.lineCount, 0)
    }

    func testCollapsableLabelLabelViewModel3() {
        let viewModel: CollapsableLabelLabel.ViewModel = .init(
            bottomText: "asdflkjlkj lkj lkj lkj lkaj sdlfkj lakjsd flkajs dflkja sldkjf alskdjf laksjdf laksjd flkj    asdflkj asdlfkj alskdjf asldkfj alksjd flkja sldkfja lskdjf alksjdf lkajsd flkja sldkfj",
            lineCutoff: 4,
            actualLineCount: 4
        )
        XCTAssertTrue(viewModel.buttonIsHidden)
        XCTAssertEqual(viewModel.labelLabelViewModel.lineCount, 0)
    }
}
