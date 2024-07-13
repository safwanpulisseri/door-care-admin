class ServiceUtil {
  ServiceUtil._();

  static String? validateServiceName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a service name';
    }
    return null;
  }

  static String? validateFile(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please choose a file';
    }
    return null;
  }

  static String? validateFirstHourCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the first hour charge';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? validateLaterHourCharge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter the later hour charge';
    }
    if (double.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  }
}
