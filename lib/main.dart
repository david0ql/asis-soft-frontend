import 'package:asist_soft/src/routes/routes.dart';
import 'package:asist_soft/src/services/user_service.dart';
import 'package:asist_soft/src/theme/theme.dart';
import 'package:asist_soft/src/user_preferences/user_preferences.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences.init();
  runApp(const AppState());
}

class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<UserService>(
          create: (_) => UserService(),
          lazy: false,
        )
      ],
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Asistencia Soft',
      initialRoute: 'splash',
      routes: MyRoutes.routes,
      theme: UserTheme.theme,
    );
  }
}
