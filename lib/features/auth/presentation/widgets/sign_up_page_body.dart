import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_alert_dialog_widget.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/presentation/controller/credential/credential_cubit.dart';
import 'package:medical_app/features/auth/presentation/widgets/login_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

class SignUpPageBody extends StatefulWidget {
  const SignUpPageBody({super.key});

  @override
  State<SignUpPageBody> createState() => _SignUpPageBodyState();
}

class _SignUpPageBodyState extends State<SignUpPageBody> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void dispose() {
    _usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            // SignUpFormSection(formKey: _formKey),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  TextFieldContainerWidget(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your name';
                      }
                      return null;
                    },
                    hintText: 'Enter your name',
                    controller: _usernameController,
                    semanticsLabel: 'Name',
                    prefixIcon: 'assets/icons/User.svg',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldContainerWidget(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter your email';
                      }
                      if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                          .hasMatch(value)) {
                        return 'Please a valid Email';
                      }
                      return null;
                    },
                    hintText: 'Enter your email',
                    controller: _emailController,
                    semanticsLabel: 'Email',
                    prefixIcon: 'assets/icons/Email.svg',
                    textInputType: TextInputType.text,
                  ),
                  const SizedBox(height: 16),
                  TextFieldPasswordContainerWidget(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please Enter a Password';
                      }
                      if (value.length < 6) {
                        return 'Password must contain 6 characters at least';
                      }
                      return null;
                    },
                    semanticsLabel: 'Password',
                    controller: _passwordController,
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),
            BlocConsumer<CredentialCubit, CredentialState>(
              listener: (context, state) {
                if (state is CredentialSuccess) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return CustomAlertDialogWidget(
                        assetsIcon: 'assets/icons/Done.svg',
                        titleText: 'Success',
                        descriptionText:
                            'Your account has been successfully registered.',
                        buttonText: 'Login',
                        onPressed: () {
                          Navigator.pushNamedAndRemoveUntil(context,
                              AppRoutes.loginPageRoute, (route) => false);

                        },
                      );
                    },
                  );
                }
              },
              builder: (context, state) {
                if (state is CredentialLoading) {
                  return const CircularProgressIndicator();
                }
                if (state is CredentialFailure) {
                  print('failure');
                }
                return CustomElevatedButtonWidget(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitSignUp();
                    } else {
                      return;
                    }
                  },
                  text: 'Sign Up',
                );
              },
            ),
            const LoginTextButtonWidget()
          ],
        ),
      ),
    );
  }

  void _submitSignUp() {
    BlocProvider.of<CredentialCubit>(context).submitSignUp(
      userEntity: UserEntity(
        name: _usernameController.text,
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
