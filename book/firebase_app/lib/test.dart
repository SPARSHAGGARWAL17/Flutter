import 'dart:async';
import 'dart:convert';
import 'dart:io';

void main() {
  String data = "";
  for (var i = 0; i < 1000; i++) {
    data += "Hello World\n";
  }
  List encoded = utf8.encode(data);
  List compressed = gzip.encode(encoded);
  List<int> decompressed = gzip.decode(compressed);
  String decoded = utf8.decode(decompressed);
  print("Compressed : ${compressed.length}");
  print("Decompressed : ${decompressed.length}");
  assert(data == decoded);
}
