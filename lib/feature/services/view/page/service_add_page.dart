import 'package:flutter/material.dart';
import '../util/add_service_util.dart';
import '../widget/text_field_widget.dart';

class AddServicePage extends StatefulWidget {
  const AddServicePage({super.key});

  @override
  createState() => _AddServicePageState();
}

class _AddServicePageState extends State<AddServicePage> {
  final _formKey = GlobalKey<FormState>();
  final _serviceNameController = TextEditingController();
  final _fileController = TextEditingController();
  final _firstHourChargeController = TextEditingController();
  final _laterHourChargeController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  void dispose() {
    _serviceNameController.dispose();
    _fileController.dispose();
    _firstHourChargeController.dispose();
    _laterHourChargeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: ServiceTextFormField(
                    controller: _serviceNameController,
                    hintText: 'Service Name',
                    validator: ServiceUtil.validateServiceName,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ServiceTextFormField(
                    controller: _fileController,
                    hintText: 'Choose File',
                    validator: ServiceUtil.validateFile,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Expanded(
                  child: ServiceTextFormField(
                    controller: _firstHourChargeController,
                    hintText: 'First Hour Charge',
                    keyboardType: TextInputType.number,
                    validator: ServiceUtil.validateFirstHourCharge,
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: ServiceTextFormField(
                    controller: _laterHourChargeController,
                    hintText: 'Later Hour Charge',
                    keyboardType: TextInputType.number,
                    validator: ServiceUtil.validateLaterHourCharge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            ServiceTextFormField(
              controller: _descriptionController,
              hintText: 'Description',
              maxLines: 3,
              validator: ServiceUtil.validateDescription,
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform the add service action
                  }
                },
                icon: const Icon(Icons.add),
                label: const Text('Add Service'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
