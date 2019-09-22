import XCTest
import Fraction

class FractionEqualityTests : XCTestCase {
  func test_equals_forIntegers() {
    XCTAssertEqual(Fraction(1),   Fraction(1))
    XCTAssertEqual(Fraction(1,1), Fraction(1))
    XCTAssertEqual(Fraction(1),   Fraction(1,1))
    XCTAssertEqual(Fraction(1,1), Fraction(1,1))
    XCTAssertEqual(Fraction(2,1), Fraction(2,1))
    XCTAssertEqual(Fraction(2,1), Fraction(2))
    XCTAssertEqual(Fraction(2), Fraction(2))
    XCTAssertNotEqual(Fraction(2,1), Fraction(1))
  }
  
  func test_equals_forFractions() {
    XCTAssertEqual(Fraction(1,3),   Fraction(1,3))
    XCTAssertEqual(Fraction(2,3),   Fraction(2,3))
    XCTAssertNotEqual(Fraction(2,3),   Fraction(1,3))
    XCTAssertNotEqual(Fraction(4,3), Fraction(1,3))
    XCTAssertEqual(Fraction(4,3), Fraction(4,3))
    XCTAssertNotEqual(Fraction(4,3), Fraction(3,3))
    XCTAssertEqual(Fraction(-1,3), Fraction(-1,3))
    XCTAssertEqual(Fraction(-1,3), Fraction(1,-3))
    XCTAssertEqual(Fraction(1,-3), Fraction(1,-3))
    XCTAssertEqual(Fraction(1,-3), Fraction(-1,3))
    XCTAssertEqual(Fraction(-1,-3), Fraction(-1,-3))
  }
  
  func test_equals_forZero() {
    XCTAssertEqual(Fraction(0,1),   Fraction(0,1))
    XCTAssertEqual(Fraction(0,1),   Fraction(0,2))
    XCTAssertEqual(Fraction(0,2),   Fraction(0,1))
    XCTAssertEqual(Fraction(0,100),   Fraction(0,19410))
  }
  
  func test_equals_forDenominatorIsZero() {
    XCTAssertNotEqual(Fraction(1,0),   Fraction(1,0))
    XCTAssertNotEqual(Fraction(2,0),   Fraction(1,0))
  }
}
