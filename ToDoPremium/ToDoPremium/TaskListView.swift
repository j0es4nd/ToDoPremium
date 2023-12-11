
import SwiftUI

struct TaskListView: View {
    @ObservedObject var taskViewModel: TaskViewModel

    var body: some View {
        NavigationView {
            List {
                ForEach(taskViewModel.tasks) { task in
                    TaskRow(task: task, taskViewModel: taskViewModel)
                        .onTapGesture {
                            // Implement the action for task selection or editing
                        }
                }
                .onDelete(perform: deleteTask)
            }
            .navigationBarTitle("Tasks")
            .navigationBarItems(trailing: addButton)
        }
    }

    private var addButton: some View {
        NavigationLink(destination: AddTaskView(taskViewModel: taskViewModel)) {
            Image(systemName: "plus")
        }
    }

    private func deleteTask(at offsets: IndexSet) {
        offsets.forEach { index in
            let task = taskViewModel.tasks[index]
            taskViewModel.deleteTask(task)
        }
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(taskViewModel: TaskViewModel())
    }
}
