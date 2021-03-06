import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:platform_channel_events/models/parking.dart';
import 'package:platform_channel_events/park/bloc/park_bloc.dart';
import 'package:provider/src/provider.dart';

class GoogleMapWidget extends StatefulWidget {
  const GoogleMapWidget({Key? key}) : super(key: key);

  @override
  _GoogleMapWidgetState createState() => _GoogleMapWidgetState();
}

class _GoogleMapWidgetState extends State<GoogleMapWidget> {
  static const _initialCameraPosition =
      CameraPosition(target: LatLng(-22.9797, -43.2334), zoom: 15);

  late GoogleMapController _googleMapController;

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      myLocationButtonEnabled: false,
      zoomControlsEnabled: false,
      initialCameraPosition: _initialCameraPosition,
      onMapCreated: (controller) => _googleMapController = controller,
      markers: {
        Marker(
          markerId: MarkerId('pqpatins'),
          infoWindow: InfoWindow(title: "Parque dos Patins: 88 vagas"),
          position: LatLng(-22.97186, -43.21660),
          onTap: () => context.read<ParkBloc>().add(ParkSelectedEvent(
              parking: Parking('Parque dos Patins', 150, 88))),
        ),
        Marker(
          markerId: MarkerId('coballeblon'),
          infoWindow: InfoWindow(title: "Cobal do Leblon: 38 vagas"),
          position: LatLng(-22.97975, -43.22122),
          onTap: () => context.read<ParkBloc>().add(
              ParkSelectedEvent(parking: Parking('Cobal do Leblon', 55, 38))),
        ),
        Marker(
          markerId: MarkerId('baixogavea'),
          infoWindow: InfoWindow(title: "Baixo Gávea: 133 vagas"),
          position: LatLng(-22.97363, -43.22712),
          onTap: () => context.read<ParkBloc>().add(
              ParkSelectedEvent(parking: Parking('Baixo Gávea', 214, 133))),
        ),
      },
      onTap: _handleTap,
    );
  }

  void _handleTap(LatLng tappedPoint) {
    context.read<ParkBloc>().add(ClearSelectionEvent());
  }

  @override
  void dispose() {
    _googleMapController.dispose();
    super.dispose();
  }
}
