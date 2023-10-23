import 'package:flutter/material.dart';
import 'package:user_hub/core/app_constants/app_strings.dart';
import 'package:user_hub/core/common_functions.dart';
import 'package:user_hub/core/common_widgets/common_button_widget.dart';
import 'package:user_hub/core/common_widgets/common_toast.dart';
import 'package:user_hub/core/shared_preference/shared_preference.dart';
import 'package:user_hub/features/user_list_page/ui/users_list_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  ValueNotifier<String> errorEmailText = ValueNotifier('');
  ValueNotifier<String> errorPasswordText = ValueNotifier('');

  @override
  void initState() {
    _emailController = TextEditingController(text: SharedPreference().getString(key: AppStrings.emailKeyName));
    _passwordController = TextEditingController(text: SharedPreference().getString(key: AppStrings.passwordKeyName));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Spacer(),
              /// Email Address Text Field
              SizedBox(
                height: 48,
                child: TextFormField(
                  style: const TextStyle(
                    height: 1,
                  ),
                  controller: _emailController,
                  onChanged: (String value){
                    errorEmailText.value = validateEmail(value);
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.enterEmail,
                    hintStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF4B4D50),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFB1B3B5),
                        width: 1,
                      ),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFB0101),
                        width: 1,
                      ),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                    valueListenable: errorEmailText,
                    builder: (context, value, _) {
                      return Text(
                        value,
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0xFFFB0101),
                        ),
                      );
                    }
                  ),
                ],
              ),
              const SizedBox(height: 24),
              /// Password Text Field
              SizedBox(
                height: 48,
                child: TextFormField(
                  style: const TextStyle(height: 1),
                  controller: _passwordController,
                  onChanged: (String value){
                    errorPasswordText.value = validatePassword(value);
                  },
                  decoration: InputDecoration(
                    hintText: AppStrings.enterPassword,
                    hintStyle: const TextStyle(fontSize: 14),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFF4B4D50),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFB1B3B5),
                        width: 1,
                      ),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                    errorBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                        color: Color(0xFFFB0101),
                        width: 1,
                      ),
                      borderRadius:
                      BorderRadius.circular(10),
                    ),
                  ),
                  obscureText: true,
                ),
              ),
              Row(
                children: [
                  ValueListenableBuilder(
                      valueListenable: errorPasswordText,
                      builder: (context, value, _) {
                        return Text(
                          value,
                          style: const TextStyle(
                            fontSize: 10,
                            color: Color(0xFFFB0101),
                          ),
                        );
                      }
                  ),
                ],
              ),
              const SizedBox(height: 24),
              const Spacer(),
              CustomButtonWidget(
                onPressed: () async {
                  if (_emailController.text.isEmpty || _passwordController.text.isEmpty) {
                    CommonToast.showToast(AppStrings.pleaseEnterEmailAndPassword);
                    return;
                  }
                  bool isEmailSaved = await SharedPreference().saveString(key: AppStrings.emailKeyName, value: _emailController.text);
                  bool isPasswordSaved = await SharedPreference().saveString(key: AppStrings.passwordKeyName, value: _passwordController.text);
                  if(isEmailSaved && isPasswordSaved){
                    if (context.mounted) Navigator.of(context).push(MaterialPageRoute(builder: (_) => const UsersListPage()));
                  }
                },
                buttonText: AppStrings.logIn,
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}