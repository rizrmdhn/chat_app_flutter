import 'dart:developer';
import 'package:auth/presentation/bloc/auth_user/auth_user_bloc.dart';
import 'package:auth/presentation/bloc/login/login_bloc.dart';
import 'package:auth/presentation/bloc/logout/logout_bloc.dart';
import 'package:auth/presentation/bloc/register/register_bloc.dart';
import 'package:chat_app/routes/main.dart';
import 'package:core/common/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:chat_app/injection.dart' as di;
import 'package:splash/presentation/pages/splash_page.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  di.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (_) => di.locator<AuthUserBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LoginBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<LogoutBloc>(),
        ),
        BlocProvider(
          create: (_) => di.locator<RegisterBloc>(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData.dark().copyWith(
          colorScheme: kColorScheme,
          primaryColor: kColorPrimary,
          scaffoldBackgroundColor: kColorSecondary,
          textTheme: kTextTheme,
        ),
        home: const SplashPage(),
        onGenerateRoute: (RouteSettings settings) => routes(settings),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late IO.Socket socket;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  void initState() {
    super.initState();
    initSocket();
  }

  initSocket() {
    socket = IO.io(dotenv.env['SOCKET_URL'], <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket.connect();
    socket.onConnect((_) {
      log('connection successful');
    });
    socket.onDisconnect((_) => log('connection disconnected'));
    socket.onConnectError((err) => log('connection error: $err'));
    socket.onError((err) => log('error: $err'));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LogoutBloc, LogoutState>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text(
                  'You have pushed the button this many times:',
                ),
                Text(
                  '$_counter',
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
              ],
            ),
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () async {
              socket.emit('greeting', 'hello');
              context.read<LogoutBloc>().add(Logout());
            },
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
        );
      },
    );
  }
}
