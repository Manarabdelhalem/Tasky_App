import 'package:flutter/material.dart';
import 'package:tasky_app/screen/auth/widget/text_form_field.dart';
import 'package:tasky_app/widget/task_priority_bottom_sheet.dart';

class AddTaskBottomSheet extends StatefulWidget {
  const AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  int? selectedPriority;

  void _openPrioritySheet() async {
    final result = await showModalBottomSheet<int>(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return TaskPriorityBottomSheet(
          selected: selectedPriority,
          onPrioritySelected: (priority) {
            Navigator.pop(context, priority);
          },
        );
      },
    );

    if (result != null) {
      setState(() {
        selectedPriority = result;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Add Task',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF24252C),
            ),
          ),
          const SizedBox(height: 16),
          TextFormFieldWidget(hint: 'Do math Homework'),
          const SizedBox(height: 20),
          Text('Description'),
          const SizedBox(height: 32),
          Row(
            children: [
              GestureDetector(
                onTap: () async {
                  final DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    print("Selected Date: $pickedDate");
                  }
                },
                child: Image.asset('assets/icone/timer.png'),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: _openPrioritySheet,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Image.asset('assets/icone/flag.png', height: 24),
                      const SizedBox(width: 4),
                      Text(
                        selectedPriority != null ? '${selectedPriority!}' : '',
                        style: const TextStyle(color: Colors.deepPurple),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              Image.asset('assets/icone/send.png'),
            ],
          ),
        ],
      ),
    );
  }
}
