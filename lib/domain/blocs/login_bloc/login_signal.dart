import 'package:huoon/data/models/login/login_model.dart';
import 'package:signals/signals.dart';

// Definimos las señales
final Signal<bool?> isLoggedInLG = Signal<bool?>(null);
final Signal<String> loginMessageLG = Signal<String>(""); // Mensaje de error o éxito
final Signal<Login?> currentUserLG = Signal<Login?>(null); // Usuario actual
final Signal<bool> isLoadingLG = Signal<bool>(false); // Estado de carga
final Signal<bool> isLoginErrorLG = Signal<bool>(false); // Estado de carga
