import 'package:geolocator/geolocator.dart';

abstract class IGoogleMapsServices {
  Future<Placemark> recuperarLocalizacaoCompleta();
  Future<Position> recuperarPosicaoLatitudeLongitude();
}
