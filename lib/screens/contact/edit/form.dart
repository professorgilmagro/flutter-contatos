import 'package:contact_app/helpers/validator.dart';
import 'package:contact_app/models/contact.dart';
import 'package:contact_app/screens/contact/list/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

Widget ContactForm({
  Contact contact,
  TextEditingController nameController,
  TextEditingController emailController,
  TextEditingController phoneController,
  Function onAvatarLongPress,
  Function onAvatarTap,
  Function onChangeName,
  Function onChangeEmail,
  Function onChangePhone,
  GlobalKey formKey,
  BuildContext context,
}) {
  contact = contact ?? Contact();
  FocusNode nameFocus = FocusNode();
  FocusNode emailFocus = FocusNode();
  FocusNode phoneFocus = FocusNode();
  final maskPhoneFormatter = MaskTextInputFormatter(
    mask: '(##) #####-####',
    filter: {
      "#": RegExp(r'[0-9]'),
    },
  );
  return Padding(
    padding: EdgeInsets.all(20),
    child: Form(
      key: formKey,
      child: Column(
        children: [
          Avatar(
              imageFile: contact.image,
              onAvatarLongPress: onAvatarLongPress,
              onAvatarTap: onAvatarTap,
              size: 180),
          ContactText(
            label: 'Nome',
            controller: nameController,
            iconData: Icons.person,
            keyboardType: TextInputType.name,
            onInputChanged: onChangeName,
            padding: EdgeInsets.only(top: 40),
            focusNode: nameFocus,
            validator: (text) => ContactValidator.validation(
              value: text,
              fieldName: 'name',
              context: context,
              focusNode: nameFocus,
            ),
          ),
          ContactText(
              controller: emailController,
              focusNode: emailFocus,
              label: 'Email',
              iconData: Icons.email,
              keyboardType: TextInputType.emailAddress,
              onInputChanged: onChangeEmail,
              validator: (text) => ContactValidator.validation(
                    value: text,
                    fieldName: 'email',
                  ),
              padding: EdgeInsets.only(top: 20)),
          ContactText(
              controller: phoneController,
              focusNode: phoneFocus,
              inputFormatters: [maskPhoneFormatter],
              label: 'Telefone',
              iconData: Icons.phone,
              onInputChanged: onChangePhone,
              keyboardType: TextInputType.phone,
              validator: (text) => ContactValidator.validation(
                    value: text,
                    fieldName: 'phone',
                  ),
              padding: EdgeInsets.only(top: 20)),
        ],
      ),
    ),
  );
}

Widget ContactText(
    {EdgeInsetsGeometry padding,
    @required String label,
    String hintText,
    TextEditingController controller,
    TextInputType keyboardType,
    Function validator,
    IconData iconData,
    List<TextInputFormatter> inputFormatters,
    FocusNode focusNode,
    Function onInputChanged}) {
  return Padding(
    padding: padding,
    child: TextFormField(
      validator: validator,
      focusNode: focusNode,
      inputFormatters: inputFormatters,
      controller: controller,
      keyboardType: keyboardType,
      style: GoogleFonts.abel(color: Colors.white, fontSize: 22),
      decoration: InputDecoration(
        focusedErrorBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.white, width: 2.0),
        ),
        labelText: label,
        hintText: hintText,
        prefixIcon: Icon(
          iconData,
          color: Colors.white,
          size: 20,
        ),
        errorStyle: GoogleFonts.abel(color: Colors.yellow, fontSize: 14),
      ),
      onChanged: onInputChanged,
    ),
  );
}
