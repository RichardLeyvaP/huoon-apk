import 'package:huoon/data/models/products/product_model.dart';
import 'package:huoon/data/repository/products_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/products_bloc/products_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final ProductsRepository productsRepository = ProductsRepository(authService: ApiService());

// Método para cargar productos
Future<void> loadProduct() async {
  isLoadingSignalPR.value = true;
  productErrorSignal.value = null;
  productEmpySignal.value = null;

  try {
    final result = await productsRepository.getProduct();

    if (result is String) {
      //está vacio
      productEmpySignal.value = result;
    } else if (result is Product) {
      //hay producto
      productSignal.value = result;
    }
  } catch (error) {
    productErrorSignal.value = error.toString();
  } finally {
    isLoadingSignalPR.value = false;
  }
}

// Métodos para actualizar datos del producto
void updateProductData(ProductElement updatedElement) {
  productElementSignal.value = productElementSignal.value.copyWith(
    name: updatedElement.name ?? productElementSignal.value.name,
    additionalNotes: updatedElement.additionalNotes ?? productElementSignal.value.additionalNotes,
    categoryId: updatedElement.categoryId ?? productElementSignal.value.categoryId,
    statusId: updatedElement.statusId ?? productElementSignal.value.statusId,
    unitPrice: updatedElement.unitPrice ?? productElementSignal.value.unitPrice,
    purchaseDate: updatedElement.purchaseDate ?? productElementSignal.value.purchaseDate,
    expirationDate: updatedElement.expirationDate ?? productElementSignal.value.expirationDate,
    purchasePlace: updatedElement.purchasePlace ?? productElementSignal.value.purchasePlace,
    brand: updatedElement.brand ?? productElementSignal.value.brand,
  );
}

// Métodos para aumentar o disminuir la cantidad
void increaseQuantity() {
  quantitySignal.value += 1;
}

void decreaseQuantity() {
  if (quantitySignal.value > 1) {
    quantitySignal.value -= 1;
  }
}

// Método para enviar el producto a la API
Future<void> submitProduct(ProductsRepository productsRepository) async {
  isProductSubmittingSignal.value = true;
  submitErrorSignal.value = "";

  try {
    await productsRepository.addProduct(productElementSignal.value);
    productSubmittedSuccessSignal.value = true;
  } catch (error) {
    submitErrorSignal.value = error.toString();
    productSubmittedSuccessSignal.value = false;
  } finally {
    isProductSubmittingSignal.value = false;
  }
}

void clearProductSignals() {
  // Restablecer las señales a sus valores predeterminados
  productSignal.value = null;
  productElementSignal.value = const ProductElement();
  quantitySignal.value = 1;

  isLoadingSignalPR.value = false;
  productErrorSignal.value = null;
  productEmpySignal.value = null;
  submitErrorSignal.value = "";

  isProductSubmittingSignal.value = false;
  productSubmittedSuccessSignal.value = false;
}
