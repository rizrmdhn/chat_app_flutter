import 'package:auth/presentation/bloc/auth_user/auth_user_bloc.dart';
import 'package:auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:message/presentation/pages/message_page.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    // load blocs
    Future.microtask(() => context.read<AuthUserBloc>().add(LoadAuthUser()));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // scaffold with child column in center of screen
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: BlocConsumer<AuthUserBloc, AuthUserState>(
        listener: (context, state) {
          if (state is AuthUserLoaded) {
            Navigator.pushReplacementNamed(context, MessagePage.routeName);
          } else if (state is AuthUserError) {
            Navigator.pushReplacementNamed(context, LoginPage.routeName);
          }
        },
        builder: (context, state) => Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo
              Icon(
                Icons.chat,
                size: 100,
                color: Theme.of(context).colorScheme.secondary,
              ),
              const SizedBox(height: 20),
              // app name
              Text(
                'Chat App',
                style: Theme.of(context).textTheme.titleLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
