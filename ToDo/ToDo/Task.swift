import Foundation

struct Task: Equatable{
    var title: String
    var done: Bool
    var category: String

    static var categories: [String] {
        return ["Work", "Study", "Life"]
    }
}
