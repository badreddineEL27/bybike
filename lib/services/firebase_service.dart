import 'dart:developer';

import 'package:bybike/utils/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../models/login_model.dart';
import '../utils/user_session.dart';

class FirebaseService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<String> register(LoginModel loginModel) async {
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: loginModel.email,
        password: loginModel.password,
      );
      User? user = userCredential.user;
      if (user != null) {
        await _firestore
            .collection('users')
            .doc(user.uid)
            .set(loginModel.toJson());
        if (userCredential.user != null) {
          return "Sucess";
        } else {
          log("================${loginModel.toJson()}");
          return 'Unable to Register';
        }
      } else {
        log("================${loginModel.toJson()}");
        return 'Unable to Register';
      }
    } on PlatformException catch (err) {
      print('PlatformException: $err');
      return err.toString();
    } catch (e) {
      print('Error during registration: $e');
      return '${e.toString()}';
    }
  }

  Future<String> loginUser(LoginModel loginModel) async {
    try {
      if (loginModel.email.isNotEmpty && loginModel.password.isNotEmpty) {
        try {
          UserCredential userCredential =
              await _auth.signInWithEmailAndPassword(
            email: loginModel.email,
            password: loginModel.password,
          );

          if (userCredential.user != null) {
            loginModel.uuid = userCredential.user!.uid;
            UserSession().createSession(user: loginModel);
            return "Sucess";
          } else {
            return 'OTHER';
          }
        } catch (e) {
          log("==============>${e}");
        }
      } else {
        return "Please enter email and password";
      }
      return "";
    } on PlatformException catch (err) {
      print('PlatformException: $err');
      return err.toString();
    } catch (e) {
      print('Error during registration: $e');
      return '${e.toString()}';
    }
  }

  Future<bool> logOut() async {
    try {
      await _auth.signOut();
      if(await GoogleSignIn().isSignedIn()) {
        await GoogleSignIn().signOut();
      }
      await FacebookAuth.instance.logOut();
      bool result = await UserSession().logout();
      return result;
    } catch (e) {
      print('Error during registration: $e');
      return false;
    }
  }

  Future<String> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
      print("Password reset email sent to $email");
      return "Success";
    } catch (e) {
      print("Error sending password reset email: $e");
      return e.toString();
    }
  }

  Future<String> resetPassword(
      String email, String oobCode, String newPassword) async {
    try {
      await _auth.confirmPasswordReset(code: oobCode, newPassword: newPassword);
      print("Password reset successfully for user $email");
      return "Success";
    } on FirebaseAuthException catch (e) {
      if (e.message!.contains("expired-action-code")) {
        return "Code Expired";
      } else if (e.message!.contains("invalid-action-code")) {
        return "Invalid Code";
      } else if (e.message!.contains("user-not-found")) {
        return "User Not Found";
      } else if (e.message!.contains("user-disabled")) {
        return "User has been disabled";
      }
      print("Error resetting password: $e");
      return "$e";
    }
  }
}
