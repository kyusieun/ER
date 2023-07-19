import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:geolocator/geolocator.dart';

class LocationSelect extends StatelessWidget {
  const LocationSelect({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("발견 장소"),
        ),
        body: Placeholder());
  }
}

// class MapScreen extends StatefulWidget {
//   @override
//   _MapScreenState createState() => _MapScreenState();
// }

// class _MapScreenState extends State<MapScreen> {
//   GoogleMapController? _mapController; 
//   Position? _currentPosition;

//   @override
//   void initState() {
//     super.initState();
//     _getCurrentLocation();
//   }

//   Future<void> _getCurrentLocation() async {
//     try {
//       final position = await Geolocator.getCurrentPosition(
//         desiredAccuracy: LocationAccuracy.high,
//       );
//       setState(() {
//         _currentPosition = position;
//       });
//     } catch (e) {
//       print(e);
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('발견 장소'),
//       ),
//       body: GoogleMap(
//         initialCameraPosition: CameraPosition(
//           target: _currentPosition != null
//               ? LatLng(_currentPosition!.latitude, _currentPosition!.longitude)
//               : LatLng(0, 0),
//           zoom: 15,
//         ),
//         onMapCreated: (controller) {
//           setState(() {
//             _mapController = controller;
//           });
//         },
//         markers: _currentPosition != null
//             ? {
//                 Marker(
//                   markerId: MarkerId('current_location'),
//                   position: LatLng(
//                     _currentPosition!.latitude,
//                     _currentPosition!.longitude,
//                   ),
//                 ),
//               }
//             : {},
//       ),
//     );
//   }
// }
