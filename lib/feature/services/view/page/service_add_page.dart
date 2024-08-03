import 'dart:developer';
import 'dart:io';
import 'package:doorcareadmin/feature/services/bloc/add_service/add_service_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:toastification/toastification.dart';
import '../../../../core/theme/color/app_color.dart';
import '../../../../core/util/toastification_widget.dart';
import '../../../auth/view/widget/loading_dialog.dart';
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
    return BlocListener<AddServiceBloc, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceLoadingState) {
          log("loading...");
          LoadingDialog.show(context);
        } else if (state is AddServiceSuccessState) {
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.success,
            title: 'Success',
            description: 'Successfully signed up!',
            textColor: AppColor.secondary,
          );
        } else if (state is AddServiceFailState) {
          // Navigator.pop(context);
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.error,
            title: 'Error',
            description: 'Failed to sign up. Please try again.',
            textColor: AppColor.secondary,
          );
        }
      },
      child: Padding(
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
      ),
    );
  }

  Future<String?> _uploadImageToFirebase(File image) async {
    try {
      Reference reference = FirebaseStorage.instance.ref().child(
            "images/${DateTime.now().millisecondsSinceEpoch}.png",
          );
      await reference.putFile(image);
      return await reference.getDownloadURL();
    } catch (e) {
      ToastificationWidget.show(
        context: context,
        type: ToastificationType.error,
        title: 'Error',
        description: 'Failed to Upload Image into Firebase',
        textColor: AppColor.secondary,
      );
      return null;
    }
  }
}
