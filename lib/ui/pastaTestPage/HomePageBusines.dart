import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/ui/Components/button_custom.dart';

class HomePageBusines extends StatefulWidget {
  @override
  State<HomePageBusines> createState() => _HomePageBusinesState();
}

class _HomePageBusinesState extends State<HomePageBusines> {
    bool business = true; // Controla si mostrar el diálogo
  TextEditingController nameController = TextEditingController();
  TextEditingController cpfController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  @override 
  Widget build(BuildContext context) {
     // Mostrar el cuadro de diálogo solo si business es verdadero
    if (business) {
      Future.delayed(Duration.zero, () {
        showDialog(
          context: context,
          barrierDismissible: false, // Impide cerrar el diálogo tocando fuera
          builder: (context) => AlertDialog(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
    Row(
      children: [
        Icon(Icons.check_circle, color: Colors.green, size: 20),
        SizedBox(width: 8),
    Text(
      '¡Casi Listo!',
      style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
    ),
      ],
    ),
    
    InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      
      child: Text('x',style: TextStyle(fontSize: 18,color: const Color.fromARGB(75, 0, 0, 0)),)),
  ],
),

            content:   Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField(controller: nameController, label: 'User*'),
            SizedBox(height: 16),
            CustomTextField(controller: cpfController, label: 'Cpf*', keyboardType: TextInputType.number),
            SizedBox(height: 16),
            CustomTextField(controller: addressController, label: 'Address'),
            SizedBox(height: 16),
            CustomTextField(controller: phoneController, label: 'Phone'),
          ],
        ),
            actions: [
              // Botón de cancelar
                  CustomButton(
 onPressed: () {
                 
                },
  text: 'Completar Registro',
  backgroundColor: const Color(0xFFEF5350),
  textColor: Colors.white,
  width: 250,
  height: 50,
), 
              // Botón de aceptar
             
            ],
          ),
        );
      });
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 115, 113, 221),
        elevation: 0,
        title: Row(
          children: [
            Icon(Icons.store, color: Colors.white),
            SizedBox(width: 8),
            Text(
              'Panes sem Trigo',
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      drawer: _buildDrawerMenu(context),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Pesquise aqui...",
                    prefixIcon: Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(vertical: 14),
                  ),
                ),
              ),
            ),

            // Categorias com scroll horizontal
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                "Categorias",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87),
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buildCategoryItem(Icons.list, "Pedidos"),
                  InkWell(
                    onTap: () {
                      // Verifica si el usuario está autenticado antes de navegar
                      if (isAuthenticated(context)) {
                        GoRouter.of(context).push('/FuncionariosPage');
                      } else {
                        showErrorMessage(context);
                      }
                    },
                    child: _buildCategoryItem(Icons.group, "Funcionários")),
                  InkWell(
                    onTap: () {
                      // Verifica si el usuario está autenticado antes de navegar
                      if (isAuthenticated(context)) {
                        GoRouter.of(context).push('/EstoquePage');
                      } else {
                        showErrorMessage(context);
                      }
                    },
                    child: _buildCategoryItem(Icons.inventory, "Estoque")),
                  InkWell(
                    onTap: () {
                      // Verifica si el usuario está autenticado antes de navegar
                      if (isAuthenticated(context)) {
                        GoRouter.of(context).push('/ReceitasPage');
                      } else {
                        showErrorMessage(context);
                      }
                    },
                    child: _buildCategoryItem(Icons.book, "Receitas")),
                  InkWell(
                     onTap: () {
                      // Verifica si el usuario está autenticado antes de navegar
                      if (isAuthenticated(context)) {
                        GoRouter.of(context).push('/GastosPage');
                      } else {
                        showErrorMessage(context);
                      }
                    },
                    child: _buildCategoryItem(Icons.money_off, "Gastos")),
                  _buildCategoryItem(Icons.attach_money, "Ingressos"),
                ],
              ),
            ),

            SizedBox(height: 16),

            // Promoções Especiais
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Promoções Especiais",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Ver Tudo"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                    image: AssetImage('assets/images/test/special_offer.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: 10,
                      left: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "Ofertas Especiais",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      right: 10,
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: Color.fromARGB(255, 115, 113, 221),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          "40% OFF",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 16),

            // Espaços Populares (ou Produtos Populares)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Produtos Populares",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text("Ver Tudo"),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
                  _buildPopularSpaceItem(
                      'assets/images/test/pizza-cubana.jpeg', "Pizza Margherita"),
                  _buildPopularSpaceItem(
                      'assets/images/test/pan-integral.jpeg', "Pão Integral"),
                  _buildPopularSpaceItem(
                      'assets/images/test/bolo-chocolate.jpeg', "Bolo de Chocolate"),
                  _buildPopularSpaceItem(
                      'assets/images/test/pan-queijo.jpeg', "Pão de Queijo"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Verifica si el usuario está autenticado
  bool isAuthenticated(BuildContext context) {
    // Aquí va la lógica para verificar si el usuario está autenticado.
    // Esta puede ser una llamada a un servicio de autenticación o un estado global.
    // Por ejemplo:
    // return Provider.of<AuthProvider>(context, listen: false).isAuthenticated;
    return true; // Simulación de usuario autenticado.
  }

  // Muestra un mensaje de error si el usuario no está autenticado
  void showErrorMessage(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Você precisa estar autenticado para acessar esta página!")),
    );
  }

  Widget _buildCategoryItem(IconData icon, String title) {
    return Container(
      width: 90,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: Color.fromARGB(255, 115, 113, 221).withOpacity(0.2),
            radius: 30,
            child: Icon(icon, size: 30, color: Color.fromARGB(255, 115, 113, 221)),
          ),
          SizedBox(height: 8),
          Text(title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12, color: Colors.black87)),
        ],
      ),
    );
  }

  Widget _buildPopularSpaceItem(String imagePath, String title) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(16),
          child: Image.asset(imagePath, height: 100, width: double.infinity, fit: BoxFit.cover),
        ),
        SizedBox(height: 8),
        Text(title,
            style: TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87)),
      ],
    );
  }

  Widget _buildDrawerMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 115, 113, 221)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.store, color: Colors.white, size: 48),
                SizedBox(height: 8),
                Text(
                  "Panes sem Trigo",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                Text(
                  "Administração de Negócios",
                  style: TextStyle(color: Colors.white70, fontSize: 14),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Configurações"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.analytics),
            title: Text("Relatórios"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.local_offer),
            title: Text("Promoções"),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(Icons.help),
            title: Text("Ajuda"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}


class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final TextInputType keyboardType;

  CustomTextField({
    required this.controller,
    required this.label,
    this.keyboardType = TextInputType.text,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late FocusNode _focusNode;
  Color _borderColor = Colors.grey;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode();

    _focusNode.addListener(() {
      setState(() {
        _borderColor = _focusNode.hasFocus ? const Color.fromARGB(255, 29, 75, 112) : Colors.grey;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      focusNode: _focusNode,
      keyboardType: widget.keyboardType,
      decoration: InputDecoration(
        labelText: widget.label,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: _borderColor, width: 2),
        ),
      ),
    );
  }
}
