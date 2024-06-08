import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: TextButton(
            onPressed: () {
              showDialog(
                  context: context, builder: (context) => const Customdialog());
            },
            child: const Text("show dialog"),
          ),
        ),
      ),
    );
  }
}

class Customdialog extends StatelessWidget {
  const Customdialog({super.key});

  @override
  Widget build(BuildContext context) {
    return const SimpleDialog(
      title: Text("dialog"),
    );
  }
}
