import 'package:flutter/material.dart';
import 'package:fleasy/fleasy.dart';

void main() => runApp(FleasyExamples());

class FleasyExamples extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Fleasy examples',
      home: EasyFutureBuilderExampleInt(),
      //home: EasyFutureBuilderExampleList(),
      //home: EasyStreamBuilderExampleInt(),
      //home: EasyStreamBuilderExampleList(),
    );
  }
}

class EasyFutureBuilderExampleInt extends StatelessWidget {
  final Future<int?> future = (() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return 1;
    //return null;
    //return throw ('TEST ERROR');
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasyFutureBuilder<int?>(
          future: future,
          dataBuilder: (context, data) => Text(data.toString()),
        ),
      ),
    );
  }
}

class EasyFutureBuilderExampleList extends StatelessWidget {
  final Future<List<int>?> future = (() async {
    await Future<void>.delayed(const Duration(seconds: 1));
    return <int>[1, 2, 3];
    //return <int>[];
    //return null;
    //return throw ('TEST ERROR');
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasyFutureBuilder<List<int>?>(
          future: future,
          dataBuilder: (context, data) => Text(data.toString()),
        ),
      ),
    );
  }
}

class EasyStreamBuilderExampleInt extends StatelessWidget {
  final Stream<int?> stream = (() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield 1;
    //yield null;
    //yield throw ('TEST ERROR');
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasyStreamBuilder<int?>(
          stream: stream,
          dataBuilder: (context, data) => Text(data.toString()),
        ),
      ),
    );
  }
}

class EasyStreamBuilderExampleList extends StatelessWidget {
  final Stream<List<int>?> stream = (() async* {
    await Future<void>.delayed(const Duration(seconds: 1));
    yield <int>[1, 2, 3];
    //yield <int>[];
    //yield null;
    //yield throw ('TEST ERROR');
  })();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: EasyStreamBuilder<List<int>?>(
          stream: stream,
          dataBuilder: (context, data) => Text(data.toString()),
        ),
      ),
    );
  }
}
