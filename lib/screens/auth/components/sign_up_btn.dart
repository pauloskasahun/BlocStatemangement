import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import '../../../blocs/sign_up_bloc/sign_up_bloc.dart';

class SignUpButton {
  Widget signUpbutton(
      {required BuildContext context,
      required GlobalKey<FormState> formKey,
      required TextEditingController passwordController,
      required TextEditingController emailController,
      required TextEditingController nameController}) {
    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: TextButton(
              style: TextButton.styleFrom(
                  elevation: 3.0,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(60))),
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  MyUser myUser = MyUser.empty;
                  myUser = myUser.copyWith(
                    email: emailController.text,
                    name: nameController.text,
                  );
                  setState(() {
                    context
                        .read<SignUpBloc>()
                        .add(SignUpRequired(myUser, passwordController.text));
                  });
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 5),
                child: Text(
                  'Sign Up',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
              )),
        );
      },
    );
  }
}
