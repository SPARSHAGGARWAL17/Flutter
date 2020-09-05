abstract class Testing {
  bool aBoolFunc();
  String aStringFunc();
}

class Test implements Testing {
  bool aBoolFunc() {
    return true;
  }

  String aStringFunc() {
    return "S";
  }
}

void main() {
  Testing test = Test();
  print(test.aStringFunc());
}
