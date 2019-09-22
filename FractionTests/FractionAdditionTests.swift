import XCTest
import Fraction

class FractionAdditionTests: XCTestCase {
  func testThat_sum_sums_when_argumentsAreIntegers() {
    assertThatAdding(Fraction(int: 0), and: Fraction(int: 0), gives: Fraction(int: 0))
    assertThatAdding(Fraction(int: 1), and: Fraction(int: 0), gives: Fraction(int: 1))
    assertThatAdding(Fraction(int: 0), and: Fraction(int: 1), gives: Fraction(int: 1))
    assertThatAdding(Fraction(int: 1), and: Fraction(int: 1), gives: Fraction(int: 2))
    assertThatAdding(Fraction(int: 0), and: Fraction(int: -1), gives: Fraction(int: -1))
    assertThatAdding(Fraction(int: -1), and: Fraction(int: 0), gives: Fraction(int: -1))
    assertThatAdding(Fraction(int: -1), and: Fraction(int: -1), gives: Fraction(int: -2))
    assertThatAdding(Fraction(int: -1), and: Fraction(int: 1), gives: Fraction(int: 0))
    assertThatAdding(Fraction(int: -1), and: Fraction(int: 2), gives: Fraction(int: 1))
    assertThatAdding(Fraction(int: 1), and: Fraction(int: -2), gives: Fraction(int: -1))
  }
  
  func testThat_sum_sums_when_argumentsAreFractions() {
    assertThatAdding(Fraction(int: 0), and: Fraction(1,2), gives: Fraction(1,2))
    assertThatAdding(Fraction(1,2), and: Fraction(int: 0), gives: Fraction(1,2))
    assertThatAdding(Fraction(1231,932), and: Fraction(int: 0), gives: Fraction(1231,932))
    assertThatAdding(Fraction(1,2), and: Fraction(1,2), gives: Fraction(int: 1))
    assertThatAdding(Fraction(1,4), and: Fraction(2,4), gives: Fraction(3,4))
    assertThatAdding(Fraction(1,2), and: Fraction(int: 1), gives: Fraction(3,2))
    assertThatAdding(Fraction(1,2), and: Fraction(1,3), gives: Fraction(5,6))
    assertThatAdding(Fraction(1,2), and: Fraction(2,3), gives: Fraction(7,6))
    assertThatAdding(Fraction(1,2), and: Fraction(3,2), gives: Fraction(4,2))
    assertThatAdding(Fraction(1,2), and: Fraction(-2,3), gives: Fraction(-1,6))
    assertThatAdding(Fraction(-1,2), and: Fraction(2,3), gives: Fraction(1,6))
    assertThatAdding(Fraction(-1,2), and: Fraction(-2,3), gives: Fraction(-7,6))
    assertThatAdding(Fraction(2,6), and: Fraction(8,6), gives: Fraction(10,6))
  }
}

extension FractionAdditionTests {
  func assertThatAdding(_ a: Fraction, and b: Fraction, gives expected: Fraction, file: StaticString = #file, line: UInt = #line) {
    let sum = Fraction.sum(a, b)
    XCTAssertTrue(
      sum == expected,
      "Adding \(a) and \(b) should give \(expected) but gives \(sum)",
      file: file, line: line
    )
  }
}
