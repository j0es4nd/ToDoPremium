
import Foundation

struct Task: Identifiable, Codable {
    var id: UUID
    var title: String
    var isCompleted: Bool
    var dueDate: Date

    init(id: UUID = UUID(), title: String, isCompleted: Bool = false, dueDate: Date) {
        self.id = id
        self.title = title
        self.isCompleted = isCompleted
        self.dueDate = dueDate
    }
}
