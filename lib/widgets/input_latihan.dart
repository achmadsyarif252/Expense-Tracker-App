import 'dart:math';

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';

class InputLatihan extends StatefulWidget {
  final Function addLatihan;
  InputLatihan(this.addLatihan);

  @override
  _InputLatihanState createState() => _InputLatihanState();
}

class _InputLatihanState extends State<InputLatihan> {
  final titleController = TextEditingController();
  final jamController = TextEditingController();

  DateTime? selectedDate;

  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2019),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      setState(() {
        selectedDate = pickedDate;
      });
    });
  }

  void _submitData(BuildContext context) {
    if(jamController.text.isEmpty){
      return;
    }
    final int jam = int.parse(jamController.text);
    if (titleController.text.isEmpty || jam <= 0 || selectedDate == null) {
      return;
    }
    widget.addLatihan(titleController.text, jam, selectedDate);
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextFormField(
              validator: (e){
               return 'Salah Bro';
              },
              controller: titleController,
              decoration: InputDecoration(labelText: 'Nama APK'),
            ),
            TextFormField(
           validator: (e){
             return 'Salah Bro';
           },
              controller: jamController,
              decoration: InputDecoration(labelText: 'Menit'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(
              height: 20.0,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  selectedDate == null
                      ? 'No Date Choosen'
                      : DateFormat.yMMMd().format(selectedDate!),
                ),
                FlatButton(
                  textColor: Theme.of(context).primaryColor,
                  onPressed: () {
                    _showDatePicker(context);
                  },
                  child: Text(
                    'Pick Date',
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.0,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(10.0),
                ),
                color: Colors.black,
              ),
              height: 40,
              width: double.infinity,
              child: MaterialButton(
                onPressed: () {
                  print('Hallo Bos');
                  _submitData(context);
                },
                child: Text('Add Hours'),
                color: Theme.of(context).primaryColor,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
