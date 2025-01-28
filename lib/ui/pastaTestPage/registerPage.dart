import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/ui/components/buttonCustomWidget.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSignUp = true; // Controla qué vista se muestra
  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fondo con degradado y curvas
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color.fromARGB(255, 218, 180, 9), Color.fromARGB(255, 66, 23, 8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomPaint(
            painter: BackgroundCurvePainter(),
            child: Container(),
          ),
          PageView(
            controller: _pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              _buildSignUpView(),
              _buildRegisterView(),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildSignUpView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Icon(
  Icons.account_circle,
  size: 80,
  color: Colors.white,
),
              const SizedBox(height: 10),
              // Título
              const Text(
                "Sign up",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              // Campos de texto
              AnimatedFields(isSignUp: isSignUp, fields: [
                _buildTextField(Icons.person, "User or Email"),
                const SizedBox(height: 20),
                
                _buildTextField(Icons.lock, "Password"),
              ]),
              const SizedBox(height: 30),
              // Botón de registro
              
              CustomButton(
 onPressed: () {
                 GoRouter.of(context).push('/HomePageBusines'); 
                },
  text: 'Login',
  backgroundColor: const Color(0xFFEF5350),
  textColor: Colors.white,
  width: 250,
  height: 50,
), 
const SizedBox(height: 20),
              CustomButton(
 onPressed: () {
                  setState(() {
                    isSignUp = false;
                    _pageController.animateToPage(1,
                        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
                  });
                },
  text: 'Registrarme  ->',
  backgroundColor: const Color(0xFFEF5350),
  textColor: Colors.white,
  width: 250,
  height: 50,
),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRegisterView() {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Logo
              Icon(Icons.person_add_alt,size: 80,color: Colors.white,),
              const SizedBox(height: 10),
              // Título
              const Text(
                "Complete your Registration",
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 40),
              // Campos de texto adicionales
              AnimatedFields(isSignUp: !isSignUp, fields: [
                _buildTextField(Icons.phone, "Name"),
                const SizedBox(height: 10),
                _buildTextField(Icons.calendar_today, "Email"),            
                const SizedBox(height: 10),
                _buildTextField(Icons.info_outline, "Password"),                          
                const SizedBox(height: 10),
                _buildTextField(Icons.info_outline, "Confirm Password"),
              ]),
              const SizedBox(height: 30),
              // Botón de regreso




              CustomButton(
 onPressed: () {
                 
                },
  text: 'Registrarme',
  backgroundColor: const Color(0xFFEF5350),
  textColor: Colors.white,
  width: 250,
  height: 50,
),
 const SizedBox(height: 20),
  CustomButton(
 onPressed: () {
                  setState(() {
                    isSignUp = true;
                    _pageController.animateToPage(0,
                        duration: const Duration(milliseconds: 800), curve: Curves.easeInOut);
                  });
                },
  text: '<-  Login',
  backgroundColor:  const Color(0xFFEF5350),
  textColor: Colors.white,
  width: 250,
  height: 50,
),
              




            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hintText) {
    return TextField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: const Color.fromARGB(255, 87, 78, 78)),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 87, 78, 78)),
        filled: true,
        fillColor: Colors.white.withOpacity(0.8),
        contentPadding: const EdgeInsets.symmetric(vertical: 15),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

class AnimatedFields extends StatelessWidget {
  final bool isSignUp;
  final List<Widget> fields;

  const AnimatedFields({required this.isSignUp, required this.fields});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: fields.asMap().entries.map((entry) {
        int index = entry.key;
        Widget field = entry.value;

        return AnimatedPositioned(
          duration: Duration(milliseconds: 300 * (index + 1)),
          curve: Curves.easeInOut,
          left: isSignUp ? 0 : MediaQuery.of(context).size.width,
          child: field,
        );
      }).toList(),
    );
  }
}

class BackgroundCurvePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..shader = const LinearGradient(
        colors: [Color.fromARGB(255, 231, 212, 124), Color.fromARGB(255, 179, 46, 5)],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height * 0.3);
    path.quadraticBezierTo(
        size.width * 0.5, size.height * 0.5, size.width, size.height * 0.3);
    path.lineTo(size.width, 0);
    path.lineTo(0, 0);
    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
