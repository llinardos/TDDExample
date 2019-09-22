import Foundation

public func getDivisorsOf(_ n: Int) -> [Int] {
  guard n != 0 else { return [] }
  
  let positiveFactors = (1...abs(n)).filter { n % $0 == 0 }
  if n > 0 {
    return positiveFactors
  } else {
    let negativeFactors = positiveFactors.map { -$0 }
    return positiveFactors + negativeFactors
  }
}

public func getCommonDivisorsOf(_ a: Int, _ b: Int) -> [Int] {
  let divisorsOfA = getDivisorsOf(a)
  let divisorsOfB = getDivisorsOf(b)
  return divisorsOfA.filter { divisorsOfB.contains($0) }
}

public func getGCDOf(_ a: Int, _ b: Int) -> Int? {
  return getCommonDivisorsOf(a, b).max()
}
