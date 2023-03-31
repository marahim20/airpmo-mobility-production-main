import 'Constants/Enums.dart';

String? stageToString(Stage stage) {
  switch (stage) {
    case Stage.Not_Started:
      return "Not Started";
    case Stage.In_Progress:
      return "In Progress";
    case Stage.Waiting:
      return "Waiting for Approval";
    case Stage.Approved:
      return "Approved";
  }
}

double intToDouble(i) {
  return i == null ? 0.0 : i.toDouble();
}

String dateToString(DateTime dt) {
  return "${dt.day}-${dt.month}-${dt.year}";
}
