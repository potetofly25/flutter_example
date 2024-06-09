import 'package:flutter/material.dart';

class CustomDropdown<T> extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.labelText,
    required this.list,
    required this.allTitles,
    required this.selectedValue,
    required this.onChanged,
  });

  final String labelText;
  final List<T> list;
  final List<String> allTitles;
  final T selectedValue;
  final Function(dynamic) onChanged;

  @override
  State<CustomDropdown<T>> createState() => _CustomDropdownState<T>();
}

class _CustomDropdownState<T> extends State<CustomDropdown<T>> {
  late T _selectedValue;

  @override
  void initState() {
    super.initState();
    _selectedValue = widget.selectedValue;
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuItem<T>> dropDownMenuModelNameItems = [];

    for (int i = 0; i < widget.list.length; i++) {
      dropDownMenuModelNameItems.add(
        DropdownMenuItem(
          value: widget.list[i],
          child: Text(
            widget.allTitles[i],
          ),
        ),
      );
    }

    return InputDecorator(
      decoration: InputDecoration(
        labelText: widget.labelText,
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<T>(
          isExpanded: true,
          isDense: true,
          value: _selectedValue,
          items: dropDownMenuModelNameItems,
          onChanged: (value) {
            setState(() => _selectedValue = value!);
            widget.onChanged(value);
          },
        ),
      ),
    );
  }
}
