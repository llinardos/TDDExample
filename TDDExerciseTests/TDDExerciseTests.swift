import XCTest
import TDDExercise

struct Fraction {
  enum Sign {
    case positive
    case negative
  }
  var numerator: UInt
  var denominator: UInt
  
  var sign: Sign
  
  init(_ numerator: Int, _ denominator: Int) {
    if let gdc = getGCDOf(numerator, denominator) {
      self.numerator = UInt(abs(numerator)/gdc)
      self.denominator = UInt(abs(denominator)/gdc)
      
      if numerator < 0 && denominator > 0 {
        sign = .negative
      } else if numerator > 0 && denominator < 0 {
        sign = .negative
      } else {
        sign = .positive
      }
    } else {
      self.numerator = 0
      self.denominator = 0
      self.sign = .positive
    }
  }
  
  func isPositive() -> Bool {
    return sign == .positive
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
    let a = Fraction(-1, 2)
    XCTAssertTrue(a.numerator == 1 && a.denominator == 2 && a.sign == .negative)
    
    let b = Fraction(1, -2)
    XCTAssertTrue(b.numerator == 1 && b.denominator == 2 && b.sign == .negative)
    
    let c = Fraction(-1, -2)
    XCTAssertTrue(c.numerator == 1 && c.denominator == 2 && c.sign == .positive)
    
    let d = Fraction(1, 2)
    XCTAssertTrue(d.numerator == 1 && d.denominator == 2 && d.sign == .positive)
  }
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

func getDivisorsOf(_ n: Int) -> [Int] {
  guard n != 0 else { return [] }
  
  let positiveFactors = (1...abs(n)).filter { n % $0 == 0 }
  if n > 0 {
    return positiveFactors
  } else {
    let negativeFactors = positiveFactors.map { -$0 }
    return positiveFactors + negativeFactors
  }
}

func getCommonDivisorsOf(_ a: Int, _ b: Int) -> [Int] {
  let divisorsOfA = getDivisorsOf(a)
  let divisorsOfB = getDivisorsOf(b)
  return divisorsOfA.filter { divisorsOfB.contains($0) }
}

func getGCDOf(_ a: Int, _ b: Int) -> Int? {
  return getCommonDivisorsOf(a, b).max()
}

class DivisorsTests: XCTestCase {
  func test_getDivisorsOfZeroReturnsEmptyList() {
    let input = 0
    let expected: [Int] = []
    
    let result = getDivisorsOf(input)
    
    XCTAssertEqual(result, expected)
  }
  
  func test_getDivisors() {
    let positiveExpectedOutputByInput: [(Int, [Int])] = [
      (1, [1]),
      (2, [1,2]),
      (3, [1,3]),
      (4, [1,2,4]),
      (5, [1,5]),
      (6, [1,2,3,6]),
      (7, [1,7]),
      (8, [1,2,4,8]),
      (9, [1, 3, 9]),
      (10, [1, 2, 5, 10]),
      (11, [1, 11]),
      (12, [1, 2, 3, 4, 6, 12]),
      (20, [1, 2, 4, 5, 10, 20]),
      (33, [1, 3, 11, 33]),
      (100, [1, 2, 4, 5, 10, 20, 25, 50, 100]),
      (101, [1, 101])
    ]
    let negativeExpectedOutputByInput: [(Int, [Int])] = positiveExpectedOutputByInput.map {
      let n = $0.0
      let positiveFactors = $0.1
      let negativeFactors = positiveFactors.map { -$0 }
      return (-n, positiveFactors + negativeFactors)
    }
    let expectedOutputByInput: [(Int, [Int])] = positiveExpectedOutputByInput + negativeExpectedOutputByInput
    expectedOutputByInput.forEach { (input, expectedOutput) in
      XCTAssertEqual(getDivisorsOf(input), expectedOutput, "Expected divisors don't match for \(input).")
    }
  }
  
  private let commonDivisorTestData: [(a: Int, b: Int, commonDivisors: [Int], gdc: Int)] = [
  (1, 1, [1], 1),
  (1, 2, [1], 1),
  (1, 3, [1], 1),
  (2, 3, [1], 1),
  (2, 2, [1, 2], 2),
  (3, 3, [1, 3], 3),
  (2, 4, [1, 2], 2),
  (2, 4, [1, 2], 2),
  (2, 6, [1, 2], 2),
  (3, 6, [1, 3], 3),
  (2, 10, [1, 2], 2),
  (4, 10, [1, 2], 2),
  (5, 10, [1, 5], 5),
  (10, 100, [1, 2, 5, 10], 10),
  (11, 33, [1, 11], 11),
  (12, 100, [1, 2, 4], 4),
  (20, 100, [1, 2, 4, 5, 10, 20], 20),
  ]
  
  func test_getCommonDivisors() {
    let expectedOutputByInput: [(Int, Int, [Int])] = commonDivisorTestData.map {
      return ($0.a, $0.b, $0.commonDivisors)
    }
    expectedOutputByInput.forEach { (a, b, expectedOutput) in
      XCTAssertEqual(getCommonDivisorsOf(a, b), expectedOutput, "Expected common divisors don't match for (\(a),\(b)).")
    }
  }
  
  func test_greatestCommonDivisor() {
    let expectedOutputByInput: [(Int, Int, Int)] = commonDivisorTestData.map {
      return ($0.a, $0.b, $0.gdc)
    }
    expectedOutputByInput.forEach { (a, b, expectedOutput) in
      XCTAssertEqual(getGCDOf(a, b), expectedOutput, "Expected common divisors don't match for (\(a),\(b)).")
    }
  }
  
  func test_greatestCommonDivisorWithZeroAsArgs_returnsNil() {
    XCTAssertEqual(getGCDOf(0, 1), nil)
    XCTAssertEqual(getGCDOf(1, 0), nil)
    XCTAssertEqual(getGCDOf(0, 0), nil)
  }
}

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
