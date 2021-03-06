import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:platform_channel_events/home/home_view.dart';
import 'package:platform_channel_events/models/parking.dart';
import 'package:platform_channel_events/models/user.dart';
import 'package:platform_channel_events/park/bloc/park_bloc.dart';
import 'package:platform_channel_events/ticket/bloc/ticket_bloc.dart';
import 'package:platform_channel_events/ticket/ticket_view.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:platform_channel_events/user/user_view.dart';
import 'widgets/network_stream_widget.dart';

void main() {
  runApp(_MyApp());
}

class _MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => UserBloc(
                user: User(
                    '1', 'Stefano Pereira', 23, 100, 'stefano@flutter.com'))),
        BlocProvider(create: (context) => ParkBloc(parking: Parking.empty)),
        BlocProvider(create: (context) => TicketBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.purple,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Color(0xffededed),
        ),
        home: HomeView(
          title: "Parkin",
        ),
      ),
    );
  }
}
