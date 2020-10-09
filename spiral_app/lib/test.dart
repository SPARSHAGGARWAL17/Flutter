List<String> get changes {
  if (empty.length != 2) return ['Apple', 'Orange'];
  return [...empty];
}

List<String> empty = [];
void main() {
  changes.removeLast();
  for (var i = 0; i < 2; i++) {
    empty.add('value');
    changes[i] = 'value';
    print('changes $i = ${changes[i]}');
  }
  print(changes);
}
