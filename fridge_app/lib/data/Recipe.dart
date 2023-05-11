import 'package:cloud_firestore/cloud_firestore.dart';

class Ingredient {
  final DocumentReference ref;
  final String amount;
  final String weight;
  final DateTime expiryDate;
  // Maybe amount?

  const Ingredient({
    required this.ref,
    required this.amount,
    required this.weight,
    required this.expiryDate
  });

  Map<String, dynamic> toMap(){
    return {
      'ref' : ref.path, // Converting DocumentReference to String
      'amount' : amount,
      'weight' : weight,
      'expiryDate' : expiryDate.millisecondsSinceEpoch ~/ 1000,
    };
  }

  factory Ingredient.fromMap(Map<String, dynamic> map) => Ingredient(
    ref: FirebaseFirestore.instance.doc(map['ref']), // Converting String back to DocumentReference
    amount: map['amount'],
    weight: map['weight'],
    expiryDate: DateTime.fromMillisecondsSinceEpoch(map['expiryDate'] * 1000, isUtc: true)
  );
}