import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:platform_channel_events/credits/credits_view.dart';
import 'package:platform_channel_events/ticket/tickets_view.dart';
import 'package:provider/src/provider.dart';

import '../models/user.dart';
import 'bloc/user_bloc.dart';

class UserView extends StatelessWidget {
  static Route route() {
    return MaterialPageRoute<void>(builder: (_) => UserView());
  }

  @override
  Widget build(BuildContext context) {
    final user = context.select((UserBloc element) => element.state.user);

    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text('Profile'), actions: [
        IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
      ]),
      body: _profilePage(context, user),
      backgroundColor: Theme.of(context).backgroundColor,
    );
  }

  Widget _avatar() {
    return CircleAvatar(
      radius: 50,
      child: Icon(Icons.person),
    );
  }

  Widget _nameTile(User user) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.person),
      title: Text(user.name),
    );
  }

  Widget _emailTile(User user) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.mail),
      title: Text(user.email),
    );
  }

  Widget _ageTile(User user) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.access_time),
      title: Text(user.age.toString()),
    );
  }

  Widget _creditsTile(User user) {
    return ListTile(
      tileColor: Colors.white,
      leading: Icon(Icons.attach_money),
      title: Text(user.credits.toString()),
    );
  }

  Widget _viewTicketsButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (_) => TicketsView())),
          child: Text('My Tickets'),
        ));
  }

  Widget _buyCreditsButton(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16.0),
        child: ElevatedButton(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute<void>(builder: (_) => CreditView())),
          child: Text('Buy Credits'),
        ));
  }

  Widget _buttonsRow(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 48.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_viewTicketsButton(context), _buyCreditsButton(context)],
      ),
    );
  }

  Widget _profilePage(BuildContext context, User user) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _avatar(),
          SizedBox(
            height: 30,
          ),
          _nameTile(user),
          _emailTile(user),
          _ageTile(user),
          _creditsTile(user),
          _buttonsRow(context),
        ],
      ),
    );
  }
}
