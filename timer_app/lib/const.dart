List<int> press = [1, 0, 0];
List<int> sec = [0, 0];
List<int> min = [0, 0];
List<int> hrs = [0, 0];

void switcher(int pos) {
  int i = 0;
  // while (i < press.length) {
  //   if (i == pos - 1) {
  //     press[i] = pos;
  //     break;
  //   } else {
  //     press[i] = 0;
  //   }
  // }
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
