import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:medical_app/core/constants/app_routers.dart';
import 'package:medical_app/core/widgets/custom_elevated_button_widget.dart';
import 'package:medical_app/features/auth/domain/entities/user_entity.dart';
import 'package:medical_app/features/auth/presentation/controller/auth/auth_cubit.dart';
import 'package:medical_app/features/auth/presentation/controller/credential/credential_cubit.dart';
import 'package:medical_app/features/auth/presentation/widgets/forgot_password_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/sign_up_text_button_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/social_sign_in_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_container_widget.dart';
import 'package:medical_app/features/auth/presentation/widgets/text_field_password_container_widget.dart';

class LoginPageBody extends StatefulWidget {
  const LoginPageBody({super.key});

  @override
  State<LoginPageBody> createState() => _LoginPageBodyState();
}

class _LoginPageBodyState extends State<LoginPageBody> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  late final String userId;

  @override
  void dispose() {
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
            Form(
              key: _formKey,
              child: Column(
                children: [
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
                    prefixIcon: 'assets/icons/Email.svg',
                    hintText: 'Enter your email',
                    controller: _emailController,
                    semanticsLabel: 'Email',
                    textInputType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextFieldPasswordContainerWidget(
                    validator: (String? value) {
                      if (value!.isEmpty) {
                        return 'Please re-enter password';
                      }
                      return null;
                    },
                    controller: _passwordController,
                    semanticsLabel: 'Password',
                    hintText: 'Enter your password',
                  ),
                ],
              ),
            ),
            const ForgotPasswordTextButtonWidget(),
            const SizedBox(height: 32),

            ///FIXME: Bloc Listener always casting
            BlocConsumer<CredentialCubit, CredentialState>(
              listener: (context, state) {
                if (state is CredentialSuccess) {
                  BlocProvider.of<AuthCubit>(context).loggedIn();
                }
                if (state is CredentialFailure) {
                  const snackBar = SnackBar(
                    duration: Duration(seconds: 2),
                    content: Center(child: Text('Wrong Email or Password')),
                  );
                  ScaffoldMessenger.of(context).showSnackBar(snackBar);
                }
              },
              builder: (context, state) {
                if (state is CredentialLoading) {
                  return const Center(child: CircularProgressIndicator());
                }
                if (state is CredentialFailure) {
                  print('Failure');
                }
                return CustomElevatedButtonWidget(
                  text: 'Login',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _submitSignIn();
                    } else {
                      print("UnSuccessful");
                    }
                  },
                );
              },
            ),
            const SizedBox(height: 24),
            const SignUpTextButtonWidget(),
            Row(
              children: [
                const Expanded(
                  child: Divider(
                    endIndent: 20,
                    height: 20,
                    thickness: 2,
                    color: Color(0xffE5E7EB),
                  ),
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: const Color(
                      0xffA1A8B0,
                    ),
                  ),
                ),
                const Expanded(
                  child: Divider(
                    indent: 20,
                    height: 20,
                    thickness: 2,
                    color: Color(0xffE5E7EB),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SocialSignInWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.rootPageRoute);
              },
              text: 'Sign in with Google',
              icon: 'assets/icons/Google.svg',
            ),
            const SizedBox(height: 16),
            SocialSignInWidget(
              onPressed: () {
                Navigator.pushReplacementNamed(
                    context, AppRoutes.rootPageRoute);
              },
              text: 'Sign in with Facebook',
              icon: 'assets/icons/Facebook.svg',
            ),
          ],
        ),
      ),
    );
  }

  void _submitSignIn() {
    BlocProvider.of<CredentialCubit>(context).submitSignIn(
      userEntity: UserEntity(
        email: _emailController.text,
        password: _passwordController.text,
      ),
    );
  }
}
