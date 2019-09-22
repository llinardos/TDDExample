import Foundation
import Divisors

public struct Fraction {
  public enum Sign {
    case positive
    case negative
  }
  
  public var numerator: UInt
  public var denominator: UInt
  public var sign: Sign
  
  public init(_ sign: Sign, _ numerator: UInt, _ denominator: UInt) {
    self.sign = sign
    self.numerator = numerator
    self.denominator = denominator
  }
  
  public init(_ numerator: Int, _ denominator: Int) {
    if let gdc = getGCDOf(numerator, denominator) {
      let absReducedNumerator = UInt(abs(numerator)/gdc)
      let absReducedDenominator = UInt(abs(denominator)/gdc)
      
      var sign: Sign = .positive
      if numerator < 0 && denominator > 0 || numerator > 0 && denominator < 0 {
        sign = .negative
      }
      
      self.init(sign, absReducedNumerator, absReducedDenominator)
    } else {
      self.init(.positive, 0, 0)
    }
  }
}
