import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/data/models/homeHouseUsser/homeHouseUsser_model.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_service.dart';
import 'package:huoon/domain/blocs/homeHouse_signal/homeHouse_signal.dart';
import 'package:huoon/ui/components/ImageDetailScreen.dart';
import 'package:huoon/ui/components/button_custom.dart';
import 'package:huoon/ui/components/componentGlobal_widget.dart';
import 'package:huoon/ui/components/configOptionCard%20.dart';
import 'package:huoon/ui/myApp.dart';
import 'package:huoon/ui/pages/env.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:signals/signals_flutter.dart';

class SettingsPage extends StatefulWidget {
  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool notificationsEnabled = true;
  @override
  Widget build(BuildContext context) {
    bool isActive = true; // Simulación de estado activo
    String selectedLanguage = 'Español';
    String selectedHome = 'Casa Principal';
    
    bool darkModeEnabled = false;





void _showSelectionPanel(BuildContext context, List<Home>? homeHouseUsserHH) {
  int? selectedIndex = homeSelectHH.value;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Botón para agregar nuevo hogar
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Agregar nuevo hogar",
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 8),
                    IconButton(
                     onPressed: () async {
  final navigator = Navigator.of(context); // Guardamos el contexto antes de cerrar
  navigator.pop();
  await fetchCategoriesStatusHomeHouse();
  GoRouter.of(navigator.context).push('/HomeHouseCreation');
},

                      icon: Icon(Icons.add_circle, size: 30, color: StyleGlobalApk.colorPrimary),
                    ),
                  ],
                ),

                SizedBox(height: 16),

                // Contenedor con scroll para la lista
                SizedBox(
                  height: 300, // Altura máxima para evitar overflow
                  child: SingleChildScrollView(
                    child: Column(
                      children: List.generate(homeHouseUsserHH == null? 0: homeHouseUsserHH.length, (index) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = homeHouseUsserHH[index].id;
                            });
                          },
                          child: Card(
                            elevation: 3,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                              side: BorderSide(
                                color: selectedIndex == homeHouseUsserHH![index].id ? StyleGlobalApk.colorPrimary : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(8),
                              leading: CircleAvatar(
                                radius: 25,
                              
                               child:  
                                    GestureDetector(
                                        onDoubleTap: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  ImageDetailScreen(
                                                    title: '${homeHouseUsserHH[index].name}',
                                                      imageUrl:
                                                          '${Env.apiEndpoint}/images/${homeHouseUsserHH[index].image}'),
                                                          
                                            ),
                                          );
                                        },
                                        child: ClipOval(
                                          child: CachedNetworkImage(
                                            imageUrl:
                                                '${Env.apiEndpoint}/images/${homeHouseUsserHH![index].image}',
                                            placeholder: (context, url) =>
                                                Container(
                                              width: 30,
                                              height: 30,
                                              child: const Center(
                                                child: SizedBox(
                                                  width: 30,
                                                  height: 30,
                                                  child:
                                                      CircularProgressIndicator(
                                                    strokeWidth:
                                                        2, // Personaliza el ancho del indicador como desees
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                                Color>(
                                                            Color.fromARGB(110,
                                                                253, 176, 42)),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            errorWidget:
                                                (context, url, error) =>
                                                    Image.asset(
                                              'assets/people/default.jpg',
                                              cacheWidth: 30,
                                              cacheHeight: 30,
                                              fit: BoxFit.cover,
                                            ),
                                            fit: BoxFit.cover,
                                            width: 50,
                                            height: 50,
                                          ),
                                        ),
                                      ),
                                    
                              
                              
                              
                              
                                
                              ),
                              title: Text(
                                " ${homeHouseUsserHH[index].name}",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(" ${homeHouseUsserHH[index].address}"),
                                  Text(" ${homeHouseUsserHH[index].nameStatus}"),
                                ],
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                SizedBox(height: 10),

                // Botón "Aceptar"
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: () {
                      setHomeSelectHH( selectedIndex!);
                      final config = Configuration( home: selectedIndex);
                              updateConfiguration(config);
                      Navigator.pop(context);
                    },
                    child: Text("Aceptar", style: TextStyle(fontSize: 14)),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
}


    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CircleAvatar(
                      backgroundColor: const Color.fromARGB(100, 106, 105, 105),
                      radius: 30,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/icon-Huoon.jpg',
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 5,
                      right: 5,
                      child: Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: isActive ? Colors.green : Colors.white,
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 2),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'HUOON',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'Configuración',
                  style: TextStyle(
                    height: 1.2,
                    fontSize: 12,
                    color: Color.fromARGB(120, 0, 0, 0),
                  ),
                ),
              ],
            ),
         
              ],
            ),
           
//            CustomButton(
//  onPressed: () {
//    // Llama a la función pasada como parámetro y pasa los valores seleccionados
             
//  },
//   text: 'Guardar',
//   backgroundColor: StyleGlobalApk.colorPrimary,
//   textColor: Colors.white,
//   width: 100,
//   height: 30,
// ),
          ],
        ),
      ),
      body: 
        ListView(
        children: [
          ConfigOptionCard(
            icon: Icons.language, 
            title: 'Idioma', 
            description: getLanguageName(configurationCF.value!.language.toString()), 
            trailing: TextButton(
              onPressed: () {
                // Acción para cambiar el idioma
                                    showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          // title: Text('Seleccionar Idioma'),
                          content: LanguageSelectorNew(
                            onLocaleChange: (Locale locale) {
                              print('selección del idioma es:${locale.languageCode}');
                              final config = Configuration(language: locale.languageCode);
                              updateConfiguration(config);
                              Navigator.of(context).pop(); // Cierra el diálogo
                            },
                          ),
                        ),
                      );
              },
              child: const Text('Cambiar'),
            ),
          ),
          ConfigOptionCard(
            icon: Icons.notifications, 
            title: 'Notificaciones', 
            description: notificationsEnabled?'Activadas':'Desactivadas', 
            trailing: Switch(
  activeColor: StyleGlobalApk.colorPrimary, // Color cuando está activo
  inactiveTrackColor: Colors.grey, // Color cuando está inactivo
  value: notificationsEnabled,
  onChanged: (bool value) {
    setState(() {
      notificationsEnabled = value;
    });
  },
),
          ),
          ConfigOptionCard(
            icon: Icons.house, 
            title: 'Hogar Principal', 
            description: homeHouseUsserHH.value!
    .firstWhere(
      (element) => element.id == configurationCF.watch(context) !.home,
      orElse: () => Home(id: -1, name: 'No hay'), // Devuelve un objeto por defecto
    )
    .name ?? 'No hay',

            trailing:
             TextButton(
              onPressed: () async {
                // Acción para cambiar el idioma
                    await  fetchHomeHouseUsser();
                        _showSelectionPanel(context,homeHouseUsserHH.value);
                            
              },
              child: const Text('Seleccionar'),
            ),
            
            
            
          ),

//          SelectionWidget<Hometype>(
//   selectMultiple: false,  
//   items: taskTypeListHH.value ?? [],
//   titleWidget: 'Seleccionar Hogar Principal',
//   itemTitle: (frequency) => frequency.name ?? '', // Pasas la función que obtiene el título
//   itemId: (frequency) => homeTypeIdHH.value.toString(), // Pasas la función que obtiene el ID
//   onSelectionChanged: (selectedItems) {
   
//   },
// ),
          ConfigOptionCard(
            icon: Icons.lock, 
            title: 'Privacidad y Seguridad', 
            description: 'Configuración de privacidad', 
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
          ConfigOptionCard(
            icon: Icons.logout, 
            title: 'Cerrar sesión', 
            description: 'Cerrar sesión actual', 
            trailing: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      ),
      
    
   
    );
  }
}
