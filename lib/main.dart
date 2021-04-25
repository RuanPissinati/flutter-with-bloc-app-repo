import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
enum CounterEvent { increment, decrement }

// void main() {
//   runApp(MyApp());
// }

Stream<int> countStream(int max) async* {
  for (int i = 0; i < max; i++) {
    yield i;
  }
}

Future<int> sumStream(Stream<int> stream) async {
  int sum = 0;
  await for (int value in stream) {
    debugPrint('valor é $value');
    sum += value;
  }
  return sum;
}

void main() async {
  /// Initialize a stream of integers 0-9
  Stream<int> stream = countStream(5);
  /// Compute the sum of the stream of integers
  int sum = await sumStream(stream);
  /// Print the sum
  print(sum); // 45

  runApp(Text('SOMA $sum', textDirection: TextDirection.ltr,));
}
