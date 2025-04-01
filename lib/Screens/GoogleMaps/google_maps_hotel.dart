import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

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
  final Set<Marker> _markers = {};

  void _onMapCreated(GoogleMapController controller) {
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
          height: 370,
          width: 600,
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: AppColors.white,
              width: 5,
            ),
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
