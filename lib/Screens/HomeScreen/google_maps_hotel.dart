import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsHotel extends StatefulWidget {
  final LatLng initialPosition;
  final String title;
  final String snippet;

  const GoogleMapsHotel({
    super.key,
    required this.initialPosition,
    required this.title,
    required this.snippet,
  });

  @override
  State<GoogleMapsHotel> createState() => _GoogleMapsHotelState();
}

class _GoogleMapsHotelState extends State<GoogleMapsHotel> {
  late GoogleMapController _mapController;
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    setState(() {
      _markers.add(
        Marker(
          markerId: MarkerId(widget.title),
          position: widget.initialPosition,
          infoWindow: InfoWindow(
            title: widget.title,
            snippet: widget.snippet,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 350,
          width: 350,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: Colors.white,
              width: 5,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 10,
                spreadRadius: 2,
                offset: Offset(2, 4),
              ),
            ],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.initialPosition,
                zoom: 12.0,
              ),
              markers: _markers,
              zoomControlsEnabled: true,
            ),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
