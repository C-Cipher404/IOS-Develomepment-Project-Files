import Foundation

extension Collection {
    var isNotEmpty: Bool{
        !self.isEmpty
    }
}

let blank = ""
let isNotEmpty = blank.isNotEmpty

extension String {
    var isValidEmail: Bool {
        let emailPattern = "^\\S+@\\S+\\.\\S+$"
        return self.range(of: emailPattern, options: .regularExpression) != nil
    }
}

extension String {

    func trimmed() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
}

let name = "   Cortney   "
