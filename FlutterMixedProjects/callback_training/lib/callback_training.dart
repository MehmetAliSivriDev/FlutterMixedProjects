import 'dart:math';

import 'package:flutter/material.dart';

part './part_callback_training.dart';

class CallBackTraining extends StatefulWidget {
  const CallBackTraining({super.key});

  @override
  State<CallBackTraining> createState() => _CallBackTrainingState();
}

class _CallBackTrainingState extends State<CallBackTraining> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const _CustomFabButton(),
      appBar: AppBar(
        title: const Text("CallBack Training"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.red,
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.3,
              color: Colors.blue,
            ),
            const SizedBox(
              height: 10,
            ),
            _CustomElevatedButton(
              onClick: (number) {
                return number % 2 == 0;
              },
            )
          ],
        ),
      ),
    );
  }
}
