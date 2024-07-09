import 'package:flutter/material.dart';
import '../widget/text_field_widget.dart';

class AddServicePage extends StatelessWidget {
  const AddServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Service Name',
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Choose File',
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Row(
            children: [
              Expanded(
                child: CustomTextFormField(
                  hintText: 'First Hour Charge',
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: CustomTextFormField(
                  hintText: 'Later Hour Charge',
                  keyboardType: TextInputType.number,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const CustomTextFormField(
            hintText: 'Description',
            maxLines: 3,
          ),
          const SizedBox(height: 16),
          Center(
            child: ElevatedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text('Add Service'),
            ),
          )
        ],
      ),
    );
  }
}
