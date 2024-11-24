import 'package:flutter/material.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class StatusPage extends StatefulWidget {
  @override
  _StatusPageState createState() => _StatusPageState();
  final PageController pageController;

  StatusPage({required this.pageController});
}

class _StatusPageState extends State<StatusPage> {
  int selectedState = 0; // Para seleccionar el nivel
  Color colorBotoom = const Color.fromARGB(255, 61, 189, 93);
  Color colorBotoomSel = const Color.fromARGB(255, 199, 64, 59);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Estado'),
      ),
      floatingActionButton: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60.0), // Ajusta el valor a tu necesidad
          child: FloatingActionButton(
            onPressed: () {},
            child: Icon(MdiIcons.lightbulbQuestionOutline), // Aquí defines el ícono
          ),
        ),
      ),
      body: // Segunda Página
          Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Text('Estaba el codigo de abajo'),

              /*  BlocBuilder<CategoriesPrioritiesBloc, CategoriesPrioritiesState>(
                builder: (context, state) {
                  if (state is CategoriesLoading) {
                    return Center(child: CircularProgressIndicator());
                  } else if (state is CategoriesStatusSuccess) {
                    return ListView.builder(
                      itemCount: state.status.length,
                      itemBuilder: (context, index) {
                        final status = state.status[index]; // Cada objeto `Status`.
                        return GestureDetector(
                          onTap: () {
                            // Disparamos el evento para actualizar el estado seleccionado.

                            selectedState = status.id;

                            context.read<CategoriesPrioritiesBloc>().add(StatusSelectedEvent(status.id));
                          },
                          child: Container(
                            height: 80,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(vertical: 8), // Agrega un margen entre los contenedores.
                            decoration: BoxDecoration(
                              color: Colors.white, // Color de fondo del contenedor.
                              borderRadius: BorderRadius.circular(10), // Esquinas redondeadas.
                              border: Border.all(
                                color: state.selectedStatusId == status.id
                                    ? colorBotoomSel.withOpacity(0.8)
                                    : colorBotoom.withOpacity(0.4), // Color del borde según selección.
                                width: 2.0, // Grosor del borde.
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: state.selectedStatusId == status.id
                                      ? colorBotoomSel.withOpacity(0.4)
                                      : colorBotoom.withOpacity(0.4), // Sombra según selección.
                                  spreadRadius: 0, // Asegura que la sombra esté en el borde.
                                  blurRadius: 10, // Difumina la sombra.
                                  offset: Offset(0, 0), // Posiciona la sombra en las 4 partes.
                                ),
                              ],
                            ),
                            child: Center(
                              child: Text(
                                status.title, // Mostrar el `title` de cada `status`.
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: state.selectedStatusId == status.id
                                      ? Colors.red
                                      : Colors.black, // Color de texto según selección.
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is CategoriesFailure) {
                    return Center(child: Text('Error: ${state.error}'));
                  }
                  return Container(); // Estado por defecto.
                },
              ),*/
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    widget.pageController.previousPage(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  },
                  child: Text("Regresar"),
                ),
                ElevatedButton(
                  onPressed: () {
                    _onSubmit();
                  },
                  child: Text("Siguiente"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onSubmit() {
    // Cierra el teclado si está abierto

    FocusScope.of(context).unfocus();
    // Enviar el evento al BLoC
    print('object-test-selectedState:$selectedState');

    //todo ahora esta fijo
    final productElement = ProductElement(statusId: selectedState
        // image: 'products/1.jpg',
        );
// Dispara el evento para insertar el producto

    // Navegar a la siguiente página
    widget.pageController.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }
}
