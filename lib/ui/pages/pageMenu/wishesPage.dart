import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';

class WishesPage extends StatefulWidget {
  @override
  _WishesPageState createState() => _WishesPageState();
}

class _WishesPageState extends State<WishesPage> {
  final List<Map<String, dynamic>> _wishes = [
    {'title': 'Viajar a Japón', 'description': 'Explorar Tokyo y Kyoto.', 'completed': false},
    {'title': 'Aprender un nuevo idioma', 'description': 'Iniciar con francés.', 'completed': false},
    {'title': 'Correr una maratón', 'description': 'Entrenar para un 5K.', 'completed': true},
    {'title': 'Leer 20 libros este año', 'description': 'Ampliar conocimientos y relajarse.', 'completed': false},
    {'title': 'Hacer un curso de cocina', 'description': 'Especializarse en platos italianos.', 'completed': false},
    {'title': 'Ahorrar para una casa', 'description': 'Guardar el 10% del ingreso mensual.', 'completed': true},
    {'title': 'Aprender a tocar guitarra', 'description': 'Practicar 30 minutos diarios.', 'completed': false},
    {'title': 'Participar en voluntariado', 'description': 'Ayudar en un refugio animal.', 'completed': true},
    {'title': 'Tener un jardín en casa', 'description': 'Cultivar flores y hierbas.', 'completed': false},
    {'title': 'Subir a una montaña', 'description': 'Hacer senderismo en un parque nacional.', 'completed': false},
    {'title': 'Pintar un cuadro', 'description': 'Explorar la creatividad artística.', 'completed': false},
    {'title': 'Organizar las fotos familiares', 'description': 'Crear un álbum de recuerdos.', 'completed': true},
  ];

  void _addWish(String title, String description) {
    setState(() {
      _wishes.insert(0, {'title': title, 'description': description, 'completed': false});
    });
  }

  void _removeWish(int index) {
    setState(() {
      _wishes.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 50,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Mis Deseos', style: TextStyle(fontSize: 18, color: Colors.black)),
            Text('Organiza y cumple tus metas', style: TextStyle(fontSize: 10, color: Color.fromARGB(150, 0, 0, 0))),
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15.0),
            child: Stack(
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.favorite_border, color: Colors.black),
                ),
                if (_wishes.any((wish) => !wish['completed']))
                  Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 8,
                      backgroundColor: StyleGlobalApk.getColorRedOpaque(),
                      child: Text(
                        '${_wishes.where((wish) => !wish['completed']).length}',
                        style: const TextStyle(fontSize: 10, color: Colors.white),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Divider(height: 1.0, thickness: 2.0, color: Color.fromARGB(50, 158, 158, 158)),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: _wishes.length,
          itemBuilder: (context, index) {
            final wish = _wishes[index];
            return FadeIn(
              child: Card(
                margin: const EdgeInsets.symmetric(vertical: 8.0),
                child: ListTile(
                  leading: Icon(
                    wish['completed'] ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: wish['completed'] ? Colors.green : Colors.grey,
                  ),
                  title: Text(wish['title']),
                  subtitle: Text(wish['description']),
                  trailing: IconButton(
                    icon: Icon(Icons.delete, color: StyleGlobalApk.getColorRedOpaque()),
                    onPressed: () => _removeWish(index),
                  ),
                  onTap: () {
                    setState(() {
                      wish['completed'] = !wish['completed'];
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     showDialog(
      //       context: context,
      //       builder: (context) {
      //         String title = '';
      //         String description = '';
      //         return AlertDialog(
      //           title: const Text('Agregar Deseo'),
      //           content: Column(
      //             mainAxisSize: MainAxisSize.min,
      //             children: [
      //               TextField(
      //                 onChanged: (value) => title = value,
      //                 decoration: const InputDecoration(labelText: 'Título'),
      //               ),
      //               TextField(
      //                 onChanged: (value) => description = value,
      //                 decoration: const InputDecoration(labelText: 'Descripción'),
      //               ),
      //             ],
      //           ),
      //           actions: [
      //             TextButton(
      //               onPressed: () => Navigator.of(context).pop(),
      //               child: const Text('Cancelar'),
      //             ),
      //             ElevatedButton(
      //               onPressed: () {
      //                 if (title.isNotEmpty && description.isNotEmpty) {
      //                   _addWish(title, description);
      //                   Navigator.of(context).pop();
      //                 }
      //               },
      //               child: const Text('Agregar'),
      //             ),
      //           ],
      //         );
      //       },
      //     );
      //   },
      //   child: const Icon(Icons.add),
      // ),
    );
  }
}
