import 'package:flutter/material.dart';

class ColorSelector extends StatefulWidget {
  const ColorSelector({super.key, required this.colors, required this.onChange});
  final List<Color> colors;
  final Function(Color) onChange;

  @override
  State<ColorSelector> createState() => _ColorSelectorState();
}

class _ColorSelectorState extends State<ColorSelector> {
  late Color _selectedColor ;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selectedColor=widget.colors.first;

  }

  @override
  Widget build(BuildContext context) {
    return  Row(
        children: widget.colors
            .map((c) => Padding(
          padding: const EdgeInsets.all(4.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(15),
            onTap: () {
              _selectedColor = c;
              widget.onChange(c);
              if (mounted) {
                setState(() {});
              }
            },
            child: CircleAvatar(
              backgroundColor: c,
              radius: 15,
              child: _selectedColor == c
                  ? Icon(
                Icons.done,
                color: Colors.white,
              )
                  : null,
            ),
          ),
        ))
            .toList());
  }
}
