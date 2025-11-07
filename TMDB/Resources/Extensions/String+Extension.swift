import Foundation

extension String {
    func toBrazilianDate() -> String? {
        let inputFormatter = DateFormatter()
        inputFormatter.locale = Locale(identifier: "en_US_POSIX")
        inputFormatter.dateFormat = "yyyy-MM-dd"

        let outputFormatter = DateFormatter()
        outputFormatter.locale = Locale(identifier: "pt_BR")
        outputFormatter.dateFormat = "dd/MM/yyyy"

        if let date = inputFormatter.date(from: self) {
            return outputFormatter.string(from: date)
        } else {
            return nil
        }
    }
}
