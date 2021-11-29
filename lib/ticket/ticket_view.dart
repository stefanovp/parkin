import 'package:flutter/material.dart';

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
        onPressed: () => Navigator.popUntil(context, (route) => route.isFirst),
        child: Text(
          'Pagar Ticket',
        ),
      ),
    );
  }
}
