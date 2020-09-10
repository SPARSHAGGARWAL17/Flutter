import 'export.dart';

List<Transaction> _transact = [
  Transaction(
      title: "Hey",
      amount: 23,
      date: DateTime.now().subtract(Duration(days: 1)).toString(),
      id: "1"),
  Transaction(
      title: "Hey2",
      amount: 33,
      date: DateTime.now().subtract(Duration(days: 2)).toString(),
      id: "2"),
  Transaction(
      title: "Hey3",
      amount: 43,
      date: DateTime.now().subtract(Duration(days: 3)).toString(),
      id: "3"),
  Transaction(
      title: "Hey4",
      amount: 53,
      date: DateTime.now().subtract(Duration(days: 4)).toString(),
      id: "4"),
];

List<Map<String, Object>> get grouped {
  return List.generate(7, (index) {
    String current =
        DateFormat.E().format(DateTime.parse(_transact[index].date));
    if (current == DateFormat.E().format(DateTime.now())) {
      print(DateTime.now().weekday);
    }
    final today = DateTime.now().subtract(Duration(days: index));

    return;
  });
}

void main() {
  print(grouped);
}
