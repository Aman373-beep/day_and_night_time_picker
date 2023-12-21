import 'package:flutter/material.dart';
import 'package:day_night_time_picker/day_night_time_picker.dart';

void main() {
  runApp(const Primary());
}

class Primary extends StatelessWidget {
  const Primary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Time_Date(),
    );
  }
}

class Time_Date extends StatefulWidget {
  const Time_Date({super.key});

  @override
  State<Time_Date> createState() => _Time_DateState();
}

class _Time_DateState extends State<Time_Date> {
  @override
  Time _time = Time(hour: 11, minute: 30, second: 20);
  bool iosStyle = true;

  void onTimeChanged(Time newTime) {
    setState(() {
      _time = newTime;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Popup Picker Style",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  "${_time.hour}:${_time.minute}:${_time.second} ${_time.period.name}"
                      .toUpperCase(),
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                TextButton(
                  style: TextButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      showPicker(
                        showSecondSelector: true,
                        context: context,
                        value: _time,
                        onChange: onTimeChanged,
                        minuteInterval: TimePickerInterval.FIVE,
                        // Optional onChange to receive value as DateTime
                        onChangeDateTime: (DateTime dateTime) {
                          // print(dateTime);
                          debugPrint("[debug datetime]:  $dateTime");
                        },
                      ),
                    );
                  },
                  child: const Text(
                    "Open time picker",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                const SizedBox(height: 10),
                const Divider(),
                const SizedBox(height: 10),
                Text(
                  "Inline Picker Style",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                // Render inline widget
                showPicker(
                  isInlinePicker: true,
                  elevation: 1,
              
                  value: _time,
                  onChange: onTimeChanged,
                  minuteInterval: TimePickerInterval.FIVE,
                  iosStylePicker: iosStyle,
                  //minHour: 9,
                  // maxHour: 21,
                  is24HrFormat: false,
                ),
                Text(
                  "IOS Style",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                Switch(
                  value: iosStyle,
                  onChanged: (newVal) {
                    setState(() {
                      iosStyle = newVal;
                    });
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
