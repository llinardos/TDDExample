import XCTest

func fractionAsString(_ sign: Fraction.Sign, _ n: UInt, _ d: UInt) -> String {
  let signAsString: String = {
    switch sign {
    case .positive: return "+"
    case .negative: return "-"
    }
  }()
  return "\(signAsString)\(n)/\(d)"
}

func fractionAsString(_ f: Fraction) -> String {
  return fractionAsString(f.sign, f.numerator, f.denominator)
}

class FractionUtilsTests: XCTestCase {
  func testFractionAsString() {
    XCTAssertEqual(fractionAsString(.positive, 1, 2), "+1/2")
    XCTAssertEqual(fractionAsString(.negative, 1, 2), "-1/2")
    XCTAssertEqual(fractionAsString(.positive, 10, 12), "+10/12")
    XCTAssertEqual(fractionAsString(.negative, 10, 12), "-10/12")
    
    XCTAssertEqual(fractionAsString(Fraction(1, 2)), "+1/2")
    XCTAssertEqual(fractionAsString(Fraction(-1, 2)), "-1/2")
  }
}

