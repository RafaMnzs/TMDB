import Foundation

extension Int {
    func toDollarString() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale(identifier: "en_US")
        return formatter.string(from: NSNumber(value: self)) ?? "$\(self)"
    }
}
