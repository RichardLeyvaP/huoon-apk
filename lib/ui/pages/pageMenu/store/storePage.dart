import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_service.dart';
import 'package:huoon/domain/blocs/products_bloc/products_signal.dart';
import 'package:huoon/domain/blocs/store_bloc/store_service.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';
import 'package:huoon/domain/blocs/user_activity_bloc/user_activity_service.dart';
import 'package:huoon/ui/util/utils_class_apk.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:signals/signals_flutter.dart';

class StorePage extends StatefulWidget {
  const StorePage({super.key});

  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  bool _showProductDetail = false;
  StoreElement? _selectedStore;

  @override
  void initState() {
    super.initState();
    //context.read<ProductsBloc>().add(const ProductsRequested()); //cargo los productos
    // context.read<StoreBloc>().add(const StoreRequested()); //cargo los almacenes

    requestStore();
    WidgetsBinding.instance.addPostFrameCallback((_) async {});
  }

  // Función para cambiar a la vista de detalles del producto
  void _showProductDetails(StoreElement product) {
    setState(() {
      _selectedStore = product;
      _showProductDetail = true;
    });
  }

  // Función para regresar a la lista de productos
  void _showProductList() {
    setState(() {
      _showProductDetail = false;
      _selectedStore = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_selectedStore == null) {
      //estoy en almacenes
      onScreenChange('screen_Home_Store');
    } else {
      //estoy en productos
      onScreenChange('screen_Home_Store');
    }
    print('Entrando en página de Almacenes');
    return Scaffold(
      floatingActionButton: StatefulBuilder(
        builder: (context, setState) {
          return _selectedStore == null
              ? InkWell(
                  onTap: () {
                    GoRouter.of(context).go(
                      //mando a la vista de crear un nuevo almacen
                      '/StoreCreation',
                    );
                  },
                  child: CircleAvatar(
                    child: Icon(
                      MdiIcons.storeOutline, // Icono que corresponde a insertar almacen
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    addProduct();
                  },
                  child: CircleAvatar(
                    child: Icon(
                      MdiIcons.tagOutline, // Icono que corresponde a insertar producto
                    ),
                  ),
                );
        },
      ),
      body: Stack(
        children: [
          _showProductDetail && _selectedStore != null
              ? _buildProductListView(_selectedStore!) //aqui carga los productos

              : _buildStoreListView(), //aqui carga los almacenes
          // El contenido principal de tu pantalla
          Positioned(
            bottom: 20,
            left: 5,
            child: StatefulBuilder(
              builder: (context, setState) {
                return AnimatedOpacity(
                  opacity: _selectedStore != null ? 1.0 : 0.0, // Controla la opacidad
                  duration: Duration(milliseconds: 1500), // Duración de la animación
                  curve: Curves.easeInOut, // Curva de la animación
                  child: _selectedStore != null // Si no hay almacén seleccionado, no muestra nada
                      ? InkWell(
                          onTap: () async {
                            // Acción al hacer clic
                            _showProductList();
                          },
                          child: CircleAvatar(
                            child: Icon(
                              MdiIcons.arrowLeft, // Icono de flecha hacia la izquierda
                            ),
                          ),
                        )
                      : SizedBox.shrink(), // Si no está visible, ocupa 0 espacio
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildProductListView(StoreElement selectedStore) {
    final productElement = ProductElement(warehouseId: selectedStore.warehouse_id);
    updateProductData(productElement);
    print('_buildProductListView-aqui seleccionando el almacen:${selectedStore.title}');
    return Column(
      children: [
        Flexible(
            child: Text(
          selectedStore.title.toString(),
          style: TextStyle(fontWeight: FontWeight.w900),
        )),
        Expanded(
          flex: 4,
          child: Builder(
            builder: (context) {
              if (isLoadingSignalPR.watch(context) == true) {
                return Center(
                  child: CircularProgressIndicator(
                    color: StyleGlobalApk.getColorPrimary(),
                  ),
                );
              } else if (productErrorSignal.watch(context) != null) {
                return Center(child: Text('Error: ${productErrorSignal.value}'));
              } else if (productEmpySignal.watch(context) != null) {
                return Column(
                  children: [
                    SizedBox(height: 180),
                    Center(child: Text('${productEmpySignal.value}')),
                  ],
                );
              } else if (productSignal.watch(context) != null) {
                List<ProductElement> products = productSignal.value!.products;

                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Column(
                        children: products.map((product) {
                          return buildProductContainer(product.id!, product.productName.toString(),
                              product.image.toString(), product.totalPrice.toString(), product.quantity.toString());
                        }).toList(),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: const Text('No hay estados de productos'));
              }
            },
          ),
        ),
      ],
    );
  }

  Widget _buildStoreListView() {
    return Builder(
      builder: (context) {
        if (isStoreLoadingST.watch(context) == true) {
          return Center(
            child: CircularProgressIndicator(
              color: StyleGlobalApk.getColorPrimary(),
            ),
          );
        } else if (storeErrorST.watch(context) != null) {
          return Center(
            child: Text('Error: ${storeErrorST.value}'),
          );
        } else if (storeEmpyST.watch(context) != null) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 180),
              Center(child: Text('${storeEmpyST.value}')),
            ],
          );
        } else if (storeDataST.watch(context) != null) {
          List<StoreElement> stores = storeDataST.value!.store;

          return SingleChildScrollView(
            child: Column(
              children: stores.map((store) {
                return GestureDetector(
                  onTap: () async {
                    await loadProduct(1, store.warehouse_id!);
                    _showProductDetails(store);
                  },
                  child: buildStoreContainer(store),
                );
              }).toList(),
            ),
          );
        } else {
          return Center(
            child: const Text('No hay almacenes'),
          );
        }
      },
    );
  }

  Future<void> addProduct() async {
    await loadCategories();
    GoRouter.of(context).go(
      //mando a la vista de crear el producto
      '/ProductCreation',
    );
  }
}

// Widget buildProductContainer(String name, String imageUrl, String price, String quantity) {
//   return Card(
//     margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.circular(15),
//     ),
//     elevation: 5, // Sombra de la tarjeta para hacerla más llamativa
//     child: Padding(
//       padding: const EdgeInsets.all(6.0),
//       child: Row(
//         children: [
//           // Imagen del producto en un avatar circular
//           CircleAvatar(
//             backgroundImage: imageUrl.isNotEmpty
//                 ? NetworkImage(imageUrl)
//                 : AssetImage('assets/default_product_image.png') as ImageProvider,
//             radius: 25,
//           ),
//           const SizedBox(width: 10),
//           // Información del producto
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Nombre y precio del producto
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       name,
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.blueGrey[800],
//                       ),
//                     ),
//                     Text(
//                       '\$$price',
//                       style: TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.bold,
//                         color: Colors.green,
//                       ),
//                     ),
//                   ],
//                 ),
//                 // Cantidad del producto
//                 Text(
//                   'Cantidad: $quantity',
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: Colors.grey[600],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     ),
//   );
// }

Widget buildProductContainer(int id, String name, String imageUrl, String price, String quantity) {
  bool isOptionsVisible = false; // Controla la visibilidad de las opciones

  return StatefulBuilder(
    builder: (context, setState) {
      return GestureDetector(
        onLongPress: () {
          setState(() {
            isOptionsVisible = true; // Muestra las opciones
          });
        },
        child: Stack(
          children: [
            // Card principal
            Opacity(
              opacity: isOptionsVisible ? 0.3 : 1.0, // Cambia la opacidad cuando se muestran las opciones
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    children: [
                      // Imagen del producto
                      CircleAvatar(
                        backgroundImage: imageUrl.isNotEmpty
                            ? NetworkImage(imageUrl)
                            : AssetImage('assets/default_product_image.png') as ImageProvider,
                        radius: 25,
                      ),
                      const SizedBox(width: 10),
                      // Información del producto
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  name,
                                  style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blueGrey[800],
                                  ),
                                ),
                                Text(
                                  '\$$price',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Cantidad: $quantity',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Opciones superpuestas
            if (isOptionsVisible)
              Positioned.fill(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            _buildOptionButton(
                              icon: Icons.edit,
                              label: "Editar",
                              color: Colors.blue,
                              onPressed: () {
                                print("Editar producto: $name");
                                setState(() {
                                  isOptionsVisible = false;
                                });
                              },
                            ),
                            _buildOptionButton(
                              icon: Icons.delete,
                              label: "Eliminar",
                              color: Colors.red,
                              onPressed: () {
                                deleteProduct(id);
                                print("Eliminar producto: $name");
                                setState(() {
                                  isOptionsVisible = false;
                                });
                              },
                            ),
                            _buildOptionButton(
                              icon: Icons.close,
                              label: "Cerrar",
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  isOptionsVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}

Widget buildStoreContainer(StoreElement store) {
  bool isOptionsVisible = false; // Controla la visibilidad de las opciones

  return StatefulBuilder(
    builder: (context, setState) {
      return GestureDetector(
        onLongPress: () {
          //si es 0 es creador - si es 1 Colaboradores si es 2 Visualizadores

          setState(() {
            isOptionsVisible = true;
          });
        },
        child: Stack(
          children: [
            // Card principal
            Opacity(
              opacity: isOptionsVisible ? 0.2 : 1.0, // Opacidad para el modo opciones
              child: Card(
                margin: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              store.title.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.blueGrey[800],
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Icon(
                            Icons.store_mall_directory,
                            color: Colors.blueGrey[400],
                            size: 25,
                          ),
                        ],
                      ),
                      const SizedBox(height: 2),
                      Row(
                        children: [
                          Icon(
                            Icons.list_alt,
                            color: const Color.fromARGB(255, 90, 138, 94),
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              store.description.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: const Color.fromARGB(255, 117, 117, 117),
                              ),
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              maxLines: 3,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.redAccent,
                            size: 14,
                          ),
                          const SizedBox(width: 4),
                          Expanded(
                            child: Text(
                              store.location.toString(),
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[700],
                              ),
                              softWrap: true,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Opciones superpuestas
            if (isOptionsVisible)
              Positioned.fill(
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Visibility(
                                visible: store.creator! == false && store.status! == 2,
                                child: Text(
                                  'No tienes permisos',
                                  style: TextStyle(fontSize: 18),
                                )),
                            Visibility(
                              visible: store.creator! == true ||
                                  store.status! ==
                                      1, //si es 0 es creador - si es 1 Colaboradores si es 2 Visualizadores
                              child: _buildOptionButton(
                                icon: Icons.edit,
                                label: "Editar",
                                color: Colors.blue,
                                onPressed: () {
                                  updateStoreData(store);
                                  print('mostarr el store:$store');
                                  //llamar al formulario de editar
                                  GoRouter.of(context).go(
                                    //mando a la vista de crear un nuevo almacen
                                    '/StoreCreation',
                                  );
                                  //  updateStore(store, 1);
                                  setState(() {
                                    isOptionsVisible = false;
                                  });
                                },
                              ),
                            ),
                            Visibility(
                              visible: store.creator! ==
                                  true, //si es 0 es creador - si es 1 Colaboradores si es 2 Visualizadores
                              child: _buildOptionButton(
                                icon: Icons.delete,
                                label: "Eliminar",
                                color: Colors.red,
                                onPressed: () async {
                                  await deleteStore(store.id!);
                                  requestStore();
                                },
                              ),
                            ),
                            _buildOptionButton(
                              icon: Icons.close,
                              label: "Cerrar",
                              color: Colors.black,
                              onPressed: () {
                                setState(() {
                                  isOptionsVisible = false;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
          ],
        ),
      );
    },
  );
}

Widget _buildOptionButton({
  required IconData icon,
  required String label,
  required Color color,
  required VoidCallback onPressed,
}) {
  return Column(
    children: [
      IconButton(
        icon: Icon(icon, color: color, size: 30),
        onPressed: onPressed,
      ),
      Text(
        label,
        style: TextStyle(color: color, fontSize: 12),
      ),
    ],
  );
}
