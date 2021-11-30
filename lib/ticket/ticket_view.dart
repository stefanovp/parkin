import 'package:flutter/material.dart';
import 'package:platform_channel_events/models/ticket.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:provider/src/provider.dart';

class TicketView extends StatelessWidget {
  const TicketView({required Ticket this.ticket});
  final Ticket ticket;

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
          Text('Ticket Id: ${ticket.id}'),
        ],
      ),
    );
  }

  Widget _parkingNameTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.location_on),
      title: Text(ticket.parkingName),
    );
  }

  Widget _vehiclePlateTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.directions_car),
      title: Text(ticket.vehiclePlate),
    );
  }

  Widget _expirationTile() {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.access_time),
      title: Text(_dateToReadableString(
          DateTime.fromMillisecondsSinceEpoch(ticket.expirationDate * 1000))),
    );
  }

  String _dateToReadableString(DateTime date) {
    var year = date.year;
    var month = date.month;
    var day = date.day;
    var hour = date.hour;
    var minute = date.minute;
    var second = date.second;

    return '$day/$month/$year - $hour:${minute}h';
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
