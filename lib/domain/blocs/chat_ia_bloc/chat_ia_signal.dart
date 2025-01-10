import 'package:signals/signals.dart';

// Definición de señales para el eiaado
final Signal<int> chatiaQuantityIA = Signal<int>(1);
final Signal<bool> isChatIaLoadingIA = Signal<bool>(false);
final Signal<String?> chatiaErrorIA = Signal<String?>(null);
final Signal<String?> chatiaEmpyIA = Signal<String?>(null);
final Signal<bool> isSubmittingIA = Signal<bool>(false);
final Signal<bool> submitSuccessIA = Signal<bool>(false);
final Signal<String?> submitErrorIA = Signal<String?>(null);
final Signal<String?> sendAnswerApi = Signal<String?>(null);
final Signal<int> cantAnswer = Signal<int>(0);
//nuevas
final Signal<bool> isUpdateIA = Signal<bool>(false);
