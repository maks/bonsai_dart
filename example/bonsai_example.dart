import 'package:bonsai/bonsai.dart';

void main() {
  const debug = true;
  if (debug) {
    // pass true to enable output to stderr
    Log.init(true);
  }
  final myObj = MyClass();
  myObj.doSomething();

  Log.d('Main', 'custom tags are also available');

  // there is also a specific method for errors:
  try {
    throw FormatException('something went very wrong');
  } catch (e, st) {
    Log.e('some error happened', e, st);
  }
}

class MyClass {
  void doSomething() {
    log("hello I'm doing something");
  }
}
