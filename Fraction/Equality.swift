extension Fraction: Equatable {
  public static func == (lhs: Fraction, rhs: Fraction) -> Bool {
    return lhs.numerator == rhs.numerator && lhs.denominator == rhs.denominator && lhs.sign == rhs.sign
  }
}
