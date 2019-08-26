import 'package:flutter/material.dart';

class Tag extends StatelessWidget {
  final List<String> list;
  final onpress;

  const Tag({
    Key key,
    this.list,
    this.onpress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        children: list.map<Widget>(onpress).toList().map<Widget>((Widget chip) {
      return Padding(
        padding: const EdgeInsets.all(2.0),
        child: chip,
      );
    }).toList());
  }
}
