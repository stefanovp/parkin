import 'package:flutter/material.dart';
import 'package:platform_channel_events/user/bloc/user_bloc.dart';
import 'package:provider/src/provider.dart';

class CreditView extends StatelessWidget {
  const CreditView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Buy Credits'),
      ),
      body: ListView(
        children: [
          BuyCard(amount: 20, price: '20,00'),
          BuyCard(amount: 50, price: '30,00'),
          BuyCard(amount: 100, price: '50,00'),
        ],
      ),
    );
  }
}

class BuyCard extends StatelessWidget {
  const BuyCard({required int this.amount, required String this.price});

  final String price;
  final int amount;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
      height: 180,
      width: double.maxFinite,
      child: GestureDetector(
        onTap: () => _onCardTap(context),
        child: Card(
          child: Container(
            color: Colors.purple,
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(16.0),
                  child: Icon(
                    Icons.payments_sharp,
                    size: 48.0,
                    color: Colors.white,
                  ),
                ),
                Expanded(
                    child: Container(
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Comprar $amount creditos',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          )),
                      Text('R\$ $price',
                          style: TextStyle(
                            fontSize: 48.0,
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

  void _onCardTap(BuildContext context) {
    context.read<UserBloc>().add(BuyCreditsEvent(quantity: amount));
    Navigator.of(context).pop();
  }
}
