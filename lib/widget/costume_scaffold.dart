import 'package:flutter/material.dart';

class CostumeScaffold extends StatelessWidget {
  final Widget body;
  const CostumeScaffold({Key? key, required this.body}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [body, _cardAppBar(context)],
      )),
    );
  }

  Card _cardAppBar(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(0),
      shape: const BeveledRectangleBorder(
          borderRadius: BorderRadius.only(bottomRight: Radius.circular(16.0))),
      child: Row(
        // supaya ukura row tidak sama ukuran layar
        mainAxisSize: MainAxisSize.min,

        children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.arrow_back)),
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              'Na',
              style: Theme.of(context).textTheme.headline6,
            ),
          )
        ],
      ),
    );
  }
}
