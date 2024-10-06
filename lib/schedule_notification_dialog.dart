// schedule_notification_dialog.dart
import 'package:flutter/material.dart';

class ScheduleNotificationDialog extends StatefulWidget {
  const ScheduleNotificationDialog({super.key});

  @override
  State<ScheduleNotificationDialog> createState() =>
      _ScheduleNotificationDialogState();
}

class _ScheduleNotificationDialogState
    extends State<ScheduleNotificationDialog> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay _selectedTime = TimeOfDay.now();
  DateTime _selectedDate = DateTime.now();
  bool _repeatNotification = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Schedule Notification',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 16),
              ListTile(
                title: const Text('Select Date'),
                subtitle: Text(
                    '${_selectedDate.year}-${_selectedDate.month}-${_selectedDate.day}'),
                trailing: const Icon(Icons.calendar_today),
                onTap: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: _selectedDate,
                    firstDate: DateTime.now(),
                    lastDate: DateTime.now().add(const Duration(days: 365)),
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedDate = picked;
                    });
                  }
                },
              ),
              ListTile(
                title: const Text('Select Time'),
                subtitle: Text(_selectedTime.format(context)),
                trailing: const Icon(Icons.access_time),
                onTap: () async {
                  final TimeOfDay? picked = await showTimePicker(
                    context: context,
                    initialTime: _selectedTime,
                  );
                  if (picked != null) {
                    setState(() {
                      _selectedTime = picked;
                    });
                  }
                },
              ),
              SwitchListTile(
                title: const Text('Repeat Notification'),
                value: _repeatNotification,
                onChanged: (bool value) {
                  setState(() {
                    _repeatNotification = value;
                  });
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: const Text('Cancel'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        final DateTime scheduledDateTime = DateTime(
                          _selectedDate.year,
                          _selectedDate.month,
                          _selectedDate.day,
                          _selectedTime.hour,
                          _selectedTime.minute,
                        );

                        Navigator.pop(context, {
                          'scheduledDateTime': scheduledDateTime,
                          'repeatNotification': _repeatNotification,
                        });
                      }
                    },
                    child: const Text('Schedule'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
