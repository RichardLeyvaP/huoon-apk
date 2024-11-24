// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:huoon/data/models/products/product_model.dart';
// import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
// import 'package:myhome/data/models/products/product_model.dart';
// import 'package:myhome/domain/blocs/products_bloc/products_bloc.dart';
// import 'package:myhome/domain/blocs/products_bloc/products_event.dart';
// import 'package:myhome/domain/blocs/products_bloc/products_state.dart';
// import 'package:myhome/ui/util/utils_class_apk.dart';

// class ProductPage extends StatefulWidget {
//   const ProductPage({super.key});

//   @override
//   _ProductPageState createState() => _ProductPageState();
// }

// class _ProductPageState extends State<ProductPage> {
//   bool _showProductDetail = false;
//   ProductElement? _selectedProduct;

//   @override
//   void initState() {
//     super.initState();
   
//     WidgetsBinding.instance.addPostFrameCallback((_) async {});
//   }

//   // Función para cambiar a la vista de detalles del producto
//   void _showProductDetails(ProductElement product) {
//     setState(() {
//       _selectedProduct = product;
//       _showProductDetail = true;
//     });
//   }

//   // Función para regresar a la lista de productos
//   void _showProductList() {
//     setState(() {
//       _showProductDetail = false;
//       _selectedProduct = null;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     print('Entrando en página de productos');
//     return Scaffold(
//       body: _showProductDetail && _selectedProduct != null
//           ? _buildProductListView()
//           // ? _buildProductDetailView(_selectedProduct!)
//           : _buildStoreListView(),
//     );
//   }

//   Widget _buildProductListView() {
//     return Expanded(
//       child: BlocBuilder<ProductsBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: StyleGlobalApk.getColorPrimary(),
//               ),
//             );
//           } else if (state is ProductFailure) {
//             return Center(child: Text('Error: ${state.error}'));
//           } else if (state is ProductEmpty) {
//             return Column(
//               children: [
//                 SizedBox(height: 180),
//                 Center(child: Text('${state.message}')),
//               ],
//             );
//           } else if (state is ProductSuccess) {
//             List<ProductElement> products = state.product.products;

//             return SingleChildScrollView(
//               child: Column(
//                 children: [
//                   Column(
//                     children: products.map((product) {
//                       return GestureDetector(
//                         onTap: () => _showProductDetails(product),
//                         child: buildProductContainer("RONNN", product.image.toString(), "2450"),
//                       );
//                     }).toList(),
//                   ),
//                   SizedBox(height: 100),
//                   ElevatedButton(
//                     onPressed: _showProductList,
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(MdiIcons.arrowLeft),
//                         Text('Volver a los Almacenes'),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           } else {
//             return Center(child: const Text('No hay estados de productos'));
//           }
//         },
//       ),
//     );
//   }

//   Widget _buildStoreListView() {
//     return Expanded(
//       child: BlocBuilder<ProductsBloc, ProductState>(
//         builder: (context, state) {
//           if (state is ProductLoading) {
//             return Center(
//               child: CircularProgressIndicator(
//                 color: StyleGlobalApk.getColorPrimary(),
//               ),
//             );
//           } else if (state is ProductFailure) {
//             return Center(child: Text('Error: ${state.error}'));
//           } else if (state is ProductEmpty) {
//             return Column(
//               children: [
//                 SizedBox(height: 180),
//                 Center(child: Text('${state.message}')),
//               ],
//             );
//           } else if (state is ProductSuccess) {
//             List<ProductElement> products = state.product.products;

//             return SingleChildScrollView(
//               child: Column(
//                 children: products.map((product) {
//                   return GestureDetector(
//                     onTap: () => _showProductDetails(product),
//                     child: buildStoreContainer(
//                         product.name.toString(), product.image.toString(), product.unitPrice.toString()),
//                   );
//                 }).toList(),
//               ),
//             );
//           } else {
//             return Center(child: const Text('No hay estados de productos'));
//           }
//         },
//       ),
//     );
//   }
// }

// Widget buildProductContainer(String name, String imageUrl, String price) {
//   return Container(
//     margin: const EdgeInsets.all(10),
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color: Colors.grey),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1),
//           blurRadius: 4,
//           offset: Offset(2, 2),
//         ),
//       ],
//     ),
//     child: Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: imageUrl.isNotEmpty
//               // ? NetworkImage(imageUrl)
//               ? NetworkImage('https://thumbs.dreamstime.com/z/productos-alimenticios-venezolanos-50576620.jpg')
//               : AssetImage('assets/default_product_image.png') as ImageProvider,
//           radius: 30,
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '\$$price',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }

// Widget buildStoreContainer(String name, String imageUrl, String price) {
//   return Container(
//     margin: const EdgeInsets.all(10),
//     padding: const EdgeInsets.all(10),
//     decoration: BoxDecoration(
//       color: Colors.white,
//       borderRadius: BorderRadius.circular(8),
//       border: Border.all(color: Colors.grey),
//       boxShadow: [
//         BoxShadow(
//           color: Colors.black.withOpacity(0.1),
//           blurRadius: 4,
//           offset: Offset(2, 2),
//         ),
//       ],
//     ),
//     child: Row(
//       children: [
//         CircleAvatar(
//           backgroundImage: imageUrl.isNotEmpty
//               // ? NetworkImage(imageUrl)
//               ? NetworkImage('https://thumbs.dreamstime.com/z/productos-alimenticios-venezolanos-50576620.jpg')
//               : AssetImage('assets/default_product_image.png') as ImageProvider,
//           radius: 30,
//         ),
//         const SizedBox(width: 10),
//         Expanded(
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     name,
//                     style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     '\$$price',
//                     style: TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.green,
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   );
// }
