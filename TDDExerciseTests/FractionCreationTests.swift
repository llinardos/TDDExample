import XCTest
import TDDExercise

class FractionCreationTests: XCTestCase {
  func test_init_setsNumeratorAndDenominatorOk() {
    let a = Fraction(1, 2)
    XCTAssertTrue(a.numerator == 1 && a.denominator == 2)
    
    let b = Fraction(1, 3)
    XCTAssertTrue(b.numerator == 1 && b.denominator == 3)
    
    let c = Fraction(3, 2)
    XCTAssertTrue(c.numerator == 3 && c.denominator == 2)
  }
  
  func test_init_simplifiesFraction() {
    let expectedNumeratorAndDenominatorForFraction: [((n: Int, d: Int), (n: Int, d: Int))] = [
      ((4, 2), (2, 1)),
      ((2, 4), (1, 2)),
      ((16, 12), (4, 3)),
      ((12, 16), (3, 4)),
    ]
    expectedNumeratorAndDenominatorForFraction.forEach { (input, output) in
      let fraction = Fraction(input.n, input.d)
      XCTAssertTrue(fraction.numerator == output.n && fraction.denominator == output.d,
                    "Fraction \(input.n)/\(input.d) should be simplified to \(output.n)/\(output.d)")
    }
  }
  
  func test_init_handlesSigns() {
    assertThatFraction((-1, 2), becomes: (.negative, 1, 2))
    assertThatFraction((1, -2), becomes: (.negative, 1, 2))
    assertThatFraction((-1, -2), becomes: (.positive, 1, 2))
    assertThatFraction((1, 2), becomes: (.positive, 1, 2))
  }
  
  func assertThatFraction(_ params: (n: Int, d: Int), becomes expected: (sign: Fraction.Sign, n: UInt, d: UInt), file: StaticString = #file, line: UInt = #line) {
    let fraction = Fraction(params.n, params.d)
    XCTAssertTrue(
      fraction.numerator == expected.n && fraction.denominator == expected.d && fraction.sign == fraction.sign,
      "Fraction \(fractionAsString(fraction)) is not \(fractionAsString(expected.sign, expected.n, expected.d))",
      file: file, line: line
    )
  }
  
  // Creation Test List
  // 1/0 = ERROR (denominator = 0)
  // 2/0 = ERROR (denominator = 0)
  // 100/0 = ERROR (denominator = 0)
  // -1/0 = ERROR (denominator = 0)
  // -2/0 = ERROR (denominator = 0)
  // -100/0 = ERROR (denominator = 0)
  // 0/0 = ERROR (numerator and denominator = 0)
  // 0/1 = zero
  // 0/2 = zero
  // 0/100 = zero
  // 0/-1 = zero
  // 0/-2 = zero
  // 0/-100 = zero
}
