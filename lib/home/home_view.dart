// ignore_for_file: omit_local_variable_types

import 'package:flutter/material.dart';
import 'package:platform_channel_events/models/parking.dart';
import 'package:platform_channel_events/notificaitons/notification_api.dart';
import 'package:platform_channel_events/park/bloc/park_bloc.dart';
import 'package:platform_channel_events/park/park_view.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:platform_channel_events/user/user_view.dart';
import 'package:platform_channel_events/widgets/map_widget.dart';
import 'package:platform_channel_events/widgets/network_stream_widget.dart';
import 'package:provider/src/provider.dart';

class HomeView extends StatefulWidget {
  final String title;

  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () => NotificationApi.showNotification(
                title: 'Simple', body: 'This is a cool test!'),
            icon: Icon(Icons.notification_add)),
        centerTitle: true,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(Icons.person),
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute<void>(builder: (_) => UserView()));
            },
          ),
        ],
      ),
      body: Column(
        children: [
          const NetworkStreamWidget(),
          Expanded(
              child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                const GoogleMapWidget(),
                Container(
                    padding: EdgeInsets.all(32), child: _selectButton(context)),
              ])),
        ],
      ),
    );
  }

  Widget _selectButton(BuildContext context) {
    Parking selected =
        context.select((ParkBloc bloc) => bloc.state.selectedParking);
    return ElevatedButton(
      onPressed: selected != Parking.empty ? _selectPark : null,
      child: Text(
        'Selecionar estacionamento',
      ),
    );
  }

  void _selectPark() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => ParkView()));
  }
}
