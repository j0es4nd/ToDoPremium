
import Foundation

class DataManager {
    static let shared = DataManager()
    private let tasksKey = "tasks"
    private let userDefaults = UserDefaults.standard

    // Load tasks from UserDefaults
    func loadTasks() -> [Task] {
        if let data = userDefaults.data(forKey: tasksKey) {
            do {
                // Decode the data into an array of Task objects
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                return try decoder.decode([Task].self, from: data)
            } catch {
                print("Error decoding tasks: \(error)")
            }
        }
        return []
    }

    // Save a list of tasks to UserDefaults
    func saveTasks(_ tasks: [Task]) {
        do {
            // Encode the array of Task objects
            let encoder = JSONEncoder()
            encoder.dateEncodingStrategy = .iso8601
            let data = try encoder.encode(tasks)
            userDefaults.set(data, forKey: tasksKey)
        } catch {
            print("Error encoding tasks: \(error)")
        }
    }

    // Add a new task
    func addTask(_ task: Task) {
        var tasks = loadTasks()
        tasks.append(task)
        saveTasks(tasks)
    }

    // Update an existing task
    func updateTask(_ task: Task) {
        var tasks = loadTasks()
        if let index = tasks.firstIndex(where: { $0.id == task.id }) {
            tasks[index] = task
            saveTasks(tasks)
        }
    }

    // Delete a task
    func deleteTask(_ task: Task) {
        var tasks = loadTasks()
        tasks.removeAll { $0.id == task.id }
        saveTasks(tasks)
    }
}
