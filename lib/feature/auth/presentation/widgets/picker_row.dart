import 'package:flutter/material.dart';

class PickerRow extends StatelessWidget {
  const PickerRow({super.key, required this.lists});

  final List<String> lists;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Stack(
        alignment: .center,
        children: [
          ListWheelScrollView.useDelegate(
            itemExtent: 50,
            physics: const FixedExtentScrollPhysics(),
            onSelectedItemChanged: (int index) {
              print('User Chose: ${lists[index]}');
            },
            childDelegate: ListWheelChildBuilderDelegate(
              childCount: lists.length,
              builder: (context, index) {
                return Center(
                  child: Text(
                    lists[index],
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge?.copyWith(color: Colors.black),
                  ),
                );
              },
            ),
          ),

          // --- red lines ---
          IgnorePointer(
            child: Container(
              height: 40,
              width: 50,
              decoration: const BoxDecoration(
                color: Colors.transparent,
                border: Border(
                  top: BorderSide(color: Colors.red, width: 2),
                  bottom: BorderSide(color: Colors.red, width: 2),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
