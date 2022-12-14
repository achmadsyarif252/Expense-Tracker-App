import 'dart:math';

import 'package:expenses_tracker_app/models/latihan.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ListLatihan extends StatelessWidget {
  final Function hapusItem;
  final List<Latihan> listLatihan;
  ListLatihan(this.listLatihan, this.hapusItem);
  Random nomer = new Random();
  @override
  Widget build(BuildContext context) {
    print('build() latihanList');
    return ListView.builder(
      itemBuilder: (context, index) {
        final item = listLatihan[index].id;
        return Dismissible(
          background: Container(
              color: Colors.red,
              height: 50,
              child: Text('Swipe Lef/Righ to Delete')),
          key: Key(item),
          onDismissed: (direction) {
            hapusItem(item);
          },
          child: Card(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
            elevation: 5,
            color: Colors.transparent,
            child: Container(
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
                gradient: LinearGradient(colors: [
                  listLatihan[index].warna.withOpacity(1),
                  listLatihan[index].warna.withOpacity(0.7),
                ]),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Color.fromRGBO(255, 255, 255, 1),
                  radius: 25,
                  child: Icon(
                    Icons.account_balance_wallet,
                  ),
                ),
                title: Text(
                  listLatihan[index].title,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  DateFormat.yMMMd().format(
                    listLatihan[index].waktu,
                  ),
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                trailing: Text(
                  '${listLatihan[index].jam} Menit',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 22.0,
                  ),
                ),
              ),
            ),
          ),
        );
      },
      itemCount: listLatihan.length,
    );
  }
}
