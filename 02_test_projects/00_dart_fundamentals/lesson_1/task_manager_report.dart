void main(List<String> args) {
  print("=========================================================");
  print("            TASK MANAGER DASHBOARD REPORT                ");
  print("=========================================================");
  printUserData();
  print("=========================================================");
}

void printUserData() {
  String userName = "John Franklin";
  final String userID = "USR-00421";
  int totalTasks = 20;
  int tasksCompleted = 12;
  bool hasOverdueTask = true;
  String? pinnedNote;

  List<String> taskCategories = ["Work", "Personal", "Spiritual"];

  Map<String, dynamic> mostUrgentTask = {
    "title": "Submit malaria report on DHIMS",
    "category": "Work",
    "dueDate": "5-4-2026",
    "isCompleted": false,
    "assignedTo": null,
  };

  Map<String, dynamic> mostRecentlyCompletedTasks = {
    "title": "Recite 10 pages of Qur'an",
    "category": "Spiritual",
    "dueTime": "Every morning 5:30am",
    "isCompleted": true,
  };

  print("User Name       : $userName");
  print("User ID         : $userID");
  print("Total Tasks     : $totalTasks");
  print("Completed       : $tasksCompleted");
  print(
    "Progress            : ${(tasksCompleted / totalTasks * 100).toStringAsFixed(1)}%",
  );
  print("Overdue         : ${hasOverdueTask ? 'Yes' : 'No'}");
  print("Pinned Notes    : ${pinnedNote ?? 'No pinned note'}");

  print("-----------------------------------------------------------------");
  print("TASK CATEGORIES");
  print("-----------------------------------------------------------------");
  for (String task in taskCategories) {
    print(" * $task");
  }

  print("-----------------------------------------------------------------");
  print("MOST URGENT TASKS");
  print("-----------------------------------------------------------------");
  print(" Title       : ${mostUrgentTask['title']}");
  print(" Category    : ${mostUrgentTask['category']}");
  print(" Due date    : ${mostUrgentTask['dueDate']}");
  print(
    " Status      : ${mostUrgentTask["isCompleted"] ? 'Completed' : 'pending'}",
  );
  print(" Assigned    : ${mostUrgentTask["assignedTo"] ?? 'Unassigned'}");

  print("-----------------------------------------------------------------");
  print("MOST RECENT COMPLETED TASKS");
  print("-----------------------------------------------------------------");
  print(" Title       : ${mostRecentlyCompletedTasks['title']}");
  print(" Category    : ${mostRecentlyCompletedTasks['category']}");
  print(" Due time    : ${mostRecentlyCompletedTasks['dueTime']}");
  print(
    " Status      : ${mostRecentlyCompletedTasks["isCompleted"] ? 'Completed' : 'pending'}",
  );
}
