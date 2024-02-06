import 'package:flutter/material.dart';

class BackButtons extends StatelessWidget {
  const BackButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(backgroundColor: const Color.fromARGB(137, 57, 56, 56),
        radius: 25,
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)),
      ),
    );
  }
}