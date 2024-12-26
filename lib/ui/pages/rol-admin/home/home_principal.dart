import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/configuration/configuration_model.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_service.dart';
import 'package:huoon/domain/blocs/configuration_bloc/configuration_signal.dart';
import 'package:huoon/domain/blocs/login_bloc/login_service.dart';
import 'package:huoon/domain/blocs/task_cat_state_prior.dart/task_cat_state_prior_service.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
import 'package:huoon/ui/Components/showDialogComp.dart';
import 'package:huoon/ui/pages/pageMenu/filesPage.dart';
import 'package:huoon/ui/pages/pageMenu/financePage.dart';
import 'package:huoon/ui/pages/pageMenu/healthPage.dart';
import 'package:huoon/ui/pages/pageMenu/store/storePage.dart';
import 'package:huoon/ui/pages/pageMenu/wishesPage.dart';
import 'package:huoon/ui/util/util_class.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../pageMenu/task/tasksPage.dart';
//COLORES
// color gris de fondo ... Colors.white

class HomePrincipal extends StatefulWidget {
  final String name;
  final String email;
  final String avatarUrl;
  const HomePrincipal({super.key, required this.name, required this.email, required this.avatarUrl});

  @override
  State<HomePrincipal> createState() => _HomePrincipalState();
}

bool isDark = false;
String search = '';
final ThemeData themeData = ThemeData(useMaterial3: true, brightness: isDark ? Brightness.dark : Brightness.light);

class _HomePrincipalState extends State<HomePrincipal> with SingleTickerProviderStateMixin {
  //esto es para el mapa
  // Controlador de PageView
  final PageController _pageController = PageController();
  int _currentPage = 0;
  ScrollController _scrollController = ScrollController();
  late TabController _tabController;

  // Función para cambiar de página
  void _onButtonPressed(int pageIndex) {
    _pageController.jumpToPage(pageIndex);
  }

  void _onPageChanged(int index) {
    _fetchDataForPage(index);
    setState(() {
      _currentPage = index;
    });
    // Desplazar la Row para que el botón correspondiente esté visible
    double targetScrollOffset = (index * 75.0); // Ajusta este valor al tamaño de tus botones
    _scrollController.animateTo(
      targetScrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
    // Aquí puedes hacer una llamada a la API según la página
  }

  Future<void> _fetchDataForPage(int pageIndex) async {
    // Lógica para llamar a la API dependiendo de la página
    print('Fetching data for page $pageIndex');
    // Aquí iría tu lógica de llamada a la API
    showLoadingDialog(context, indicatorColor: Colors.white, message: 'Cargando...');
    await Future.delayed(const Duration(milliseconds: 1000));
    Navigator.of(context).pop();
  }

  final List<IconData> _tabIcons = [
    MdiIcons.creationOutline, // Deseos
    MdiIcons.finance, // Finanzas
    MdiIcons.hospitalBoxOutline, // Salud
    MdiIcons.calendarWeekendOutline, //tareas
    MdiIcons.storeOutline, //Productos
    MdiIcons.folderStarOutline, //Archivos
  ];

  @override
  void initState() {
    super.initState();
    // _getLocation();
    _tabController = TabController(length: 6, vsync: this, initialIndex: getIndexCurrentScreenUA());
    _tabController.addListener(() {
      setState(() {});
    });
    SchedulerBinding.instance.addPostFrameCallback((_) {
      //  cLogin.toggleTheme();
      // user_activity Actualizando estado
      // initialIndex: 3 = screen_home_task
      // onScreenChange('screen_Home_Task');
      if (configurationCF.value == null) {
        requestConfiguration();
      }
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('llegando a Pagina-Principal:${widget.name}');
    print('llegando a Pagina-Principal:${widget.avatarUrl}');
    print('llegando a Pagina-Principal:${widget.email}');
    double screenHeight = MediaQuery.of(context).size.height;
    print('alto de mi telefono por si me hiciera falta es :$screenHeight');

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
          child: Column(
            children: [
              SizedBox(
                height: 170,
                child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                  // Text(usernameCubit.state),
                  appBarWidget(
                      context, MdiIcons.bellOutline, MdiIcons.messageOutline, widget.avatarUrl, widget.name, 'huoon'),
                  Padding(
                    padding: const EdgeInsets.only(top: 6),
                    child: searchWidget(setState),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 18),
                    child: cardMenu(_tabController),
                  ),
                ]),
              ),
              Flexible(
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    WishesPage(),
                    FinancePage(),
                    HealthPage(),
                    TasksWidget(),
                    //ProductPage(),
                    StorePage(),
                    FilesPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Visibility(
        visible:
            _tabController.index != 4, //porque aqui quiero ocultar el del almacen,porque esta en la tabla de almacen
        child: StatefulBuilder(
          builder: (context, setState) {
            return InkWell(
              onTap: () {
                print('inde = ${_tabController.index}');
                if (_tabController.index == 0) {
                  //llamar a la vista chat                

                   GoRouter.of(context).push('/ChatPage');
                }
                
              else  if (_tabController.index == 1) {
                  //llamar a la vista chat                

                   GoRouter.of(context).push('/ChatPageFinancePage');
                }
                  
              else  if (_tabController.index == 2) {
                  //llamar a la vista chat                

                   GoRouter.of(context).push('/ChatHealthPage');
                }


              else  if (_tabController.index == 3) {
                  fetchCategoriesStatusPriority();

                  print('inde =.... ${_tabController.index}');
                  //context.goNamed('taskCreation', pathParameters: {'id': ''}); // Pasando un valor vacío
                 // context.goNamed('taskCreation', pathParameters: {'id': '0'});
                  GoRouter.of(context).push('/taskCreation/0'); // '123' es el valor del parámetro 'id'

                 // GoRouter.of(context).push('/DataAnalysisPage');
                } else if (_tabController.index == 4) {
                  //agregar productos
                  print('inde =.... ${_tabController.index}');
                  //llamo el evento para buscar la scategorias y los estados

                  GoRouter.of(context).go(
                    //mando a la vista de crear el producto
                    // '/ProductCreation',
                    '/StoreCreation',
                  );
                }
                //  dialogComponet(context, _tabTexts[_tabController.index]);
              },
              child: 
              
              
              CircleAvatar(
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
            );
          },
          
        ),
        
      ),
    );
  }
}

Future<dynamic> dialogComponet(BuildContext context, String name) {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ), //this right here
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 93, 137, 233),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8),
                  topRight: Radius.circular(8),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(left: 12),
                    child: Text(
                      name,
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.w700),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
            Container(
              height: 150,
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.only(top: 30, left: 16, right: 16, bottom: 10),
                      child: Text('Cargar formulario de: $name')),
                  //

                  OverflowBar(
                    alignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      ElevatedButton(
                          style: ButtonStyle(
                              padding: WidgetStateProperty.all<EdgeInsetsGeometry>(
                                const EdgeInsets.symmetric(vertical: 0, horizontal: 18.0),
                              ),
                              backgroundColor: WidgetStateProperty.all<Color>(Color(0xFF4470F3))),
                          onPressed: () async {
                            if (1 == 1) //codigo 200
                            {
                              //mando notificacion al barbero
                              //quiere decir que el qr esta bloquedo hasta que acepten o rechacen

                              print('solicitud enviada correctamente');
                            }
                            //manadar un mensaje si la solicitud se envio bien

                            Navigator.pop(context);
                            // Cerrar el primer modal
                          },
                          child: Row(
                            children: [
                              Icon(
                                MdiIcons.check,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 6,
                              ),
                              Text(
                                'Aceptar  ',
                                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w800),
                              ),
                            ],
                          )),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      );
    },
  );
}

Widget appBarWidget(context, IconData icon1, IconData icon2, String avatar, String name, String nameApp) {
  return Card(
    color: Colors.transparent,
    elevation: 0,
    child: Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        nameApp,
                        style: Theme.of(context).textTheme.displayMedium!.copyWith(
                          color: StyleGlobalApk.colorPrimary,
                            // Cambia alguna propiedad aqui
                            ),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  IconButton(onPressed: () {}, icon: Badge(isLabelVisible: true, child: Icon(icon1))),
                  // IconButton(onPressed: () {}, icon: Icon(icon2)),
                  IconButton(
                    onPressed: () {
                      // Mostrar el LanguageSelector en un diálogo
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
                    icon: Icon(MdiIcons.earth),
                    tooltip: 'Cambiar Idioma',
                  ),
                  IconButton(
                      onPressed: () {
                        logoutAndClearSignals();
                        GoRouter.of(context).go(
                          '/LoginFormPage',
                        );
                      },
                      icon: Icon(MdiIcons.logout)),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
  );
}

Widget searchWidget(setState) {
  return SearchAnchor(
    viewBackgroundColor: Colors.white,
    isFullScreen: false, //es si se quiere poner el buscar en la pantalla completa
    builder: (BuildContext context, SearchController controller) {
      return Container(
        padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 4), //este es para separa el icono-lupa
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30.0),
          boxShadow: [
            BoxShadow(
              color: StyleGlobalApk.colorPrimary.withOpacity(0.3),
              blurRadius: 8.0,
              spreadRadius: 2.0,
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           
            CircleAvatar(
          backgroundColor:  StyleGlobalApk.colorPrimary,
          radius: 15, // Define el tamaño del CircleAvatar
          child: ClipOval(
            child: Image.asset(
              'assets/images/icon-Huoon.jpg', // Ruta de tu imagen en los assets
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),
              ),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Visibility(
                    visible: search.isEmpty ? true : false,
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: '${TranslationManager.translate('searchTitle')}\n',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color.fromARGB(255, 32, 32, 32),
                                fontSize: 13.0,
                                height: 1),
                          ),
                          TextSpan(
                            text: TranslationManager.translate('searchDescription'),
                            style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Color.fromARGB(200, 37, 37, 37),
                              fontSize: 11.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(visible: search.isEmpty ? false : true, child: Text(search))
                ],
              ),
            ),
          ],
        ),
      );
    },
    suggestionsBuilder: (BuildContext context, SearchController controller) {
      final arrayD = ['Chat', 'Crear Lista de compras', 'Organizar Cumpleaños', 'Recordatorios', ''];
      return List<ListTile>.generate(arrayD.length, (int index) {
        final String item = arrayD[index].toString();
        return ListTile(
          title: Text(item),
          onTap: () {
            setState(() {
              controller.closeView(item);
              search = controller.text;
            });
          },
        );
      });
    },
  );
}

Widget cardMenu(_tabController) {
  //Nombres del titulo del menu
  String menuWishesTitle = TranslationManager.translate('menuWishes');
  String menuFinanceTitle = TranslationManager.translate('menuFinance');
  String menuHealthTitle = TranslationManager.translate('menuHealth');
  String menuTasksTitle = TranslationManager.translate('menuTasks');
  String menuProductsTitle = TranslationManager.translate('menuProducts');
  String menuArchivesTitle = TranslationManager.translate('menuArchives');
  //Nombres del titulo del menu
  return Container(
    color: Colors.transparent,
    //alignment: Alignment.center, // Alinea el TabBar en el centro horizontalmente
    child: TabBar(
      isScrollable: true, // Permite que el TabBar sea desplazable si hay muchas pestañas
      tabAlignment: TabAlignment.start,
      indicatorColor: StyleGlobalApk.getColorPrimary().withOpacity(0.8), // Cambia el color de la barra inferior
      controller: _tabController,
      // indicatorPadding: const EdgeInsets.only(bottom: 0), // Ajusta el indicador para que esté más cerca del icono
      labelPadding: EdgeInsets.symmetric(horizontal: 10.0), // Ajusta el padding horizontal
      indicatorWeight: 1,

      tabs: [
        Tab(
          child: cardMenuUp(MdiIcons.creationOutline, menuWishesTitle, _tabController.index == 0), //Deseos
        ),
        Tab(
          child: cardMenuUp(MdiIcons.finance, menuFinanceTitle, _tabController.index == 1), //Finanzas
        ),
        Tab(
          child: cardMenuUp(MdiIcons.hospitalBoxOutline, menuHealthTitle, _tabController.index == 2), //Salud
        ),
        Tab(
          child: cardMenuUp(MdiIcons.calendarWeekendOutline, menuTasksTitle, _tabController.index == 3), //Tareas
        ),
        Tab(
          child: cardMenuUp(MdiIcons.storeOutline, menuProductsTitle, _tabController.index == 4), //Productos
        ),
        Tab(
          child: cardMenuUp(MdiIcons.folderStarOutline, menuArchivesTitle, _tabController.index == 5), //Archivos
        ),
      ],
    ),
  );
}

Column cardMenuUp(IconData icon, String labelText, bool isSelected) {
  return Column(
    children: [
      Icon(
        icon,
        //size: isSelected ? 30 : 28, // Tamaño del icono cambia levemente si está seleccionado
        color: isSelected
            ? Colors.black // Color vibrante cuando está seleccionado
            : const Color.fromARGB(255, 122, 122, 122), // Color más apagado cuando no está seleccionado
        shadows: isSelected
            ? [
                Shadow(
                  offset: Offset(0, 2), // Posición de la sombra
                  blurRadius: 4.0, // Desenfoque de la sombra
                  color: Colors.black.withOpacity(0.2), // Sombra para mayor profundidad
                ),
              ]
            : null, // Sin sombra cuando no está seleccionado
      ),

      SizedBox(height: 6), // Aumenta la separación
      Text(
        labelText,
        style: isSelected
            ? TextStyle(
                height: 1,
                fontSize: 11,
                color: Colors.black, // Color vibrante cuando está seleccionado
                fontWeight: FontWeight.w800,
                shadows: [
                  Shadow(
                    offset: Offset(0, 1), // Posición de la sombra
                    blurRadius: 2.0, // Desenfoque de la sombra
                    color: Colors.black.withOpacity(0.2), // Sombra suave para dar profundidad
                  ),
                ],
              )
            : TextStyle(
                fontSize: 11,
                height: 1,
                color: Colors.grey.shade700, // Color más claro cuando no está seleccionado
                fontWeight: FontWeight.w400,
              ),
      ),
    ],
  );
}
