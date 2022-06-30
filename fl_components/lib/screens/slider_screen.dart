import 'package:flutter/material.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double sliderValue = 100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(child: Text('Sliders && checks')),
        ),
        body: Column(
          children: [
            Slider(
                min: 50,
                max: 400,
                value: sliderValue,
                onChanged: (value) {
                  sliderValue = value;
                  setState(() {});
                })
          ],
        ));
  }
}
