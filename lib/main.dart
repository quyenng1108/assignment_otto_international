import 'package:assignment_otto_international/src/constants.dart';
import 'package:assignment_otto_international/src/dependencies.dart';
import 'package:assignment_otto_international/src/routes.dart';
import 'package:assignment_otto_international/src/state/authentication_state.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  await Hive.openBox(bookmarkBox);
  await Dependencies.registerDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => AuthenticationState())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        onGenerateRoute: RouteGeneration.generateRoute,
      ),
    );
  }
}
