import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';
import 'package:huoon/ui/Routes/pages_routes.dart';
import 'package:huoon/ui/pages/loginFb.dart';
import 'package:huoon/ui/pages/rol-admin/Task/TaskCreationPage.dart';
import 'package:huoon/ui/pages/rol-admin/product/productCreationPage.dart';
import 'package:huoon/ui/pages/rol-admin/store/storeCreationPage.dart';
import 'package:huoon/ui/pages/splash/splash_screen.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:signals/signals_flutter.dart';
// TranslationManager.loadDefaultTranslations(languageCode);

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // Configuración de rutas con GoRouter
  final GoRouter _appRouter = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        redirect: (context, state) => '/SplashScreen',
      ),
      GoRoute(
        path: '/SplashScreen',
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: '/LoginFbPage',
        builder: (context, state) => LoginFbPage(),
      ),
      GoRoute(
        path: '/LoginFormPage',
        builder: (context, state) => const LoginFormPage(),
      ),
      GoRoute(
        path: '/HomePrincipal',
        builder: (context, state) {
          final Map<String, dynamic> extra = state.extra as Map<String, dynamic>? ?? {};
          return HomePrincipal(
            name: extra['name'] ?? '',
            email: extra['email'] ?? '',
            avatarUrl: extra['avatarUrl'] ?? '',
          );
        },
      ),
      GoRoute(
        path: '/LoadingPage',
        builder: (context, state) => LoadingPage(),
      ),
      GoRoute(
        path: '/QRViewExample',
        builder: (context, state) => const QRViewPage(),
      ),
      GoRoute(
        path: '/AuthCheck',
        builder: (context, state) => const AuthCheck(),
      ),
      GoRoute(
        name: 'taskCreation',
        path: '/taskCreation/:id', // :id indica que es un parámetro en la URL
        builder: (context, state) {
          // Obtiene el id desde los parámetros de la ruta
          final String? idParam = state.pathParameters['id'];
          final int? id = idParam != null ? int.tryParse(idParam) : null;

          return TaskCreation(id: id);
        },
      ),

      GoRoute(
        path: '/ProductCreation',
        builder: (context, state) => ProductCreation(),
      ),
      GoRoute(
        path: '/StoreCreation',
        builder: (context, state) => const StoreCreation(),
      ),
      // Agrega más rutas según sea necesario
    ],
  );

  // Configuración del tema
  ThemeData themeDataInitialSmall() {
    return ThemeData(
      fontFamily: StyleGlobalApk.globalTextStyle.fontFamily,
      primaryColor: const Color.fromARGB(255, 67, 162, 240),
      colorScheme: ColorScheme.fromSwatch().copyWith(
        primary: Colors.blue,
        secondary: Colors.orange,
        surface: Colors.white,
      ),
      appBarTheme: AppBarTheme(
        toolbarHeight: 120,
        backgroundColor: Colors.blue,
        titleTextStyle: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 24.0,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      textTheme: TextTheme(
        bodyMedium: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 12.0,
          fontWeight: FontWeight.normal,
          color: Colors.black,
        ),
        titleLarge: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 46.0,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        titleMedium: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 16.0,
          fontWeight: FontWeight.w900,
          color: Colors.black,
        ),
        titleSmall: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 10.0,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        displayMedium: StyleGlobalApk.getStyleTitleApk().copyWith(
          color: StyleGlobalApk.getColorIndicador(),
          fontSize: 24,
          fontWeight: FontWeight.w800,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
          foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
          textStyle: WidgetStateProperty.all<TextStyle>(
            StyleGlobalApk.globalTextStyle.copyWith(
              fontSize: 12.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        hintStyle: StyleGlobalApk.globalTextStyle.copyWith(
          fontSize: 12.0,
          color: Colors.grey,
          fontWeight: FontWeight.normal,
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blue,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    String languageCode = 'es'; // Valor por defecto
    if (updateConfigurationCF.watch(context) == true) {
      languageCode = configurationCF.value!.language.toString();
      TranslationManager.loadDefaultTranslations(languageCode);
    } else {
      TranslationManager.loadDefaultTranslations('es');
    }

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: themeDataInitialSmall(),
      routerConfig: _appRouter,
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: TranslationManager.supportedLocales,
      locale: TranslationManager.getCurrentApi(languageCode),
    );
  }
}
