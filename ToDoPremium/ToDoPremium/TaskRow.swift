
import SwiftUI

struct TaskRow: View {
    var task: Task

    var body: some View {
        HStack {
            // Completion Indicator
            Image(systemName: task.isCompleted ? "checkmark.circle.fill" : "circle")
                .foregroundColor(task.isCompleted ? .green : .gray)
                .onTapGesture {
                    // Action to toggle task completion status
                }

            VStack(alignment: .leading) {
                // Task Title
                Text(task.title)
                    .strikethrough(task.isCompleted, color: .gray)
                    .font(.headline)
                    .foregroundColor(task.isCompleted ? .gray : .primary)

                // Due Date
                Text(task.dueDate, style: .date)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// Preview Provider
struct TaskRow_Previews: PreviewProvider {
    static var previews: some View {
        TaskRow(task: Task(title: "Sample Task", dueDate: Date()))
            .previewLayout(.sizeThatFits)
    }
}
