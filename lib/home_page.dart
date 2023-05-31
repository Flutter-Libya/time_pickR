import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // TimeOfDay variable
  TimeOfDay _timeOfDay = TimeOfDay(hour: 0, minute: 0);

  // show time picker method
  Future<void> _showTimePicker() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      setState(() {
        _timeOfDay = pickedTime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _buildContent(),
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildTimeDisplay(),
        _buildTimePickerButton(),
      ],
    );
  }

  Widget _buildTimeDisplay() {
    final hour = _timeOfDay.hour.toString().padLeft(2, '0');
    final minute = _timeOfDay.minute.toString().padLeft(2, '0');
    return Text(
      "$hour:$minute",
      style: const TextStyle(fontSize: 50),
    );
  }

  Widget _buildTimePickerButton() {
    return MaterialButton(
      onPressed: _showTimePicker,
      child: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text('PICK TIME',
            style: TextStyle(color: Colors.white, fontSize: 30)),
      ),
      color: Colors.blue,
    );
  }
}
