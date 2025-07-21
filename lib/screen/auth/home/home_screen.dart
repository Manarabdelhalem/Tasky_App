import 'package:flutter/material.dart';
import 'package:tasky_app/screen/auth/home/empty_screen.dart';
import 'package:tasky_app/widget/add_show_bottom_sheet_widget.dart';
//import 'package:tasky_app/widget/empty_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final bool hasTasks = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/icone/Group 10.png'),
                  Image.asset('assets/icone/Group 314.png'),
                ],
              ),
              const SizedBox(height: 20),

              // Search bar
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Row(
                  children: const [
                    Icon(Icons.search, color: Colors.deepPurple),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: 'Search for your task...',
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.grey.shade400),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: const [
                    Text('Today'),
                    Icon(Icons.keyboard_arrow_down),
                  ],
                ),
              ),

              const SizedBox(height: 20),

              Expanded(
                child: hasTasks
                    ? ListView(
                        children: [
                          _buildTaskItem(
                              'Do Math Homework', 'Today At 16:45', 1),
                          _buildTaskItem('Tack out dogs', 'Today At 18:20', 2),
                          _buildTaskItem(
                              'Business meeting with CEO', 'Today At 08:15', 3),
                          const SizedBox(height: 10),
                          const Text('Completed'),
                          _buildTaskItem('Buy Grocery', 'Today At 16:45', 3,
                              completed: true),
                        ],
                      )
                    : const EmptyScreen(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
            ),
            backgroundColor: Colors.white,
            isScrollControlled: true,
            builder: (context) => const AddTaskBottomSheet(),
          );
        },
        backgroundColor: const Color(0xFF24252C),
        child: const Icon(Icons.add, color: Colors.deepPurple),
      ),
    );
  }

  Widget _buildTaskItem(String title, String time, int priority,
      {bool completed = false}) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: completed ? Colors.deepPurple.withOpacity(0.1) : Colors.white,
        border: Border.all(color: Colors.deepPurple),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                completed
                    ? Icons.radio_button_checked
                    : Icons.radio_button_unchecked,
                color: Colors.deepPurple,
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  Text(time, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.deepPurple),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text('P $priority',
                style: const TextStyle(color: Colors.deepPurple)),
          ),
        ],
      ),
    );
  }
}
