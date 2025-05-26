import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

class GoogleMapsHotel extends StatefulWidget {
  final LatLng initialPosition;
  final String title;
  final String snippet;
  final double? zoom;
  final double? heightMap;
  final double? widthMap;

  const GoogleMapsHotel({
    super.key,
    required this.initialPosition,
    required this.title,
    required this.snippet,
    this.zoom,
    this.heightMap = 370,
    this.widthMap = 600,
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
          height: widget.heightMap,
          width: widget.widthMap,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.white,
              width: 4,
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: GoogleMap(
              onMapCreated: _onMapCreated,
              initialCameraPosition: CameraPosition(
                target: widget.initialPosition,
                zoom: widget.zoom ?? 12.0,
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
