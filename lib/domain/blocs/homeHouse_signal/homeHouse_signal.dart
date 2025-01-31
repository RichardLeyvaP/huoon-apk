import 'package:huoon/data/models/homeHouse/homeHouse_model.dart';
import 'package:huoon/data/models/homeHouseCategory/homeHouseCategory_model.dart';
import 'package:signals/signals.dart';

// Definimos las señales
final Signal<bool?> isLoggedInHH = Signal<bool?>(null);
final Signal<String> homeMessageHH = Signal<String>(""); // Mensaje de error o éxito
final Signal<bool> isLoadingHH = Signal<bool>(false); // Estado de carga
final Signal<bool> isHomeErrorHH = Signal<bool>(false); // Estado de error
final Signal<List<HomeHouse>?> homeHH = Signal<List<HomeHouse>?>(null);

final Signal<List<Hometype>?> taskTypeListHH = Signal<List<Hometype>?>(null);
final Signal<List<Homeperson>?> taskpersonListHH = Signal<List<Homeperson>?>(null);
final Signal<List<Homerole>?> rolesListHH = Signal<List<Homerole>?>(null);
final Signal<List<Homestatus>?> statusListHH = Signal<List<Homestatus>?>(null);
final Signal<List<Homewarehouse>?> warehouseListHH = Signal<List<Homewarehouse>?>(null);

// Datos del hogar
final Signal<String> homeNameHH = Signal<String>(""); // Nombre del hogar
final Signal<String> homeAddressHH = Signal<String>(""); // Dirección del hogar
final Signal<int?> homeTypeIdHH = Signal<int?>(null); // Tipo de hogar (ej. casa, apartamento)
final Signal<String?> residentsHH = Signal<String?>(null); // Cantidad de residentes
final Signal<String> geoLocationHH = Signal<String>(""); // Ubicación geográfica (lat, long)
final Signal<String> timezoneHH = Signal<String>(""); // Zona horaria
final Signal<int?> statusIdHH = Signal<int?>(null); // Estado (ej. activa, desocupada)
final Signal<String> homeImageHH = Signal<String>(""); // Imagen del hogar

// Personas dentro del hogar
final Signal<List<Person>?> peopleHH = Signal<List<Person>?>([]); // Lista de personas y roles asociados
