import Foundation

extension Fraction {
  public static func sum(_ a: Fraction, _ b: Fraction) -> Fraction {
    if a.denominator == b.denominator {
      let commonDenominator = a.denominator
      let numerator = sumNumerators(a, b)
      return Fraction(numerator, Int(commonDenominator))
    } else {
      let commonDenominator = a.denominator * b.denominator
      let aWithSharedDenominator = Fraction(a.sign, a.numerator*b.denominator, commonDenominator)
      let bWithSharedDenominator = Fraction(b.sign, b.numerator*a.denominator, commonDenominator)
      return sum(aWithSharedDenominator, bWithSharedDenominator)
    }
  }
  
  private static func sumNumerators(_ a: Fraction, _ b: Fraction) -> Int {
    let aNumerator = Int(a.numerator)
    let bNumerator = Int(b.numerator)
    switch (a.sign, b.sign) {
    case (.positive, .positive): return aNumerator + bNumerator
    case (.positive, .negative): return aNumerator - bNumerator
    case (.negative, .positive): return -aNumerator + bNumerator
    case (.negative, .negative): return -aNumerator - bNumerator
    }
  }
}
