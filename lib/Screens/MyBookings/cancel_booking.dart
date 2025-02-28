import 'package:flutter/material.dart';

import '../../Widgets/customapp_bar.dart';
import '../../Widgets/custombtn.dart';

class CancelBooking extends StatefulWidget {
  const CancelBooking({super.key});

  @override
  State<CancelBooking> createState() => _CancelBookingState();
}

class _CancelBookingState extends State<CancelBooking> {
  String _selectedReason = 'Schedule Change';
  final TextEditingController _otherReasonController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 13,vertical: 14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomAppBar(text: 'Cancel Booking', text1: ''),
              const SizedBox(height: 12,),
              const Text(
                'Please select the reason for cancellations:',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 10),  // Smaller vertical space
              Column(
                children: [
                  _buildRadioOption('Schedule Change'),
                  _buildRadioOption('Weather conditions'),
                  _buildRadioOption('Parking Availability'),
                  _buildRadioOption('Lack of amenities'),
                  _buildRadioOption('I have alternative option'),
                  _buildRadioOption('Other'),
                  if (_selectedReason == 'Other') _buildOtherReasonInput(),
                ],
              ),
              const SizedBox(height: 16),
              // Space between options and button
              CustomButton(text: 'Submit', onTap: (){})
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRadioOption(String reason) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0),  // Reduce padding here
      child: Row(
        children: [
          Radio<String>(
            value: reason,
            groupValue: _selectedReason,
            onChanged: (String? value) {
              setState(() {
                _selectedReason = value!;
              });
            },
          ),
          Text(reason),
        ],
      ),
    );
  }

  Widget _buildOtherReasonInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),  // Reduced space for input
      child: TextField(
        controller: _otherReasonController,
        decoration: const InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10,horizontal: 10),
          labelText: 'Enter your Reason',
          border: OutlineInputBorder(),
        ),
      ),
    );
  }

}