# Bonsai

## Features

A tiny Dart logging package.

Based loosely on "Android style" debug logging and somewhat influenced by [Square's logcat](https://github.com/square/logcat)

Uses the logging functionality from the `dart:developer` package.

## Getting started

Just import the package and call the init method somewhere, like at the start of your `main()`:

```dart
import 'package:bonsai/bonsai.dart';

void main() {
  const debug = true;
  if (debug) {
    Log.init();
  }
  //...
}
```

## Usage

Bonsai adds a static extension method onto `Object` to make basic usage very simple:

```dart

class MyClass {
  void doSomething() {
    log("hello I'm doing something");
  }
}
```

Of course more custom usage is also available:

```dart
 Log.d('Main', 'custom tags are also available as it sending custom data:', data: myObj);

  // there is also a specific method for errors:
  try {
    throw UnsupportedError('soemthing went wrong');
  } catch (e, st) {
    Log.e('some error happened', e, st);
  }
```

In Flutter apps, the logging will be sent to usual app console output. However if you are using this for a Dart command line application or want output when running unit tests for Flutter apps, you'll likely want to enable output to `stderr`:

```dart
 // pass true to enable output to stderr
 Log.init(true);
```

Example stdout/stderr commandline output looks like:

```
FINE: 2021-10-01 16:29:54.573106: [MyClass] hello I'm doing something
FINE: 2021-10-01 16:29:54.576928: [Main] custom tags are also available
SEVERE: 2021-10-01 16:29:54.577526: some error happened
FormatException: something went very wrong
#0      main (file:///home/maks/work/bonsai_dart/example/bonsai_example.dart:16:5)
#1      _delayEntrypointInvocation.<anonymous closure> (dart:isolate-patch/isolate_patch.dart:297:19)
#2      _RawReceivePortImpl._handleMessage (dart:isolate-patch/isolate_patch.dart:192:12)
```

## The name?

Following in the great heritage of naming Logging packages in Android: logging, trees, tiny logging package... :-)


