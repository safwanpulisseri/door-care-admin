import 'package:flutter/material.dart';
import '../../../../core/theme/color/app_color.dart';

class DialogInfoWidget extends StatelessWidget {
  final String name;
  final String email;
  final String phone;
  final String location;
  final String category;
  final String experience;
  final String imagePath1;
  final String imagePath2;

  const DialogInfoWidget({
    super.key,
    required this.name,
    required this.email,
    required this.phone,
    required this.location,
    required this.category,
    required this.experience,
    required this.imagePath1,
    required this.imagePath2,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: EdgeInsets.zero,
      content: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text(
                  'Request Details',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(imagePath1),
                    const SizedBox(width: 50),
                    Image.asset(imagePath2),
                  ],
                ),
                const SizedBox(height: 20),
                InfoRow(label: 'Name', value: name),
                InfoRow(label: 'Email', value: email),
                InfoRow(label: 'Phone', value: phone),
                InfoRow(label: 'Location', value: location),
                InfoRow(label: 'Category', value: category),
                InfoRow(label: 'Experience', value: experience),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Positioned(
            right: 0.0,
            top: 0.0,
            child: IconButton(
              icon: const Icon(Icons.cancel),
              color: AppColor.toneThree,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String label;
  final String value;

  const InfoRow({super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Text('$label:',
                style: const TextStyle(fontWeight: FontWeight.bold))),
        Expanded(child: Text(value)),
      ],
    );
  }
}
