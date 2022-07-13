import 'package:flutter/material.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  void incrase() {
    setState(() {
      counter++;
    });
  }

  void decrease() {
    setState(() {
      counter--;
    });
  }

  void reseat() {
    setState(() {
      counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    const fontSize40 = TextStyle(fontSize: 40);
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text('Counter Screen')),
        elevation: 10.0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Cantidad de clicks', style: fontSize40),
            Text('$counter', style: fontSize40)
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomFloatingAction(
        increaseFn: incrase,
        decreaseFn: decrease,
        reseatFn: reseat,
      ),
    );
  }
}

class CustomFloatingAction extends StatelessWidget {
  final Function decreaseFn;
  final Function increaseFn;
  final Function reseatFn;
  const CustomFloatingAction({
    Key? key,
    required this.increaseFn,
    required this.decreaseFn,
    required this.reseatFn,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        FloatingActionButton(
          onPressed: () => increaseFn(),
          child: const Icon(Icons.exposure_plus_1_outlined),
        ),
        FloatingActionButton(
          onPressed: () => reseatFn(),
          child: const Icon(Icons.restore),
        ),
        FloatingActionButton(
          onPressed: () => decreaseFn(),
          child: const Icon(Icons.exposure_minus_1_outlined),
        ),
      ],
    );
  }
}
