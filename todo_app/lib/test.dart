Map<String, dynamic> todo = {
  "TodoList": [
    {
      "name": "Alex",
      "completed": true,
    },
    {
      "name": "Bobby",
      "completed": false,
    }
  ]
};

void main() {
  var comp = todo["TodoList"];
  for (var i in comp) {
    if (!i["completed"]) {
      print(i);
    }
  }
}
