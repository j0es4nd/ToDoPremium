
import SwiftUI

struct CalendarView: View {
    @ObservedObject var calendarViewModel: CalendarViewModel
    @ObservedObject var taskViewModel: TaskViewModel

    var body: some View {
        VStack {
            DatePicker("Select Date", selection: $calendarViewModel.selectedDate, displayedComponents: .date)
                .datePickerStyle(GraphicalDatePickerStyle())
                .padding()

            List(calendarViewModel.tasksForSelectedDate) { task in
                TaskRow(task: task)
            }
        }
        .onChange(of: calendarViewModel.selectedDate) { _ in
            calendarViewModel.refreshTasks()
        }
        .navigationBarTitle("Calendar", displayMode: .inline)
    }
}

struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(calendarViewModel: CalendarViewModel(), taskViewModel: TaskViewModel())
    }
}
