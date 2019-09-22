import XCTest
import Fraction

class FractionAdditionTests: XCTestCase {
  // 0 + 0 = 0 (zero)
  func testSumOfIntegers() {
    let a = Fraction(0)
    let b = Fraction(0)
    let expected = Fraction(0)
    
    let sum = Fraction.sum(a, b)
    
    XCTAssertEqual(sum, expected)
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
