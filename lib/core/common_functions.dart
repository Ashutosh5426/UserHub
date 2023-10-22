String validateEmail(String? value) {
  if(value==null || value.isEmpty) {
    return 'Enter a valid email address';
  }
  const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  final regex = RegExp(pattern);

  return !regex.hasMatch(value)
      ? 'Enter a valid email address'
      : '';
}

String validatePassword(String value) {
  if (value.isEmpty) {
    return 'Please enter password';
  }
  if (value.length < 6) {
    return 'Password should have 6 to 10 characters';
  }
  if (value.length > 10) {
    return 'Password should have 6 to 10 characters';
  }
  if (!RegExp(r'^(?=.*[a-z])').hasMatch(value)) {
    return 'Password should have at least one lower case letter';
  }
  if (!RegExp(r'^(?=.*[A-Z])').hasMatch(value)) {
    return 'Password should have at least one upper case letter';
  }
  if (!RegExp(r'^(?=.*[@$!%*?&])').hasMatch(value)) {
    return 'Password should contain at least one special symbol';
  }
  return '';
}