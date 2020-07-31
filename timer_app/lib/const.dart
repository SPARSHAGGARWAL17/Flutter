List<int> press = [1, 0, 0];
List<int> sec = [0, 0];
List<int> min = [0, 0];
List<int> hrs = [0, 0];
var clock = <int, List>{
  3: hrs,
  2: min,
  1: sec,
};

void switcher(int pos) {
  switch (pos) {
    case 1:
      press = [1, 0, 0];
      break;
    case 2:
      press = [0, 1, 0];
      break;
    case 3:
      press = [0, 0, 1];
      break;
  }
}
