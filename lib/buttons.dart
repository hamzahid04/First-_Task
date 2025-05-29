import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  
  String btnName;
  void Function()? onPressed;
  
  MyButtons({
    super.key,
    required this.btnName,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed, 
        child: Text(btnName));
  }
}
