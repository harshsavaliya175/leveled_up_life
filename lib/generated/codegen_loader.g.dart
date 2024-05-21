// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes, avoid_renaming_method_parameters

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>?> load(String path, Locale locale) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "hey_welcome_back": "Hey! Welcome Back",
  "lets_sign_in_for_explore_continues": "Let’s Sign In for explore continues.",
  "full_name": "Full Name",
  "enter_full_name": "Enter full name",
  "email_address": "Email Address",
  "enter_email": "Enter email",
  "password": "Password",
  "enter_password": "Enter password",
  "confirm_password": "Confirm Password",
  "re_enter_password": "Re-enter password",
  "forgot_password": "Forgot Password?",
  "sign_in": "Sign In",
  "sign_up": "Sign Up",
  "do_not_have_an_account": "Don’t have an account?",
  "have_an_account": "Have an account?",
  "lets_get_started": "Let’s Get Started",
  "create_an_account_to_get_all_features": "Create an account to get all features",
  "forgot_password_title": "Forgot Password",
  "enter_your_email_and_reset_password": "Enter your email & reset Password",
  "request": "Request",
  "remember_password": "Remember Password?",
  "reset_password": "Reset Password",
  "reset_password_description": "Enter otp & reset password",
  "verification_code": "Verification Code",
  "enter_your_verification_code": "Enter your verification code",
  "please_enter_name": "Please enter name",
  "please_enter_email": "Please enter email",
  "please_enter_valid_email": "Please enter valid email",
  "please_enter_password": "Please enter password",
  "please_enter_confirm_password": "Please enter confirm password",
  "password_does_not_match": "Password does not match",
  "please_enter_verification_code": "Please enter verification code",
  "something_went_wrong": "Something went wrong"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en};
}
