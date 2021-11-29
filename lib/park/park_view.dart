import 'package:flutter/material.dart';
import 'package:platform_channel_events/models/parking.dart';
import 'package:platform_channel_events/park/bloc/park_bloc.dart';
import 'package:provider/src/provider.dart';

class ParkView extends StatelessWidget {
  const ParkView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Parking selectedParking =
        context.select((ParkBloc bloc) => bloc.state.selectedParking);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Parking Details'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _imageBox(context),
            _parkingName(context, selectedParking),
            _totalTile(selectedParking),
            _availableTile(selectedParking),
            _plateTile(context),
            _buildTicketButton(),
          ],
        ),
      ),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _imageBox(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),
        ],
      ),
      child: Image(
        image: AssetImage('assets/parquedospatins.jpg'),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _parkingName(BuildContext context, Parking selectedParking) {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          selectedParking.name,
          style: TextStyle(
            fontSize: 28.0,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }

  Widget _totalTile(Parking selectedParking) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.center_focus_strong),
      title: Text('Vagas totais: ${selectedParking.totalSpots}'),
    );
  }

  Widget _availableTile(Parking selectedParking) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.crop_free),
      title: Text('Vagas livres: ${selectedParking.availableSpots}'),
    );
  }

  Widget _plateTile(BuildContext context) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.edit),
      title: TextFormField(
        initialValue: context.select((ParkBloc bloc) => bloc.state.plate),
        decoration: InputDecoration.collapsed(hintText: 'Placa do veículo'),
        onChanged: (value) => context
            .read<ParkBloc>()
            .add(VehiclePlateChangedEvent(plate: value)),
      ),
    );
  }

  Widget _buildTicketButton() {
    return Container(
      padding: EdgeInsets.all(16.0),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          'Gerar Ticket',
        ),
      ),
    );
  }
}
