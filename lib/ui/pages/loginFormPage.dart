// ignore_for_file: file_names, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/services/authGoogle_service.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_service.dart';
import 'package:huoon/domain/blocs/login_bloc/login_service.dart';
import 'package:huoon/domain/blocs/login_bloc/login_signal.dart';
import 'package:huoon/domain/blocs/tasks/tasks_service.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:intl/intl.dart';
import 'package:signals/signals_flutter.dart';
import 'package:material_symbols_icons/material_symbols_icons.dart';




class LoginFormPage extends StatefulWidget {
  const LoginFormPage({super.key});

  @override
  State<LoginFormPage> createState() => _LoginFormPageState();
}

class _LoginFormPageState extends State<LoginFormPage> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // user_activity Actualizando estado
      onScreenChange('screen_Login');
    });

    super.initState();
  }

  //FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  loginFuntionDeprived() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Esta función aún está en desarrollo y no está disponible en este momento')),
    );
  }

  loginFuntion() async {
    if (isLoadingLG.watch(context) == true) {
      // Muestra un mensaje de carga
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Iniciando sesión...')),
      );
    }   if (isLoggedInLG.watch(context) == false) {
      //esta vacio
      // Muestra un mensaje de carga
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(loginMessageLG.value)), //13295---36,000.00
      );
    }  if (isLoggedInLG.watch(context) == true) {
      //está logueado
      // Navega a la página de inicio o realiza alguna acción
     
      ScaffoldMessenger.of(context)
  ..hideCurrentSnackBar()
  ..showSnackBar( SnackBar(content: Text(loginMessageLG.value)));


      onScreenChange('screen_Home_Tasks');
        Future.delayed(const Duration(milliseconds: 500), () {
         GoRouter.of(context).go(
        '/HomePrincipal',
        extra: {
          'name': currentUserLG.value!.userName,
          'email': currentUserLG.value!.email,
          'avatarUrl': '',
        },
      );
      });
    
      // String date = '2024-09-09'; // La fecha puede ser dinámica
      DateTime selectedDay = DateTime.now();
      //String date = '2024-09-09'; // La fecha puede ser dinámica
      String date = DateFormat('yyyy-MM-dd').format(selectedDay);
   
//      if(getHomeSelectHH() != null)
//     {
//       await fetchTasks(date);
//     }
// else{
//   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
//     content: Text('No tiene hogar asignado'),
//     duration: const Duration(seconds: 2),
//   ));
// }
      //llamar la stareas del día
      // context.read<TasksBloc>().add(TasksRequested(date)); // Pasar la fecha al evento

      //Navigator.of(context).pushReplacementNamed('/home');
    } else if (isLoginErrorLG.watch(context) == true) {
      // Muestra un mensaje de error
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: ${loginMessageLG.value}')),
      );
    }
  }

  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  final TextEditingController _passController = TextEditingController();
  final TextEditingController _usserController = TextEditingController();

  Widget build(BuildContext context) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
      loginFuntion();
    });
    return Scaffold(
      backgroundColor: Colors.white, // Fondo blanco
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logotipo en cyan
               Icon(
                Icons.account_circle,
                size: 100,
                color: StyleGlobalApk.colorPrimary,
              ),
              const SizedBox(height: 40),

              // Campo de Email
              TextField(
                controller: _usserController,
                decoration: InputDecoration(
                  hintText: 'Correo electrónico',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:  Icon(Icons.email, color: StyleGlobalApk.colorPrimary),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 20),

              // Campo de Contraseña
              TextField(
                controller: _passController,
                 obscureText: _isPasswordVisible ? false : true, // Oculta el texto de la contraseña
                decoration: InputDecoration(
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                  prefixIcon:  Icon(Icons.lock, color: StyleGlobalApk.colorPrimary),
                  suffixIcon: IconButton(
                                icon: Icon(
                                  _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                                  color: StyleGlobalApk.getColorPrimary(),
                                ),
                                onPressed: _togglePasswordVisibility,
                              ),
                ),
              ),
              const SizedBox(height: 30),

              // Botón de Login
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () async {
                                      if (_usserController.text.isEmpty || _passController.text.isEmpty) {
                                        _passController.clear();
                                        _usserController.clear();
                                        print('');
                                        ScaffoldMessenger.of(context).showSnackBar(
                                          const SnackBar(
                                              content: Text('Campos vacio,ingrese Usuario y contraseña por favor.')),
                                        );
                                      } else {
                                        login(_usserController.text, _passController.text);
                                      }
                                    },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: StyleGlobalApk.colorPrimary,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                  ),
                  child: const Text(
                    'Iniciar sesión',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Separador visual
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text('O ingresa con', style: TextStyle(color: Colors.grey)),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),

              const SizedBox(height: 20),

              // Botones de inicio de sesión con Google y Facebook
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Botón Google con icono
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción de inicio de sesión con Google
                       loginWithGoogle(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: const BorderSide(color: Colors.grey),
                      ),
                    ),

                    icon:    const Icon(
                      Symbols.g_mobiledata_sharp, // Ícono de verificación
                      color: Colors.green,
                      size: 50,
                    ),

                    label:  Text(TranslationManager.translate('googleButton')),
                  ),

                  // Botón Facebook con icono
                  ElevatedButton.icon(
                    onPressed: () {
                      // Acción de inicio de sesión con Facebook
                      loginFuntionDeprived();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.black,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),

                    icon: const Icon(Icons.facebook, size: 50),
                    label:  Text(TranslationManager.translate('facebookButton')),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              // Enlace de registro
              TextButton(
                onPressed: () {
                  // Acción de registro
                   GoRouter.of(context).go(
        '/RegisterFormPage',       
      );
                  
                 // loginFuntionDeprived();
                },
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '¿No tienes cuenta?',
                      style: TextStyle(color: Colors.grey),
                    ),
                     Text(
                      ' Regístrate',
                      style: TextStyle(color: Colors.blue),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}