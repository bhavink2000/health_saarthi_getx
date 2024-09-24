class ValidatorHelper {
  static String? validatePANCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'PAN card number is required';
    }
    value = value.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    if (value.length != 10) {
      return 'PAN card no must be 10 characters long';
    }
    RegExp panCardRegExp = RegExp(r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$');

    if (!panCardRegExp.hasMatch(value)) {
      return 'Enter a valid PAN no (Example: ABCDE1234F)';
    }
    return null;
  }

  static String? validateIFSC(String? value) {
    if (value == null || value.isEmpty) {
      return 'IFSC code is required';
    }
    value = value.replaceAll(RegExp(r'\s+'), '').toUpperCase();
    if (value.length != 11) {
      return 'IFSC code must be 11 characters long';
    }
    if (!RegExp(r'^[A-Z]{4}').hasMatch(value.substring(0, 4))) {
      return 'Invalid IFSC code format: First four characters must be letters';
    }
    if (value[4] != '0') {
      return 'Fifth character must be "0"';
    }
    if (!RegExp(r'^[A-Z0-9]{6}$').hasMatch(value.substring(5, 11))) {
      return 'Last six characters must be alphanumeric';
    }
    return null; // Return null if the IFSC code is valid
  }

  static String? validateAccountNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Account number is required';
    }
    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
      return 'Account number must contain only digits';
    }
    return null; // Return null if the account number is valid
  }
}