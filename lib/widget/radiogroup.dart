import 'package:flutter/material.dart';

class RadioModel<T> {
  RadioModel({required this.label, this.isSelected = false, this.content});

  bool isSelected;
  final String label;
  final T? content;
}

class RadioGroup<T extends RadioModel> extends StatefulWidget {
  const RadioGroup(
      {Key? key,
        required this.items,
        required this.onChanged,
        required this.controlAffinity})
      : super(key: key);
  final ListTileControlAffinity controlAffinity;
  final List<T> items;
  final ValueChanged<T> onChanged;

  @override
  State<StatefulWidget> createState() => _RadioGroupState<T>();
}

class _RadioGroupState<T> extends State<RadioGroup> {
  @override
  Widget build(BuildContext context) {
    final controlAffinity = widget.controlAffinity;
    final List<RadioModel> items = widget.items;
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return RadioListTile<bool>(
            activeColor: Colors.green[800],
            controlAffinity: controlAffinity,
            value: true,
            groupValue: items[index].isSelected,
            title: Text(items[index].label),
            onChanged: (bool? value) {
              setState(() {
                for (var item in items) {
                  item.isSelected = false;
                }
                items[index].isSelected = true;
                widget.onChanged(items[index]);
              });
            });
      },
    );
  }
}
