import 'package:flutter/material.dart';
import 'package:tasky_app/screen/auth/widget/text_form_field.dart';

class showButtomSheetWidget extends StatelessWidget {
  showButtomSheetWidget({
    super.key,
    this.onTapTimer,
    this.onTapFlag,
    this.onTapSend,
    this.selectedTime,
    required this.titleTask,
    required this.describtionTask,
  });
  TextEditingController? titleTask;
  TextEditingController? describtionTask;
  void Function()? onTapTimer;
  void Function()? onTapFlag;
  void Function()? onTapSend;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 25),
          Text(
            'Add Task',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 14),
          TextFormFieldWidget(hintText: 'Do math homework'),
          SizedBox(height: 14),
          Text(
            'Description',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color: Color(0xff6E6A7C),
            ),
          ),
          TextFormFieldWidget(hintText: 'Enter your Description'),
          SizedBox(height: 17),
          Row(
            children: [
              GestureDetector(
                onTap: onTapTimer,
                child: Image.asset('assets/icons/timer.png'),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: onTapFlag,
                child: Image.asset('assets/icons/flag.png'),
              ),
              const Spacer(),
              GestureDetector(
                onTap: onTapSend,
                child: Image.asset('assets/icons/send.png'),
              ),
              SizedBox(height: 30),
            ],
          ),
        ],
      ),
    );
  }
}
