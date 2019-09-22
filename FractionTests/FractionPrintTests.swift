import XCTest
import Fraction

class FractionPrintTests: XCTestCase {
  func testFractionAsString() {
    XCTAssertEqual(Fraction(.positive, 1, 2).description, "+1/2")
    XCTAssertEqual(Fraction(.negative, 1, 2).description, "-1/2")
    XCTAssertEqual(Fraction(.positive, 10, 12).description, "+10/12")
    XCTAssertEqual(Fraction(.negative, 10, 12).description, "-10/12")
    
    XCTAssertEqual(Fraction(1, 2).description, "+1/2")
    XCTAssertEqual(Fraction(-1, 2).description, "-1/2")
  }
}

