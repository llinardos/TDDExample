import XCTest
import Fraction

class FractionCreationTests: XCTestCase {
  func test_init_setsNumeratorAndDenominatorOk() {
    assertThatFractionCreatedWith(numerator: 1, denominator: 2, becomes: Fraction(.positive, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator: 3, becomes: Fraction(.positive, 1, 3))
    assertThatFractionCreatedWith(numerator: 3, denominator: 2, becomes: Fraction(.positive, 3, 2))
  }
  
  func test_init_handlesSigns() {
    assertThatFractionCreatedWith(numerator:-1, denominator: 2, becomes: Fraction(.negative, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator:-2, becomes: Fraction(.negative, 1, 2))
    assertThatFractionCreatedWith(numerator:-1, denominator:-2, becomes: Fraction(.positive, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator: 2, becomes: Fraction(.positive, 1, 2))
  }
  
  func test_initWithExplicitSign() {
    assertThatFractionCreatedWithParams(.positive, 1, 2, becomes: Fraction(.positive, 1, 2))
    assertThatFractionCreatedWithParams(.negative, 1, 2, becomes: Fraction(.negative, 1, 2))
    assertThatFractionCreatedWithParams(.positive, 1, 2, becomes: Fraction(.positive, 1, 2))
  }
  
  func test_init_simplifiesFraction() {
    assertThatFractionCreatedWithParams(4, 2, simplifiesTo: Fraction(.positive, 2, 1))
    assertThatFractionCreatedWithParams(2, 4, simplifiesTo: Fraction(.positive, 1, 2))
    assertThatFractionCreatedWithParams(16, 12, simplifiesTo: Fraction(.positive, 4, 3))
    assertThatFractionCreatedWithParams(12, 16, simplifiesTo: Fraction(.positive, 3, 4))
    assertThatFractionCreatedWithParams(-12, 16, simplifiesTo: Fraction(.negative, 3, 4))
  }
  
  func test_isZero_returnTrue_whenNumeratorIsZero() {
    XCTAssertTrue(Fraction(0, 1).isZero())
    XCTAssertTrue(Fraction(0, 2).isZero())
    XCTAssertTrue(Fraction(0, 100).isZero())
    XCTAssertTrue(Fraction(0, -1).isZero())
    XCTAssertTrue(Fraction(0, -2).isZero())
    XCTAssertTrue(Fraction(0, -100).isZero())
  }

  func test_isZero_returnsFalse_whenNumeratorIsNotZero() {
    XCTAssertFalse(Fraction(1, 2).isZero())
    XCTAssertFalse(Fraction(-1, 2).isZero())
    XCTAssertFalse(Fraction(12123, 1).isZero())
    XCTAssertFalse(Fraction(124, 812).isZero())
  }
  
  func test_hasDenominatorZero_returnsTrue_whenDenominatorIsZeroAndNumeratorNot() {
    assertThatFractionHasZeroDenominator(Fraction(1, 0))
    assertThatFractionHasZeroDenominator(Fraction(2, 0))
    assertThatFractionHasZeroDenominator(Fraction(100, 0))
    assertThatFractionHasZeroDenominator(Fraction(-1, 0))
    assertThatFractionHasZeroDenominator(Fraction(-2, 0))
    assertThatFractionHasZeroDenominator(Fraction(-100, 0))
    assertThatFractionHasZeroDenominator(Fraction(0, 0))
  }
  
  func test_hasDenominatorZero_returnsTrue_whenBothDenominatorAndNumeratorAreZero() {
    assertThatFractionHasZeroDenominator(Fraction(0, 0))
  }
  
  func test_hasDenominatorZero_retursFalse_whenNumeratorIsNotZeroAndDenominatorIsNotZero() {
    XCTAssertFalse(Fraction(1, 3).hasDenominatorZero())
    XCTAssertFalse(Fraction(-1, 3).hasDenominatorZero())
    XCTAssertFalse(Fraction(-1, -3).hasDenominatorZero())
    XCTAssertFalse(Fraction(1, -3).hasDenominatorZero())
    XCTAssertFalse(Fraction(1121, 24123).hasDenominatorZero())
    XCTAssertFalse(Fraction(-112151, 81759).hasDenominatorZero())
  }
  
  func test_initWithInt() {
    assertThatFractionFromInteger(Fraction(0), becomes: Fraction(.positive, 0, 1))
    assertThatFractionFromInteger(Fraction(1), becomes: Fraction(.positive, 1, 1))
    assertThatFractionFromInteger(Fraction(2), becomes: Fraction(.positive, 2, 1))
    assertThatFractionFromInteger(Fraction(45), becomes: Fraction(.positive, 45, 1))
    assertThatFractionFromInteger(Fraction(-1), becomes: Fraction(.negative, 1, 1))
    assertThatFractionFromInteger(Fraction(-2), becomes: Fraction(.negative, 2, 1))
    assertThatFractionFromInteger(Fraction(-10), becomes: Fraction(.negative, 10, 1))
  }
}

extension FractionCreationTests {
  func assertThatFractionCreatedWith(numerator n: Int, denominator d: Int, becomes expected: Fraction, file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(n, d)
    XCTAssertTrue(
      fraction == expected,
      "Fraction \(fraction) is not \(expected)",
      file: file, line: line
    )
  }
  
  func assertThatFractionCreatedWithParams(_ s: Fraction.Sign, _ n: UInt, _ d: UInt, becomes expected: Fraction, file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(s, n, d)
    XCTAssertTrue(
      fraction == expected,
      "Fraction \(fraction) is not \(expected)",
      file: file, line: line
    )
  }
  
  func assertThatFractionCreatedWithParams(_ n: Int, _ d: Int, simplifiesTo expected: Fraction, file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(n, d)
    XCTAssertTrue(
      fraction == expected,
      "Fraction \(fraction) is not simplified to \(expected)",
      file: file, line: line
    )
  }
  
  func assertThatFractionHasZeroDenominator(_ f: Fraction, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(
      f.numerator == 0 && f.denominator == 0 && f.hasDenominatorZero(),
      "\(f) should has denominator zero.",
      file: file, line: line
    )
  }
  
  func assertThatFractionFromInteger(_ f: Fraction, becomes expected: Fraction, file: StaticString = #file, line: UInt = #line) {
    XCTAssertEqual(
      f, expected,
      "\(f) should be \(expected).",
      file: file, line: line
    )
  }
}
