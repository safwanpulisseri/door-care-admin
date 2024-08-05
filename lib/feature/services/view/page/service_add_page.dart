import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'package:doorcareadmin/feature/services/bloc/add_service/add_service_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
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
  File? _selectedImage;
  String? _serviceImageUrl;

  @override
  void dispose() {
    _serviceNameController.dispose();
    _fileController.dispose();
    _firstHourChargeController.dispose();
    _laterHourChargeController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }

  Future<void> _pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _selectedImage = File(pickedFile.path);
        _fileController.text =
            pickedFile.name; // Optionally update file controller text
      });
      final imageData = await pickedFile.readAsBytes();
      _serviceImageUrl = await uploadImageToFirebase(imageData);
    } else {
      ToastificationWidget.show(
        context: context,
        type: ToastificationType.error,
        title: 'Error',
        description: 'No image selected. Please try again.',
        textColor: AppColor.secondary,
      );
    }
  }

  Future<String?> uploadImageToFirebase(Uint8List imageData) async {
    try {
      final storageRef = FirebaseStorage.instance.ref();
      final imagesRef = storageRef
          .child("images/${DateTime.now().millisecondsSinceEpoch}.png");

      final uploadTask = imagesRef.putData(imageData);
      final snapshot = await uploadTask;
      final downloadURL = await snapshot.ref.getDownloadURL();

      ToastificationWidget.show(
        context: context,
        type: ToastificationType.success,
        title: 'Success',
        description: 'Upload Successfully Completed',
        textColor: AppColor.secondary,
      );

      return downloadURL;
    } catch (e) {
      log(e.toString());
      ToastificationWidget.show(
        context: context,
        type: ToastificationType.error,
        title: 'Error',
        description: 'Failed to upload Image: $e .',
        textColor: AppColor.secondary,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AddServiceBloc, AddServiceState>(
      listener: (context, state) {
        if (state is AddServiceLoadingState) {
          log("loading...");
          LoadingDialog.show(context);
        } else if (state is AddServiceSuccessState) {
          // _serviceNameController.clear();
          // _firstHourChargeController.clear();
          // _laterHourChargeController.clear();
          // _descriptionController.clear();
          _formKey.currentState?.reset();
          setState(() {
            _selectedImage = null;
            _serviceImageUrl = null;
          });

          ToastificationWidget.show(
            context: context,
            type: ToastificationType.success,
            title: 'Success',
            description: 'Successfully Created New Service!',
            textColor: AppColor.secondary,
          );
        } else if (state is AddServiceFailState) {
          // Navigator.pop(context);
          ToastificationWidget.show(
            context: context,
            type: ToastificationType.error,
            title: 'Error',
            description: 'Failed to create a Service. Please try again.',
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
                      suffixIcon: const Icon(IconlyLight.ticketStar),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: GestureDetector(
                      onTap: _pickImage,
                      child: AbsorbPointer(
                        child: ServiceTextFormField(
                          controller: _fileController,
                          hintText: 'Choose File',
                          validator: ServiceUtil.validateFile,
                          suffixIcon: _selectedImage != null
                              ? const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: FaIcon(
                                    FontAwesomeIcons.circleCheck,
                                    color: AppColor.toneEight,
                                  ),
                                )
                              : const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: Icon(
                                    IconlyLight.image2,
                                    color: AppColor.secondary,
                                  ),
                                ),
                        ),
                      ),
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
                      suffixIcon: const Icon(IconlyLight.wallet),
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: ServiceTextFormField(
                      controller: _laterHourChargeController,
                      hintText: 'Later Hour Charge',
                      keyboardType: TextInputType.number,
                      validator: ServiceUtil.validateLaterHourCharge,
                      suffixIcon: const Icon(IconlyLight.wallet),
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
                suffixIcon: const Icon(IconlyLight.paper),
              ),
              const SizedBox(height: 16),
              Center(
                child: ElevatedButton.icon(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (_serviceImageUrl != null) {
                        context.read<AddServiceBloc>().add(
                              AddNewServiceEvent(
                                serviceName: _serviceNameController.text,
                                firstHourCharge: num.tryParse(
                                        _firstHourChargeController.text) ??
                                    0,
                                laterHourCharge: num.tryParse(
                                        _laterHourChargeController.text) ??
                                    0,
                                description: _descriptionController.text,
                                serviceImg: _serviceImageUrl!,
                              ),
                            );
                      } else {
                        ToastificationWidget.show(
                          context: context,
                          type: ToastificationType.error,
                          title: 'Error',
                          description: 'Failed to upload image.',
                          textColor: AppColor.secondary,
                        );
                      }
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
}
