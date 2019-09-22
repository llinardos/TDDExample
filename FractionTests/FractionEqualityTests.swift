import XCTest
import Fraction

class FractionEqualityTests : XCTestCase {
  // Equality test list
  func test_equals_forIntegers() {
    XCTAssertEqual(Fraction(1), Fraction(1))
    XCTAssertEqual(Fraction(1,1), Fraction(1))
    XCTAssertEqual(Fraction(1), Fraction(1,1))
    XCTAssertEqual(Fraction(1,1), Fraction(1,1))
    XCTAssertEqual(Fraction(2,1), Fraction(2,1))
    XCTAssertEqual(Fraction(2,1), Fraction(2))
    XCTAssertNotEqual(Fraction(2,1), Fraction(1))
  }
  // 1/1 == 1/1 true
  // 1/3 == 1/3 true
  // 2/3 == 2/3 true
  // 2/3 == 1/3 false
  // 4/3 == 1/3 false
  // 4/3 == 4/3 false
  // 4/3 == 3/3 false
  // 3/3 == 3/3 true
  // -1/3 == 1/-3 true
  // 0/1 == 0/1 true
  // 0/1 == 0/2 true
  // 1/0 == 1/0 false
  // 2/0 == 1/0 false
}
