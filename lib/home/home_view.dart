import 'package:flutter/material.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:platform_channel_events/user/user_view.dart';
import 'package:platform_channel_events/widgets/map_widget.dart';
import 'package:platform_channel_events/widgets/network_stream_widget.dart';
import 'package:provider/src/provider.dart';

class HomeView extends StatefulWidget {
  final String title;
  final _parkingSelected = false;

  const HomeView({Key? key, required this.title}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
    return ElevatedButton(
      onPressed: widget._parkingSelected ? _selectPark : null,
      child: Text(
        'Selecionar estacionamento',
      ),
    );
  }

  void _selectPark() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (_) => UserView()));
  }
}
