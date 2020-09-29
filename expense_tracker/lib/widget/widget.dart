import 'package:flutter/material.dart';

class TField extends StatelessWidget {
  TField({
    @required this.title,
    @required this.controller,
  });
  final bool title;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      autofocus: true,
      textCapitalization: TextCapitalization.words,
      keyboardType: title ? TextInputType.name : TextInputType.number,
      decoration: InputDecoration(
          labelText: title ? "Title" : "Amount",
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Theme.of(context).primaryColor))),
      onSubmitted: (value) {
        controller.text = value;
      },
    );
  }
}

class RButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  RButton({
    this.title,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      child: Text(
        title,
        style: Theme.of(context).textTheme.button,
      ),
      shape: StadiumBorder(),
      color: title == 'Cancel' ? Colors.red : Colors.green,
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
    );
  }
}
