import XCTest
import Divisors

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
