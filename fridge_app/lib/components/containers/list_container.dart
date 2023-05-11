import 'package:flutter/material.dart';

class ListContainer extends StatelessWidget{
  final Widget? child;

  const ListContainer({Key? key, required this.child}) : super(key : key);

  @override
  Widget build(BuildContext context){
    return Container(
      decoration: const BoxDecoration(
          color: Colors.black12,
          borderRadius: BorderRadius.all(Radius.circular(20))
      ),
      clipBehavior: Clip.antiAlias,
      child: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.7,
          child: child
        ),
      )),
    );
  }
}