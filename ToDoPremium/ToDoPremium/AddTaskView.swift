
import SwiftUI

struct AddTaskView: View {
    @ObservedObject var taskViewModel: TaskViewModel
    @State private var title: String = ""
    @State private var dueDate: Date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Task Title", text: $title)
                    DatePicker("Due Date", selection: $dueDate, displayedComponents: .date)
                }

                Section {
                    Button(action: addTask) {
                        Text("Add Task")
                    }
                    .disabled(title.isEmpty)
                }
            }
            .navigationBarTitle("Add Task", displayMode: .inline)
        }
    }

    private func addTask() {
        taskViewModel.addTask(title: title, dueDate: dueDate)
        // Reset fields after adding the task
        title = ""
        dueDate = Date()
    }
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView(taskViewModel: TaskViewModel())
    }
}
