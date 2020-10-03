import 'package:flutter/material.dart';

class ContactValidator {
  String value;
  String message;
  FocusNode focusNode;
  BuildContext context;

  ContactValidator(this.value, {this.focusNode, this.context});

  static String validation({value, fieldName, focusNode, context}) {
    final validator =
        ContactValidator(value, focusNode: focusNode, context: context);
    return validator.validate(fieldName);
  }

  String validateName() {
    return validate('name');
  }

  String validateEmail() {
    return validate('email');
  }

  String validatePhone() {
    return validate('phone');
  }

  String validate(String field) {
    String message;
    switch (field) {
      case 'name':
        message = _checkName();
        break;
      case 'email':
        message = _checkEmail();
        break;
      case 'phone':
        message = _checkPhone();
        break;
    }
    if (message != null && focusNode != null && context != null) {
      FocusScope.of(context).requestFocus(focusNode);
    }
    return message;
  }

  _checkName() {
    message = 'Preencha o nome do contato';
    return value.isEmpty ? message : null;
  }

  _checkEmail() {
    message = 'Email é obrigatório';
    return value.isEmpty ? message : null;
  }

  _checkPhone() {
    message = 'Telefone é obrigatório';
    return value.isEmpty ? message : null;
  }
}
