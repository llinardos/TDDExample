import Foundation

public struct Fraction {
  public enum Sign {
    case positive
    case negative
  }
  
  public var numerator: UInt
  public var denominator: UInt
  public var sign: Sign
  
  public init(_ numerator: Int, _ denominator: Int) {
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
