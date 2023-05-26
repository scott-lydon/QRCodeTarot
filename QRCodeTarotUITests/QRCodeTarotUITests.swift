//
//  QRCodeTarotUITests.swift
//  QRCodeTarotUITests
//
//  Created by Scott Lydon on 4/3/22.
//

import XCTest

class QRCodeTarotUITests: XCTestCase {
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        collectionCellContaining(strings: ["Magic"])?.tap()
        firstTableCell(with: "Mind Reading")?.tap()
    }

    /// A non checked simple cell matcher, that returns the first cell that matches the criteria.
    /// - Parameter matchString: String to see if the cell contains
    /// - Returns: returns the cell.
    private func firstTableCell(with matchString: String) -> XCUIElement? {
        XCUIApplication().tables.firstMatch.cells.allElementsBoundByIndex.first {
            $0.debugDescription.lowercased().contains(matchString.lowercased())
        }
    }

    /// Returns cells containing the strings outlined.  This method is private to encourage assertions on the results.
    ///  This violates the single responsibility rule in order to speed up the operation.
    /// - Parameters:
    ///   - strings: Strings to check if there is a match.
    ///   - upperLimit: How many cells you can check.  This is an arbitrary large number by default (100) so that the upper limit of cells can be reached.
    ///   - cells: Pass either a collection view or table view: `XCUIApplication().tableView.children(matching: .cell)`, or `XCUIApplication().collectionViews.children(matching: .cell)`
    /// - Returns: Returns elements that contain all the strings, and returns elements that have one but not all.
    private func collectionCellsContaining(
        strings: [String],
        upperLimit: Int = 100,
        cells: XCUIElementQuery = XCUIApplication().collectionViews.children(matching: .cell)
    ) -> (matchesAll: Set<XCUIElement>, matchesNotAll: Set<XCUIElement>) {
        var elements: Set<XCUIElement> = [], matchOneNotAll: Set<XCUIElement> = []
        for index in 0..<upperLimit {
            let cell = XCUIApplication().collectionViews.children(matching: .cell).element(boundBy: index)
            guard cell.exists else { continue }
            if cell.contains(all: strings) {
                elements.insert(cell)
            } else if cell.contains(atleastOne: strings) {
                matchOneNotAll.insert(cell)
            }
        }
        return (elements, matchOneNotAll)
    }

    /// Returns the XCuiElement cell.
    /// - Parameters:
    ///   - debug: set false if returning a nil cell is acceptable.
    ///   - strings: Strings to check if there is a match.
    ///   - upperLimit: How many cells you can check.  This is an arbitrary large number by default (100) so that the upper limit of cells can be reached.
    ///   - cells: Pass either a collection view or table view: `XCUIApplication().tableView.children(matching: .cell)`, or `XCUIApplication().collectionViews.children(matching: .cell)`
    /// - Returns: Returns the first matching element that contains all the strings passed.
    private func collectionCellContaining(
        debug: Bool = true,
        strings: [String],
        upperLimit: Int = 100
    ) -> XCUIElement? {
        let (elements, matchOneNotAll) = collectionCellsContaining(strings: strings, upperLimit: upperLimit)
        if debug {
            if elements.count > 1 {
                XCTFail(
                    """
                    *****(start)
                    There are more than one cell that match the criteria provided. Those cells are:

                    \(elements.map(\.debugDescription))
                    *****(end)
                    """
                )
            } else if elements.isEmpty {
                XCTFail("There were no cells that contain ALL the strings passed: \(strings), consider passing fewer or different strings to match. \(matchOneNotAll.map(\.debugDescription))")
            }
        }
        return elements.first
    }
}

extension NSObject {
    func has(_ string: String) -> Bool {
        debugDescription.lowercased().contains(string.lowercased())
    }

    func contains(all strings: [String]) -> Bool {
        strings.allSatisfy { has($0) }
    }

    func contains(atleastOne strings: [String]) -> Bool {
        strings.contains { has($0) }
    }
}
