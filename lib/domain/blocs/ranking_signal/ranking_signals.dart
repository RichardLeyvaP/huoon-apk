import 'package:huoon/data/models/ranking/ranking_model.dart';
import 'package:signals/signals.dart';

// Definimos las señales que almacenarán los estados
final Signal<bool> isLoadingRK = Signal<bool>(false);
final Signal<bool> rankingSubmittedSuccessRK = Signal<bool>(false);
final Signal<String?> errorMessageRK = Signal<String?>(null);
final Signal<String?> empyMessageRK = Signal<String?>(null);
final Signal<Ranking?> rankingSignalRK = Signal<Ranking?>(null);
