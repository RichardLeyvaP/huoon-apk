import 'package:flutter/material.dart';
import 'package:huoon/data/repository/products_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/product_cat_state/bloc/product_cat_state_signal.dart';
import 'package:huoon/domain/modelos/category_model.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ProductsRepository productsRepository = ProductsRepository(authService: ApiService());
// Método para cargar las categorías y prioridades
Future<void> loadCategories() async {
  isLoadingSignalPCS.value = true; // Iniciamos la carga
  isErrorSignalPCS.value = false; // Reseteamos el error

  try {
    final jsonResponse = await productsRepository.getCategoriesPriority();

    List<Category> categories = (jsonResponse['productcategories'] as List<dynamic>).map((categoryJson) {
      return Category(
        title: categoryJson['nameCategory'],
        icon: _getCategoryIcon(categoryJson['nameCategory']),
        id: categoryJson['id'],
      );
    }).toList();

    List<Status> status = (jsonResponse['productstatus'] as List<dynamic>).map((categoryJson) {
      return Status(
        title: categoryJson['nameStatus'],
        icon: _getCategoryIcon(categoryJson['nameStatus']),
        id: categoryJson['id'],
      );
    }).toList();

    // Actualizamos las señales con los datos obtenidos
    categoriesSignalPCS.value = categories;
    statusSignalPCS.value = status;

    isLoadingSignalPCS.value = false; // Finaliza la carga
  } catch (error) {
    isErrorSignalPCS.value = true;
    categoriesErrorSignalPCS.value = error.toString();
    isLoadingSignalPCS.value = false;
  }
}

// Método auxiliar para asignar íconos según el nombre de la categoría
IconData _getCategoryIcon(String categoryName) {
  switch (categoryName.toLowerCase()) {
    case 'food':
      return Icons.fastfood;
    case 'cleaning':
      return Icons.cleaning_services;
    case 'electronics':
      return Icons.electrical_services;
    default:
      return Icons.category;
  }
}

// Funciones para manejar la selección de status y categoría
void selectStatus(int selectedId) {
  selectedStatusIdSignalPCS.value = selectedId;
}

void selectCategory(int selectedCategoryId) {
  selectedCategoryIdSignalPCS.value = selectedCategoryId;
}

void setQuantityProduct(int quantity) {
  quantityProductSignalPCS.value = quantity;
}

void clearTaskCategorySignals() {
  // Restablecer las señales a sus valores predeterminados
  categoriesSignalPCS.value = [];
  statusSignalPCS.value = [];
  selectedStatusIdSignalPCS.value = null;
  selectedCategoryIdSignalPCS.value = null;
  quantityProductSignalPCS.value = null;
  categoriesErrorSignalPCS.value = "";

  isLoadingSignalPCS.value = false;
  isErrorSignalPCS.value = null;
}
