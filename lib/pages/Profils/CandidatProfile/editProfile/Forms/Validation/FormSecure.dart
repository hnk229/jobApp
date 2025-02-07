// ignore: file_names
String? validateText(String? value) {
  if (value == null || value.isEmpty) {
    return 'This Field must not be empty';
  }
  if (value.length <= 2) {
    return 'Invalid';
  }
  // if(state.hasError){

  // }
  if (int.tryParse(value[0]) != null) {
    return 'Invalid';
  }
  return null;
}

String? validatorEmail(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please enter your email';
  }
  if (value.length != value.replaceAll('  ', '').length) {
    return 'Email cannot contain spaces';
  }
  // Expression régulière pour valider le format de l'email
  final RegExp emailRegExp = RegExp(
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
  );

  if (!emailRegExp.hasMatch(value)) {
    return 'Invalid email';
  }
  if (value.length <= 5) {
    return 'Invalid email';
  }
  if (int.tryParse(value[0]) != null) {
    return 'L\'email ne peut pas commencer par un nombre';
  }
  return null;
}

String? validateDropdown(String? value) {
  if (value == null || value.isEmpty) {
    return 'Please select an item';
  }
  return null;
}

String? validateLink(String? value) {
  // if (value == null || value.isEmpty) {
  //   return 'Please select an item';
  // }
  return null;
}

String? validatorDescription(String? value) {
  if (value == null || value.isEmpty) {
    return 'This Field must not be empty';
  }
  if (value.length <= 150) {
    return 'Your description must contain at least 100 characters';
  }

  return null;
}

String? validatorPhone(String? value) {
  if (value == null || value.isEmpty) {
    return 'Phone number is required';
  }
  // Utilisation d'une expression régulière pour valider que le numéro contient uniquement des chiffres
  final RegExp phoneRegExp = RegExp(r'^[0-9]+$');

  if (!phoneRegExp.hasMatch(value)) {
    return 'Invalid phone number';
  }

  // Vérifie la longueur du numéro (par exemple, entre 8 et 15 chiffres)
  if (value.length < 8 || value.length > 15) {
    return 'Invalide phone number';
  }
  return null;
}

String? validatorNumber(String? value) {
  if (value == null || value.isEmpty) {
    return 'Your experience is required';
  }
  // Utilisation d'une expression régulière pour valider que le numéro contient uniquement des chiffres
  final RegExp phoneRegExp = RegExp(r'^[0-9]+$');

  if (!phoneRegExp.hasMatch(value)) {
    return 'Invalid Experience';
  }

  // Vérifie la longueur du numéro (par exemple, entre 8 et 15 chiffres)
  // if (value.length < 1) {
  //   return 'Invalid Experience';
  // }
  return null;
}


String? validatorPassword(String? value) {
  if (value == null || value.isEmpty) {
    return 'This Field must not be empty';
  }
  if (value.length < 8) {
    return 'Your description must contain at least 100 characters';
  }

  return null;
}
