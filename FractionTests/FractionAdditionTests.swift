import XCTest
import Fraction

class FractionAdditionTests: XCTestCase {
  func testSumOfIntegers() {
    assertThatAdding(Fraction(0), and: Fraction(0), gives: Fraction(0))
    assertThatAdding(Fraction(1), and: Fraction(0), gives: Fraction(1))
    assertThatAdding(Fraction(0), and: Fraction(1), gives: Fraction(1))
    assertThatAdding(Fraction(1), and: Fraction(1), gives: Fraction(2))
    assertThatAdding(Fraction(0), and: Fraction(-1), gives: Fraction(-1))
//    assertThatAdding(Fraction(-1), and: Fraction(0), gives: Fraction(-1))
//    assertThatAdding(Fraction(-1), and: Fraction(-1), gives: Fraction(-2))
//    assertThatAdding(Fraction(-1), and: Fraction(1), gives: Fraction(0))
//    assertThatAdding(Fraction(-1), and: Fraction(2), gives: Fraction(1))
//    assertThatAdding(Fraction(1), and: Fraction(-2), gives: Fraction(-2))
  }
  
  // Addition Test list
  // 0 + 1 = 1 (zero plus smt)
  // 1 + 0 = 1 (smt plus zero)
  // 0 + 1/2 = 1/2 (0 plus fraction)
  // 1/2 + 0 = 1/2 (fraction plus 0)
  // 1/2 + 1/2 = 1 (same denominator)
  // 1/4 + 2/4 = 3/4 (same denominator, disting numerator)
  // 1/2 + 1 = 3/2 (fraction plus int)
  // 1/2 + 1/3 = (1*3)/6 + (1*2)/6 = (3+2)/6 = 5/6 (distinct denominator)
  // 1/2 + 2/3 = (1*3)/6 + (1*2)/6 = (3+2)/6 = 5/6 (distinct denominator and numerator != 1)
  // 1/2 + 3/2 = 4/2 (fraction plus fraction greater than one)
  // 1/2 + -(2/3) = (1*3)/6 + (-2*2)/6 = (3-4)/6 = -(1/6) (fraction plus negative fraction)
  // -(1/2) + 2/3 = (-1*3)/6 + (2*2)/6 = (-3+4)/6 = 1/6 (negative fraction plus fraction)
  // -(1/2) + -(2/3) = (-1*3)/6 + (-2*2)/6 = (-3-4)/6 = -7/6 (negative fraction plus negative fraction)
  // 2/6 + 8/6 = 10/6 = 5/3 (irreducible)
  
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
