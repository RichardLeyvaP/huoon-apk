// store_signal.dart
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/data/repository/store_repository.dart';
import 'package:huoon/data/services/globalCallApi/apiService.dart';
import 'package:huoon/domain/blocs/store_bloc/store_signal.dart';

// Repositorio de configuración (se asume que ya está inicializado en otro lugar)
final StoreRepository storeRepository = StoreRepository(authService: ApiService());

// Método para obtener tiendas
Future<void> requestStore() async {
  isUpdateST.value = false; //esto solo va  atener true cuando se de para modificar
  isStoreLoadingST.value = true;
  storeErrorST.value = null;
  storeEmpyST.value = null;
  storeDataST.value = null;

  try {
    final result = await storeRepository.getStore();

    if (result is String) {
      storeEmpyST.value = result;
      storeDataST.value = null;
    } else if (result is Store) {
      storeDataST.value = result;
    }
  } catch (error) {
    storeErrorST.value = "Error: ${error.toString()}";
  } finally {
    isStoreLoadingST.value = false;
  }
}

// Método para actualizar datos de la tienda
void updateStoreData(StoreElement updatedStoreElement) {
  isUpdateST.value = true;
  currentStoreElementST.value = (currentStoreElementST.value ?? const StoreElement()).copyWith(
    warehouse_id: updatedStoreElement.warehouse_id ?? currentStoreElementST.value?.warehouse_id,
    id: updatedStoreElement.id ?? currentStoreElementST.value?.id,
    title: updatedStoreElement.title ?? currentStoreElementST.value?.title,
    description: updatedStoreElement.description ?? currentStoreElementST.value?.description,
    location: updatedStoreElement.location ?? currentStoreElementST.value?.location,
    status: updatedStoreElement.status ?? currentStoreElementST.value?.status,
  );
}

// Método para enviar tienda a la API
Future<void> submitStore(StoreElement updatedStoreElement, int homeId) async {
  isSubmittingST.value = true;
  try {
    await storeRepository.addStore(updatedStoreElement, homeId);
    // await storeRepository.addStore(currentStoreElementST.value!);
    isSubmittingST.value = false;
    submitSuccessST.value = true;
    submitErrorST.value = null;
  } catch (error) {
    isSubmittingST.value = false;
    submitSuccessST.value = false;
    submitErrorST.value = error.toString();
  } finally {}
}

// Método para enviar tienda a la API
Future<void> updateStore(StoreElement updatedStoreElement, int homeId) async {
  isSubmittingST.value = true;
  try {
    await storeRepository.updateStoreRepository(updatedStoreElement, homeId);
    // await storeRepository.addStore(currentStoreElementST.value!);
    isSubmittingST.value = false;
    submitSuccessST.value = true;
    submitErrorST.value = null;
  } catch (error) {
    isSubmittingST.value = false;
    submitSuccessST.value = false;
    submitErrorST.value = error.toString();
  } finally {}
}

// Método para enviar tienda a la API
Future<void> deleteStore(int id) async {
  isSubmittingST.value = true;
  try {
    await storeRepository.deleteStoreRepository(id);
    // await storeRepository.addStore(currentStoreElementST.value!);
    isSubmittingST.value = false;
    submitSuccessST.value = true;
    submitErrorST.value = null;
  } catch (error) {
    isSubmittingST.value = false;
    submitSuccessST.value = false;
    submitErrorST.value = error.toString();
  } finally {}
}

// Métodos para incrementar y disminuir la cantidad
void increaseStoreQuantity() {
  storeQuantityST.value = storeQuantityST.value + 1;
}

void decreaseStoreQuantity() {
  if (storeQuantityST.value > 1) {
    storeQuantityST.value = storeQuantityST.value - 1;
  }
}

void clearStoreSignals() {
  // Restablecer las señales a sus valores predeterminados
  currentStoreElementST.value = null;
  storeQuantityST.value = 1;
  isStoreLoadingST.value = false;
  storeErrorST.value = null;
  storeEmpyST.value = null;
  storeDataST.value = null;
  isSubmittingST.value = false;
  submitSuccessST.value = false;
  submitErrorST.value = null;
}
