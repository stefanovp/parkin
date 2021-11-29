import 'package:flutter/material.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:provider/src/provider.dart';

class TicketView extends StatelessWidget {
  const TicketView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Ticket'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _ticketId(context),
            _parkingNameTile(),
            _vehiclePlateTile(),
            _expirationTile(),
            _payTicketButton(context),
          ],
        ),
      ),
    );
  }

  Widget _ticketId(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Column(
        children: [
          Image(
            image: AssetImage('assets/qrcode.png'),
            fit: BoxFit.cover,
          ),
          Text('Ticket Id: 10932i932932-323-2381903-232'),
        ],
      ),
    );
  }

  Widget _parkingNameTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.location_on),
      title: Text('Parque dos Patins'),
    );
  }

  Widget _vehiclePlateTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.directions_car),
      title: Text('LKE6601'),
    );
  }

  Widget _expirationTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.access_time),
      title: Text('14:35h'),
    );
  }

  Widget _payTicketButton(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () => _onPayButtonClicked(context),
        child: Text(
          'Pagar Ticket',
        ),
      ),
    );
  }

  void _onPayButtonClicked(BuildContext context) {
    context.read<UserBloc>().add(UseCreditsEvent(used: 3));
    Navigator.popUntil(context, (route) => route.isFirst);
  }
}
