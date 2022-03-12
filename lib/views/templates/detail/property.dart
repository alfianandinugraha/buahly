import 'package:flutter/material.dart';

class Property extends StatelessWidget {
  final String label;
  final Widget child;

  const Property({Key? key, required this.label, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              color: const Color(0xFFC6C6C6),
              fontSize: Theme.of(context).textTheme.caption?.fontSize,
              fontWeight: Theme.of(context).textTheme.caption?.fontWeight,
            ),
          ),
          const SizedBox(height: 4),
          child
        ],
      ),
    );
  }
}
