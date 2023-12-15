import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class LoginForm extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final Function onPasswordVisibilityChanged;
  final bool isPasswordVisible;

  const LoginForm({
    Key? key,
    required this.usernameController,
    required this.passwordController,
    required this.onPasswordVisibilityChanged,
    required this.isPasswordVisible,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // text field for username
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: FormBuilderTextField(
            name: 'username',
            controller: usernameController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Username is required',
              ),
              FormBuilderValidators.minLength(
                3,
                errorText: 'Username must be at least 3 characters',
              ),
              FormBuilderValidators.maxLength(
                100,
                errorText: 'Username must be less than 100 characters',
              ),
            ]),
            decoration: InputDecoration(
              hintText: 'Username',
              hintStyle: kBodyTextStyle,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        // text field for password
        Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: FormBuilderTextField(
            name: 'password',
            controller: passwordController,
            validator: FormBuilderValidators.compose([
              FormBuilderValidators.required(
                errorText: 'Password is required',
              ),
              FormBuilderValidators.minLength(
                8,
                errorText: 'Password must be at least 8 characters',
              ),
            ]),
            obscureText: !isPasswordVisible,
            decoration: InputDecoration(
              hintText: 'Password',
              hintStyle: kBodyTextStyle,
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              suffixIcon: IconButton(
                onPressed: () => onPasswordVisibilityChanged(),
                icon: Icon(
                  isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                  color: Theme.of(context).colorScheme.onSecondary,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
