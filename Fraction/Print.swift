extension Fraction: CustomStringConvertible {
  public var description: String {
    let signAsString: String = {
      switch self.sign {
      case .positive: return "+"
      case .negative: return "-"
      }
    }()
    return "\(signAsString)\(self.numerator)/\(self.denominator)"
  }
}
