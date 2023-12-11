
import Foundation
import Combine

class TaskViewModel: ObservableObject {
    @Published var tasks: [Task] = []

    init() {
        loadTasks()
    }

    // Load tasks from the data manager
    func loadTasks() {
        self.tasks = DataManager.shared.loadTasks()
    }

    // Add a new task and save it
    func addTask(title: String, dueDate: Date) {
        let newTask = Task(title: title, dueDate: dueDate)
        DataManager.shared.addTask(newTask)
        loadTasks()
    }

    // Update an existing task
    func updateTask(_ task: Task) {
        DataManager.shared.updateTask(task)
        loadTasks()
    }

    // Toggle the completion status of a task
    func toggleIsCompleted(for task: Task) {
        var updatedTask = task
        updatedTask.isCompleted.toggle()
        updateTask(updatedTask)
    }

    // Delete a task
    func deleteTask(_ task: Task) {
        DataManager.shared.deleteTask(task)
        loadTasks()
    }
}
