import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuButtonLarge extends StatelessWidget{
  final String buttonText;
  final Function()? onPressed;

  const MenuButtonLarge({
    Key? key,
    required this.buttonText,
    required this.onPressed,
  }) : super(key : key);

  @override
  Widget build(BuildContext context){
    return SizedBox(
      width: 400,
      child: ElevatedButton(
        onPressed: onPressed,
        child: Text(buttonText),
      ),
    );
  }
}