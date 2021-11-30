import 'package:flutter/material.dart';
import 'package:platform_channel_events/database/database.dart';
import 'package:platform_channel_events/models/ticket.dart';
import 'package:platform_channel_events/ticket/ticket_view.dart';

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
    tickets = tickets.reversed.toList();

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
            child: TicketCard(
              ticket: ticket,
            ),
          );
        },
      );
}

class TicketCard extends StatelessWidget {
  const TicketCard({required Ticket this.ticket});

  final Ticket ticket;

  @override
  Widget build(BuildContext context) {
    bool isValid;

    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 180,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute<void>(
            builder: (_) => TicketView(
                  ticket: ticket,
                ))),
        child: Card(
          child: Container(
            color: ticket.isValid() ? Colors.green : Colors.amber,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Text('#${ticket.id}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 28.0,
                        fontWeight: FontWeight.w600,
                      )),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(ticket.parkingName,
                          style: TextStyle(
                            fontSize: 32.0,
                            fontWeight: FontWeight.w600,
                          )),
                      Text('Veículo: ${ticket.vehiclePlate}',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          )),
                    ],
                  ),
                ))
              ],
            ),
          ),
          elevation: 10,
        ),
      ),
    );
  }
}
