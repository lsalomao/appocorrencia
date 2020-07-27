import 'package:app_ocorrencia/app/shared/Interfaces/google_maps_interface.dart';
import 'package:geolocator/geolocator.dart';

class GoogleMapsServices implements IGoogleMapsServices {
  Future<Placemark> recuperarLocalizacaoCompleta() async {
    Position position =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    List<Placemark> listaEndereco = await Geolocator().placemarkFromPosition(position);

    return listaEndereco[0];
  }

  Future<Position> recuperarPosicaoLatitudeLongitude() async {
    Position position =
        await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return position;
  }
}
