import Foundation
import Combine

class CalendarViewModel: ObservableObject {
    @Published var selectedDate: Date
    @Published var tasksForSelectedDate: [Task]

    private var allTasks: [Task] = []
    private var cancellables = Set<AnyCancellable>()

    init() {
        // Initialize with current date
        selectedDate = Date()
        tasksForSelectedDate = []

        // Load all tasks and setup bindings
        loadAllTasks()
        setupBindings()
    }

    // Load all tasks
    private func loadAllTasks() {
        allTasks = DataManager.shared.loadTasks()
        filterTasksForSelectedDate()
    }

    // Setup Combine bindings
    private func setupBindings() {
        // Observe the selected date changes
        $selectedDate
            .sink { [weak self] newDate in
                self?.filterTasksForSelectedDate()
            }
            .store(in: &cancellables)
    }

    // Filter tasks for the selected date
    private func filterTasksForSelectedDate() {
        tasksForSelectedDate = allTasks.filter { task in
            let taskDate = Calendar.current.startOfDay(for: task.dueDate)
            let selectedDateStart = Calendar.current.startOfDay(for: selectedDate)
            return taskDate == selectedDateStart
        }
    }

    // Function to change the selected date
    func selectDate(_ date: Date) {
        selectedDate = date
    }

    // Refresh the task list (can be called when tasks are updated externally)
    func refreshTasks() {
        loadAllTasks()
    }
}

