import XCTest
import TDDExercise

struct Fraction {
  var numerator: Int
  var denominator: Int
  init(_ numerator: Int, _ denominator: Int) {
    self.numerator = numerator
    self.denominator = denominator
  }
}

class TDDExerciseTests: XCTestCase {
  func test_init_setsNumeratorAndDenominatorOk() {
    let a = Fraction(1, 2)
    XCTAssertTrue(a.numerator == 1 && a.denominator == 2)
    
    let b = Fraction(1, 3)
    XCTAssertTrue(b.numerator == 1 && b.denominator == 3)
    
    let c = Fraction(3, 2)
    XCTAssertTrue(c.numerator == 3 && c.denominator == 2)
  }
}

// Creation Test List
// (4,2) -> + 4/2 -> + 2/1 (simplifies)
// (16,12) -> + 16/12 -> + 4/3 (simplifies denominator != 1)
// (12,16) -> + 12/16 -> + 3/4 (simplifies less than 1)
// (-1,2) = - 1/2 (negative numerator and positive denominator)
// (1,-2) = - 1/2 (positive numerator and negative denominator)
// -1/-2 = + 1/2 (negative numerator and negative denominator)
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

// Addition Test list
// 0 + 0 = 0 (zero)
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
