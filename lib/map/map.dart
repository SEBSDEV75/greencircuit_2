// ignore_for_file: library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapPage> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng _origin = const LatLng(4.654684, -74.161880);

  final List<LatLng> _destinations = [
    const LatLng(4.586722, -74.404444),
    const LatLng(4.611222, -74.173333),
    const LatLng(4.608222, -74.251944),
    const LatLng(4.609333, -74.249444),
    const LatLng(4.608333, -74.16),
    const LatLng(4.609722, -74.165556),
    const LatLng(4.6856037, -74.0524328),
    const LatLng(4.5803843, -74.1348021),
    const LatLng(4.581909, -74.131959),
  ];

  final List<String> _destinationNames = [
    'Fundación Recyelectro',
    'Empresa de reciclaje Bogotá',
    'Recicladora La 11',
    'Recicladora la 20 centro',
    'Reciclajes Fontibon',
    'Reciclamas Bogotá',
    'ADMINISTRACION PRIME TOWER SAS',
    'CASA DE LA CULTURA - ALCALDÍA LOCAL DE TUNJUELITO',
    'DILE TUNJUELITO'
  ];

  @override
  void initState() {
    super.initState();
    _getLocation(); // Usa el método para obtener la ubicación en tiempo real
  }

  Future<void> _getLocation() async {
    final Location location = Location();
    final locationData = await location.getLocation();
    setState(() {
      _origin = LatLng(locationData.latitude!, locationData.longitude!);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntos de reciclaje'),
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: CameraPosition(
          target: _origin,
          zoom: 15,
        ),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: _buildMarkers(),
        polylines: _buildPolylines(),
        myLocationEnabled: true,
        myLocationButtonEnabled: true,
        gestureRecognizers: <Factory<OneSequenceGestureRecognizer>>{
          Factory<OneSequenceGestureRecognizer>(
            () => EagerGestureRecognizer(),
          ),
        },
      ),
    );
  }

  Set<Marker> _buildMarkers() {
    Set<Marker> markers = {
      Marker(
        markerId: const MarkerId('origin'),
        position: _origin,
        draggable: true,
        infoWindow: const InfoWindow(title: 'Origen'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
        onDragEnd: (LatLng newPosition) {
          setState(() {
            _origin = newPosition;
          });
        },
      ),
    };

    for (int i = 0; i < _destinations.length; i++) {
      markers.add(
        Marker(
          markerId: MarkerId('destination${i + 1}'),
          position: _destinations[i],
          draggable: true,
          infoWindow: InfoWindow(title: _destinationNames[i]),
          icon: BitmapDescriptor.defaultMarkerWithHue(
              (BitmapDescriptor.hueGreen + (i * 30)) % 360),
          onDragEnd: (LatLng newPosition) {
            setState(() {
              _destinations[i] = newPosition;
            });
          },
        ),
      );
    }

    return markers;
  }

  Set<Polyline> _buildPolylines() {
    Set<Polyline> polylines = {};

    for (int i = 0; i < _destinations.length; i++) {
      polylines.add(
        Polyline(
          polylineId: PolylineId('route${i + 1}'),
          color: Colors.primaries[i % Colors.primaries.length],
          points: [_origin, _destinations[i]],
          width: 5,
        ),
      );
    }

    return polylines;
  }
}
