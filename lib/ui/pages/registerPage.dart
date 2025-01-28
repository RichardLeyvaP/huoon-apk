// ignore_for_file: file_names, depend_on_referenced_packages
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/services/authGoogle_service.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_symbols_icons/symbols.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({super.key});

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _register() {
    if (_nameController.text.isEmpty ||
        _emailController.text.isEmpty ||
        _usernameController.text.isEmpty ||
        _passwordController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Por favor, complete todos los campos.')),
      );
    } else {
      // Lógica para crear la cuenta
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Cuenta creada exitosamente.')),
      );

      // Navegar a la página principal u otra acción
      Future.delayed(const Duration(milliseconds: 500), () {
        GoRouter.of(context).go('/HomePrincipal');
      });
    }
  }

   //FirebaseAnalytics analytics = FirebaseAnalytics.instance;
  loginFuntionDeprived() {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Esta función aún está en desarrollo y no está disponible en este momento')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logotipo en cyan
                // Logotipo en cyan
               Column(
                 children: [
                   CircleAvatar(                    
                    radius: 40,
                backgroundColor: StyleGlobalApk.getColorPrimary(),
                child: 
                Image.asset(
              'assets/images/icon-Huoon.jpg', // Ruta de tu imagen en los assets
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
                //****OJO ESTE ERA EL QUE ESTABA*** */
                // Icon(
                //   _tabIcons[_tabController.index], // Icono que corresponde al Tab seleccionado
                // ),
              ),
                                 Text('Registrarse',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),)
                 ],
               ),
              const SizedBox(height: 40),
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
 // Separador visual
              Row(
                children: [
                  Expanded(child: Divider(color: Colors.grey)),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text(' Ó ', style: TextStyle()),
                  ),
                  Expanded(child: Divider(color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 20),
                // Campo de Nombre y Apellidos
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    hintText: 'Nombre y Apellidos',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.person, color: StyleGlobalApk.colorPrimary),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo de Correo Electrónico
                TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    hintText: 'Correo electrónico',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.email, color: StyleGlobalApk.colorPrimary),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 20),

                // Campo de Usuario
                TextField(
                  controller: _usernameController,
                  decoration: InputDecoration(
                    hintText: 'Usuario',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.account_circle, color: StyleGlobalApk.colorPrimary),
                  ),
                ),
                const SizedBox(height: 20),

                // Campo de Contraseña
                TextField(
                  controller: _passwordController,
                  obscureText: !_isPasswordVisible,
                  decoration: InputDecoration(
                    hintText: 'Contraseña',
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(Icons.lock, color: StyleGlobalApk.colorPrimary),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                        color: StyleGlobalApk.colorPrimary,
                      ),
                      onPressed: _togglePasswordVisibility,
                    ),
                  ),
                ),
                const SizedBox(height: 30),

                // Texto de términos y condiciones
                Text(
                  'Ó Al crear una cuenta, acepta los términos de uso y nuestra política de privacidad.',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey[600], fontSize: 14),
                ),
                const SizedBox(height: 30),

                // Botón de Crear Cuenta
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _register,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleGlobalApk.colorPrimary,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: const Text(
                      'Crear Cuenta',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                      'Ya tienes una cuenta?',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey[600], fontSize: 14),
                                      ),
                                      InkWell(
                                        onTap: () {
                                          GoRouter.of(context).go(
        '/LoginFormPage',       
      );
                                        },
                                        child: Text(
                                                              ' Entrar',
                                                              textAlign: TextAlign.center,
                                                              style: TextStyle(color: Colors.blue, fontSize: 14),
                                        ),
                                      ),
                    ],
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

 
