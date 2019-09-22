import XCTest
import Fraction

class FractionCreationTests: XCTestCase {
  func test_init_setsNumeratorAndDenominatorOk() {
    assertThatFractionCreatedWith(numerator: 1, denominator: 2, becomes: (.positive, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator: 3, becomes: (.positive, 1, 3))
    assertThatFractionCreatedWith(numerator: 3, denominator: 2, becomes: (.positive, 3, 2))
  }
  
  func test_init_handlesSigns() {
    assertThatFractionCreatedWith(numerator:-1, denominator: 2, becomes: (.negative, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator:-2, becomes: (.negative, 1, 2))
    assertThatFractionCreatedWith(numerator:-1, denominator:-2, becomes: (.positive, 1, 2))
    assertThatFractionCreatedWith(numerator: 1, denominator: 2, becomes: (.positive, 1, 2))
  }
  
  func test_initWithExplicitSign() {
    assertThatFractionCreatedWithParams(.positive, 1, 2, becomes: (.positive, 1, 2))
    assertThatFractionCreatedWithParams(.negative, 1, 2, becomes: (.negative, 1, 2))
    assertThatFractionCreatedWithParams(.positive, 1, 2, becomes: (.positive, 1, 2))
  }
  
  func test_init_simplifiesFraction() {
    assertThatFractionCreatedWithParams(4, 2, simplifiesTo: (.positive, 2, 1))
    assertThatFractionCreatedWithParams(2, 4, simplifiesTo: (.positive, 1, 2))
    assertThatFractionCreatedWithParams(16, 12, simplifiesTo: (.positive, 4, 3))
    assertThatFractionCreatedWithParams(12, 16, simplifiesTo: (.positive, 3, 4))
    assertThatFractionCreatedWithParams(-12, 16, simplifiesTo: (.negative, 3, 4))
  }
  
  func test_initWithDenominatorZero_setZeroDashZeroAndSetsHasDenominatorZeroToTrue() {
    assertThatFractionHasZeroDenominator(Fraction(1, 0))
    assertThatFractionHasZeroDenominator(Fraction(2, 0))
    assertThatFractionHasZeroDenominator(Fraction(100, 0))
    assertThatFractionHasZeroDenominator(Fraction(-1, 0))
    assertThatFractionHasZeroDenominator(Fraction(-2, 0))
    assertThatFractionHasZeroDenominator(Fraction(-100, 0))
    assertThatFractionHasZeroDenominator(Fraction(0, 0))
  }

  func test_initWithNumeratorZero_isZero() {
    assertThatFractionIsZero(Fraction(0, 1))
    assertThatFractionIsZero(Fraction(0, 2))
    assertThatFractionIsZero(Fraction(0, 100))
    assertThatFractionIsZero(Fraction(0, -1))
    assertThatFractionIsZero(Fraction(0, -2))
    assertThatFractionIsZero(Fraction(0, -100))
  }
  
  func test_hasDenominatorZero_retursFalseForRegularFractions() {
    XCTAssertFalse(Fraction(1, 3).hasDenominatorZero())
    XCTAssertFalse(Fraction(-1, 3).hasDenominatorZero())
    XCTAssertFalse(Fraction(-1, -3).hasDenominatorZero())
    XCTAssertFalse(Fraction(1, -3).hasDenominatorZero())
    XCTAssertFalse(Fraction(1121, 24123).hasDenominatorZero())
    XCTAssertFalse(Fraction(-112151, 81759).hasDenominatorZero())
  }
}

extension FractionCreationTests {
  func assertThatFractionCreatedWith(numerator n: Int, denominator d: Int, becomes expected: (sign: Fraction.Sign, n: UInt, d: UInt), file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(n, d)
    XCTAssertTrue(
      fraction.numerator == expected.n && fraction.denominator == expected.d && fraction.sign == expected.sign,
      "Fraction \(fractionAsString(fraction)) is not \(fractionAsString(expected.sign, expected.n, expected.d))",
      file: file, line: line
    )
  }
  
  func assertThatFractionCreatedWithParams(_ s: Fraction.Sign, _ n: UInt, _ d: UInt, becomes expected: (sign: Fraction.Sign, n: UInt, d: UInt), file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(s, n, d)
    XCTAssertTrue(
      fraction.numerator == expected.n && fraction.denominator == expected.d && fraction.sign == fraction.sign,
      "Fraction \(fractionAsString(fraction)) is not \(fractionAsString(expected.sign, expected.n, expected.d))",
      file: file, line: line
    )
  }
  
  func assertThatFractionCreatedWithParams(_ n: Int, _ d: Int, simplifiesTo expected: (sign: Fraction.Sign, n: UInt, d: UInt), file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(n, d)
    XCTAssertTrue(
      fraction.numerator == expected.n && fraction.denominator == expected.d && fraction.sign == fraction.sign,
      "Fraction \(fractionAsString(fraction)) is not simplified to \(fractionAsString(expected.sign, expected.n, expected.d))",
      file: file, line: line
    )
  }

  func assertThatFractionIsZero(_ f: Fraction, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(
      f.numerator == 0 && f.denominator != 0 && !f.hasDenominatorZero(),
      "\(fractionAsString(f)) should be zero.",
      file: file, line: line
    )
  }
  
  func assertThatFractionHasZeroDenominator(_ f: Fraction, file: StaticString = #file, line: UInt = #line) {
    XCTAssertTrue(
      f.numerator == 0 && f.denominator == 0 && f.hasDenominatorZero(),
      "\(fractionAsString(f)) should has denominator zero.",
      file: file, line: line
    )
  }
}
