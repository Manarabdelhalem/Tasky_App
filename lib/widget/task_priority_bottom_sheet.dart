import 'package:flutter/material.dart';

class TaskPriorityBottomSheet extends StatefulWidget {
  final Function(int) onPrioritySelected;
  final int? selected;

  const TaskPriorityBottomSheet({
    super.key,
    required this.onPrioritySelected,
    this.selected,
  });

  @override
  State<TaskPriorityBottomSheet> createState() =>
      _TaskPriorityBottomSheetState();
}

class _TaskPriorityBottomSheetState extends State<TaskPriorityBottomSheet> {
  List<int> priorityList = List.generate(9, (index) => index + 1); // [1..9]
  int? selectedPriority;

  @override
  void initState() {
    super.initState();
    selectedPriority = widget.selected;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            "Task Priority",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
          ),
          const SizedBox(height: 20),
          Wrap(
            spacing: 10,
            runSpacing: 10,
            children: priorityList.map((priority) {
              final isSelected = selectedPriority == priority;
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedPriority = priority;
                  });
                },
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: BoxDecoration(
                    color: isSelected ? Colors.deepPurple : Colors.white,
                    border: Border.all(
                      color: isSelected ? Colors.deepPurple : Colors.grey,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.flag,
                        color: isSelected ? Colors.white : Colors.deepPurple,
                        size: 20,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        '$priority',
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.deepPurple,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Cancel"),
              ),
              ElevatedButton(
                onPressed: selectedPriority != null
                    ? () {
                        widget.onPrioritySelected(selectedPriority!);
                        Navigator.pop(context);
                      }
                    : null,
                child: const Text("Save"),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
