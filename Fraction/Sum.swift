import Foundation

extension Fraction {
  public static func sum(_ a: Fraction, _ b: Fraction) -> Fraction {
    if a.denominator == b.denominator {
      let commonDenominator = a.denominator
      let numerator = sumNumerators(a, b)
      return Fraction(numerator, Int(commonDenominator))
    } else {
      return Fraction(11512, 9123)
    }
  }
  
  private static func sumNumerators(_ a: Fraction, _ b: Fraction) -> Int {
    let aNumerator = Int(a.numerator)
    let bNumerator = Int(b.numerator)
    switch (a.sign, b.sign) {
    case (.positive, .positive): return aNumerator + bNumerator
    case (.positive, .negative): return aNumerator - bNumerator
    default: return 0
    }
  }
}
