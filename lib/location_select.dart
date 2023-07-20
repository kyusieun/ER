import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';

// 보라매 중앙대 병원
class LocationSelect extends StatefulWidget {
  const LocationSelect({Key? key}) : super(key: key);

  @override
  State<LocationSelect> createState() => _LocationSelectState();
}

class _LocationSelectState extends State<LocationSelect> {
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(37.541, 126.986);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  Future<Position> _getPosition() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('발견 장소'),
      ),
      body: GoogleMap(
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: _center,
          zoom: 11.0,
        ),
      ),
      bottomNavigationBar: ElevatedButton(
        child: Text('위치 좌표 저장하기'),
        onPressed: () {
          _getPosition().then((position) {
            print(
                "Template position check ${position.latitude}, ${position.longitude}");
          });
        },
      ),
    );
  }
}
