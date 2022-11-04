import 'package:exarth/resources/colors/colors.dart';
import 'package:exarth/utils/utils/displaying_outcoms.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController __passwordController = TextEditingController();
  FocusNode emailFocusNode = FocusNode();
  FocusNode passwordFocusNode = FocusNode();
  ValueNotifier<bool> obsecurePassword = ValueNotifier<bool>(true);

  @override
  void dispose() {
    super.dispose();

    _emailController.dispose();
    __passwordController.dispose();

    emailFocusNode.dispose();
    passwordFocusNode.dispose();
    obsecurePassword.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final authviewModel = Provider.of<AuthViewModel>(context);
    final height = MediaQuery.of(context).size.height * 1;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red,
          title: Center(child: Text("Login Screen")),
        ),
        body: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Exarth",
                style: TextStyle(fontSize: 35, color: AppColor.buttonColor),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    focusNode: emailFocusNode,
                    decoration: InputDecoration(
                      hintText: "Email",
                      labelText: "Email",
                      prefixIcon: Icon(Icons.email_outlined),
                    ),
                    onFieldSubmitted: (value) {
                      Utils.feildFocusChange(
                          context, emailFocusNode, passwordFocusNode);
                    }),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: ValueListenableBuilder(
                  valueListenable: obsecurePassword,
                  builder:
                      (BuildContext context, dynamic value, Widget? child) {
                    return TextFormField(
                      focusNode: passwordFocusNode,
                      controller: __passwordController,
                      obscureText: obsecurePassword.value,
                      obscuringCharacter: "*",
                      decoration: InputDecoration(
                        hintText: "Password",
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock_outlined),
                        suffixIcon: InkWell(
                            onTap: () {
                              obsecurePassword.value = !obsecurePassword.value;
                            },
                            child: Icon(obsecurePassword.value
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined)),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: height * .08,
              ),
              //
            ],
          ),
        ));
  }
}
