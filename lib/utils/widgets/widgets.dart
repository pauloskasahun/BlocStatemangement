// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:blocapp/blocs/authentication_bloc/authentication_bloc.dart';
import 'package:blocapp/blocs/sign_in_bloc/sign_in_bloc.dart';
import 'package:blocapp/blocs/sign_up_bloc/sign_up_bloc.dart';
import 'package:blocapp/screens/auth/sign_in_screen.dart';
import 'package:blocapp/screens/auth/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyWidgets {
  Widget tabar(BuildContext context, double divisionFactor,
      TabController tabController) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
          height: MediaQuery.of(context).size.height / divisionFactor,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: TabBar(
                  dividerHeight: 0.0,
                  indicatorSize: TabBarIndicatorSize.label,
                  tabs: const [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign In',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Sign Up',
                        style: TextStyle(fontSize: 18),
                      ),
                    )
                  ],
                  controller: tabController,
                  labelColor: Theme.of(context).colorScheme.onBackground,
                  unselectedLabelColor: Theme.of(context)
                      .colorScheme
                      .onBackground
                      .withOpacity(0.5),
                ),
              ),
              tabview(tabController),
            ],
          )),
    );
  }

  Widget tabview(TabController tabController) {
    return Expanded(
        child: TabBarView(controller: tabController, children: [
      BlocProvider<SignInBloc>(
        create: (context) => SignInBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository),
        child: const SignInScreen(),
      ),
      BlocProvider<SignUpBloc>(
        create: (context) => SignUpBloc(
            userRepository: context.read<AuthenticationBloc>().userRepository),
        child: const SignUpScreen(),
      ),
    ]));
  }
}
