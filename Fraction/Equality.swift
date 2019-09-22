extension Fraction: Equatable {
  public static func == (lhs: Fraction, rhs: Fraction) -> Bool {
    guard !lhs.hasDenominatorZero(), !rhs.hasDenominatorZero() else {
      return false
    }
    return lhs.numerator == rhs.numerator && lhs.denominator == rhs.denominator && lhs.sign == rhs.sign
  }
}
