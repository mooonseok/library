import 'package:client/database/book/db_connection.dart';
import 'package:client/di/provider_setup.dart';
import 'package:client/pages/book_add_page/book_add_page.dart';
import 'package:client/pages/home/home_page.dart';
import 'package:client/styles/color_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(MultiProvider(
    providers: globalProviders,
    child: const App(),
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DBConnection.getInstance();
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('ko', 'KR'),
          ],
          locale: const Locale('ko'),
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                elevation: 0, systemOverlayStyle: SystemUiOverlayStyle.dark),
            scaffoldBackgroundColor: ColorType.systemWhite.color,
          ),
          initialRoute: HomePage.routeName,
          routes: {
            HomePage.routeName: (context) => const HomePage(),
            BookAddPage.routeName: (context) => const BookAddPage()
          },
        );
      },
    );
  }
}
