// ignore_for_file: prefer_final_fields

import 'package:exarth/components/colors/col.dart';
import 'package:exarth/components/buttons/buttons.dart';
import 'package:exarth/components/show_messages/show_responses.dart';

import 'package:exarth/view_models/auth_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreenView extends StatefulWidget {
  const LoginScreenView({super.key});

  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  ValueNotifier<bool> _obsecurePassword = ValueNotifier<bool>(true);
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _obsecurePassword.dispose();
    emailFocusNode.dispose();
    passwordFocusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authViewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Center(child: Text("LoginScreen")),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(17.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text('Exarth',
                      style: TextStyle(
                          fontSize: 35, color: AppColors.buttonColor)),
                ],
              ),
              SizedBox(
                height: height * 0.07,
              ),
              TextFormField(
                focusNode: emailFocusNode,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                    hintText: "Email",
                    prefixIcon: Icon(Icons.email_outlined),
                    labelText: "Email"),
                onFieldSubmitted: (value) {
                  ShowResponses.feilFocusChange(
                      context, emailFocusNode, passwordFocusNode);
                },
              ),
              SizedBox(
                height: height * 0.03,
              ),
              ValueListenableBuilder(
                valueListenable: _obsecurePassword,
                builder: (context, value, child) {
                  return TextFormField(
                      focusNode: passwordFocusNode,
                      controller: _passwordController,
                      obscureText: _obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Pasword",
                        labelText: "Pasword",
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              _obsecurePassword.value =
                                  !_obsecurePassword.value;
                            },
                            child: Icon(_obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ));
                },
              ),
              SizedBox(
                height: height * 0.08,
              ),
              Roundbutton(
                  title: "Login",
                  loading: authViewModel.loading,
                  onPress: () {
                    if (_emailController.text.isEmpty) {
                      ShowResponses.flushBarErrorMessage(
                          "Please Enter Email Feilds", context);
                    } else if (_passwordController.text.isEmpty) {
                      ShowResponses.flushBarErrorMessage(
                          "Please Enter Password Feilds", context);
                    } else if (_passwordController.text.length < 6) {
                      ShowResponses.flushBarErrorMessage(
                          "Please Enter 6 Digit Password", context);
                    } else {
                      Map data = {
                        "email": _emailController.text.toString(),
                        "password": _passwordController.text.toString()
                      };
                      authViewModel.loginApi(data, context);
                      // ShowResponses.flushBarSuccessMessage(
                      //     "You Data is Valid You May Go to Home Screen",
                      //     context);
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
