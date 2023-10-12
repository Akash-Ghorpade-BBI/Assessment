
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'features/authentication/presentation/bloc/authentication_bloc.dart';
import 'features/authentication/presentation/bloc/authentication_state.dart';
import 'features/authentication/presentation/pages/authentication_login_screen_page.dart';
import 'features/authentication/presentation/pages/authentication_signup_screen_page.dart';
import 'features/home_screen/presentation/pages/home_screen_page.dart';
import 'injection_container.dart';
import 'package:clean_architecture_of_json_assisment/injection_container.dart'
as di;

import 'features/home_screen/presentation/bloc/home_screen_bloc.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:BlocHandler()
    );
  }
}

class BlocHandler extends StatelessWidget {
  const BlocHandler({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (BuildContext context) => sl<AuthenticationBloc>(),
        ),
        BlocProvider<HomeScreenBloc>(
          create: (BuildContext context) => sl<HomeScreenBloc>(),
        ),
      ],
      child: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (BuildContext context, state) {
          if (state is AuthenticationInitial) {
            return LoginScreen();
          } else if (state is AuthenticationSigninToSignupState) {
            return SignUpScreen();
          } else if (state is AuthenticationSignupState) {
            return LoginScreen();
          } else if (state is AuthenticationSigninState) {
            return BlocBuilder<HomeScreenBloc, HomeScreenState>(
              builder: (BuildContext context, state) {
                if (state is HomeScreenInitial) {
                  return const HomeScreenPage();
                } else {
                  return Container();
                }
              },
            );
          } else {
            return LoginScreen();
          }
        },
      ),
    );
  }
}