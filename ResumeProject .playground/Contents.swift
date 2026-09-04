import Foundation

struct ResumeGenerator {
    var fullName: String
    var jobTitle: String
    var yearsExperience: String
    var topSkill1: String
    var topSkill2: String
    var company: String
    var goal: String

    static let formatCount = 3

    static func randomFormatNumber() -> Int {
        return Int.random(in: 1...formatCount)
    }

    var formatNumber: Int = ResumeGenerator.randomFormatNumber()

    var hasValidInput: Bool {
        return !fullName.isEmpty
        && !jobTitle.isEmpty
        && !yearsExperience.isEmpty
        && !topSkill1.isEmpty
        && !topSkill2.isEmpty
        && !company.isEmpty
        && !goal.isEmpty
    }

    var formatTitle: String {
        switch formatNumber {
        case 1:
            return "Professional Summary"
        case 2:
            return "Objective Statement"
        default:
            return "Elevator Pitch"
        }
    }

    func generateResume() -> String {
        if !hasValidInput {
            return "Invalid Input"
        }

        switch formatNumber {
        case 1:
            return """
            \(fullName) is a \(jobTitle) with \(yearsExperience) years of experience, currently at \(company). Strengths include \(topSkill1) and \(topSkill2), with a focus on \(goal).
            """
        case 2:
            return """
            \(jobTitle) with \(yearsExperience) years of experience seeking a role where \(topSkill1) and \(topSkill2) can be put to work. Most recently at \(company), \(fullName) is looking to \(goal).
            """
        default:
            return """
            Hi, I'm \(fullName)! I've spent \(yearsExperience) years as a \(jobTitle), most recently at \(company). I'm best at \(topSkill1), closely followed by \(topSkill2), and what I really want to do next is \(goal).
            """
        }
    }
}

let resume1 = ResumeGenerator(fullName: "Ann Carter", jobTitle: "iOS Developer", yearsExperience: "4", topSkill1: "Swift", topSkill2: "debugging", company: "Avetta", goal: "build apps people actually enjoy using")
print(resume1.formatTitle)
print(resume1.generateResume())

let resume2 = ResumeGenerator(fullName: "", jobTitle: "iOS Developer", yearsExperience: "4", topSkill1: "Swift", topSkill2: "debugging", company: "Avetta", goal: "build apps people actually enjoy using")
print(resume2.generateResume())

for _ in 1...3 {
    let random = ResumeGenerator(fullName: "Ann Carter", jobTitle: "iOS Developer", yearsExperience: "4", topSkill1: "Swift", topSkill2: "debugging", company: "Avetta", goal: "build apps people actually enjoy using")
    print("---\(random.formatTitle)---")
    print(random.generateResume())
}

let forced = ResumeGenerator(fullName: "Ann Carter", jobTitle: "iOS Developer", yearsExperience: "4", topSkill1: "Swift", topSkill2: "debugging", company: "Avetta", goal: "build apps people actually enjoy using", formatNumber: 2)
print(forced.formatTitle)
print(forced.generateResume())

