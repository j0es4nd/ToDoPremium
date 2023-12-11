
import SwiftUI
import CoreData
import SwiftUI

struct ContentView: View {
    // Shared view models
    var taskViewModel = TaskViewModel()
    var calendarViewModel = CalendarViewModel()

    var body: some View {
        TabView {
            TaskListView(taskViewModel: taskViewModel)
                .tabItem {
                    Label("Tasks", systemImage: "list.bullet")
                }

            CalendarView(calendarViewModel: calendarViewModel, taskViewModel: taskViewModel)
                .tabItem {
                    Label("Calendar", systemImage: "calendar")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

