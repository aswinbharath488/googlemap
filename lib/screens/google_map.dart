import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  const GoogleMapsView({Key? key}) : super(key: key);

  @override
  State<GoogleMapsView> createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  @override
  void initState() {
    super.initState();
    // setCustomMarker();
  }

  final Set<Marker> _markers = {};


  // void setCustomMarker() async {
  //   mapMarker = await BitmapDescriptor.fromAssetImage(
  //       const ImageConfiguration(), 'assets/map.png');
  // }

  void _onMapCreated(GoogleMapController controller) {
    // controller.setMapStyle(mapStyle);
    setState(() {
      _markers.add(const Marker(
          markerId: MarkerId('id-1'),
          position: LatLng(10.7837, 76.0076),
          infoWindow: InfoWindow(
              title: "edappal", snippet: "A historical place")));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("google map"),
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        markers: _markers,
        initialCameraPosition: const CameraPosition(
          target: LatLng(10.7837, 76.0076),
          zoom: 15,
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _updatePosition,
      //   child: const Icon(Icons.location_on_outlined),
      // ),
    );
  }
}
