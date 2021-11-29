import 'package:flutter/material.dart';
import 'package:platform_channel_events/database/database.dart';
import 'package:platform_channel_events/models/ticket.dart';

class TicketsView extends StatefulWidget {
  const TicketsView({Key? key}) : super(key: key);

  @override
  _TicketsViewState createState() => _TicketsViewState();
}

class _TicketsViewState extends State<TicketsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: const Text('Tickets')),
      body: const TicketsWidget(),
    );
  }
}

class TicketsWidget extends StatefulWidget {
  const TicketsWidget({Key? key}) : super(key: key);

  @override
  _TicketsWidgetState createState() => _TicketsWidgetState();
}

class _TicketsWidgetState extends State<TicketsWidget> {
  late List<Ticket> tickets;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();

    refreshTickets();
  }

  Future refreshTickets() async {
    setState(() => isLoading = true);

    this.tickets = await TicketsDatabase.instance.readAllTickets();

    setState(() => isLoading = false);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: isLoading
          ? CircularProgressIndicator()
          : tickets.isEmpty
              ? const Center(
                  child: Text(
                    'No Tickets',
                    style: TextStyle(color: Colors.black, fontSize: 24),
                  ),
                )
              : buildTickets(),
    );
  }

  Widget buildTickets() => ListView.builder(
        itemCount: tickets.length,
        itemBuilder: (context, index) {
          Ticket ticket = tickets[index];
          return Container(
            padding: const EdgeInsets.all(10.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ticket.id.toString()),
                  Text('Local: ${ticket.parkingName}'),
                  Text('Veiculo: ${ticket.vehiclePlate}')
                ],
              ),
            ),
          );
        },
      );
}
