import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

import '../../model/map_point.dart';
import '../widgets/modal_body.dart';

class MapPage extends StatefulWidget {
  static const routeName = '/map';
  const MapPage({super.key});

  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late final YandexMapController _mapController;

  /// Метод для генерации точек на карте
  List _getMapPoints() {
    return const [
      MapPoint(name: 'Москва', latitude: 55.755864, longitude: 37.617698),
      MapPoint(name: 'Лондон', latitude: 51.507351, longitude: -0.127696),
      MapPoint(name: 'Рим', latitude: 41.887064, longitude: 12.504809),
      MapPoint(name: 'Париж', latitude: 48.856663, longitude: 2.351556),
      MapPoint(name: 'Стокгольм', latitude: 59.347360, longitude: 18.341573),
      MapPoint(
          name: 'Санкт-Петербург', latitude: 59.9342802, longitude: 30.3350986),
      MapPoint(name: 'Уфа', latitude: 54.733334, longitude: 56.000000),
    ];
  }

  /// Метод для генерации объектов маркеров для отображения на карте
  List _getPlacemarkObjects(BuildContext context) {
    return _getMapPoints()
        .map(
          (point) => PlacemarkMapObject(
            mapId: MapObjectId('MapObject $point'),
            point: Point(latitude: point.latitude, longitude: point.longitude),
            opacity: 1,
            icon: PlacemarkIcon.single(
              PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                  'assets/place.png',
                ),
                scale: 1.0,
              ),
            ),
            onTap: (_, __) => showModalBottomSheet(
              context: context,
              builder: (context) => ModalBody(
                point: point,
              ),
            ),
          ),
        )
        .toList();
  }

  @override
  void dispose() {
    _mapController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: YandexMap(
        onMapCreated: (controller) async {
          _mapController = controller;
          await _mapController.moveCamera(
            CameraUpdate.newCameraPosition(
              const CameraPosition(
                target: Point(
                  latitude: 55.7522200,
                  longitude: 37.6155600,
                ),
                zoom: 3,
              ),
            ),
          );
        },
        mapObjects: [
          ..._getPlacemarkObjects(context),
        ],
      ),
    );
  }
}
