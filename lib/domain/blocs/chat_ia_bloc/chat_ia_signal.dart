import 'package:flutter/material.dart';
import 'package:huoon/data/models/store/store_model.dart';
import 'package:huoon/domain/modelos/category_model.dart';
import 'package:signals/signals.dart';

// Definición de señales para el estado
final Signal<StoreElement?> currentStoreElementST = Signal<StoreElement?>(null);
final Signal<int> storeQuantityST = Signal<int>(1);
final Signal<bool> isStoreLoadingST = Signal<bool>(false);
final Signal<String?> storeErrorST = Signal<String?>(null);
final Signal<String?> storeEmpyST = Signal<String?>(null);
final Signal<Store?> storeDataST = Signal<Store?>(null);
final Signal<bool> isSubmittingST = Signal<bool>(false);
final Signal<bool> submitSuccessST = Signal<bool>(false);
final Signal<String?> submitErrorST = Signal<String?>(null);
//nuevas
final Signal<bool> isUpdateST = Signal<bool>(false);
final Signal<List<Status>?> statusStoreCSP = Signal<List<Status>?>(
  [
    Status(
      id: 0,
      title: 'Personal',
      icon: Icons.person, // Puedes elegir cualquier ícono de la librería Material Icons
    ),
    Status(
      id: 1,
      title: 'Colaboradores',
      icon: Icons.group, // Otro ícono que se adecúe
    ),
    Status(
      id: 2,
      title: 'Visualizadores',
      icon: Icons.visibility, // Otro ícono que represente a visualizadores
    ),
  ],
);
