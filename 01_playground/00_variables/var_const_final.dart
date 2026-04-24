import 'null_safety.dart';
import 'collections.dart';

// Practical rule: Use const for fixed UI values and config,
//final for data fetched or computed once per screen,
//and explicit types for variables that change.

void declarationDemo() {
  // Explicit types
  String firstName = "Ama";
  String lastName = "Afriyie";
  int age = 34;
  double temperature = 37;
  bool isCheckedIn = true;
  bool isInsured = true;

  // Deffered types
  var doctorName = 'Dr. Owusu';
  var roomNumber = 12;

  var status = "Waiting";

  // Runtime constant
  final String clinicId = "OPD-01";

  // Compile-time constant
  const double amountDue = 0.0;
  const String ward = "2-bed female";

  // Null aware
  String? midName = middleName?.length != 0 ? middleName : "Unknown";

  // Null coalescing
  String phone = phoneNumber ?? "Nill";

  departments.add("Neurology");
  departments.remove("paeditric");

  print("======================================================");
  print("PATIENT INFORMATION");
  print("======================================================");
  print("Patient name: $firstName");
  print("Middle name: $midName");
  print("Last name: $lastName");

  print("Patient age: $age");
  print("Phone: $phone");
  print("Temperature: $temperature");

  print("Clinic ID: $clinicId");
  print("Is Insured: $isInsured");
  print("Is checked in: $isCheckedIn");

  print("Amount due: $amountDue");
  print("Status: $status");

  print("Doctor name: $doctorName");
  print("Consulting room: $roomNumber");

  status = "Admitted";
  print("Current Status: $status");
  print("Admission ward: $ward");

  print("Active departments:");
  int x = 1;
  for (String dept in departments) {
    print("$x. $dept");
    x++;
  }
}
