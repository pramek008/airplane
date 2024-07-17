
import 'package:airplane/models/destination_model.dart';
import 'package:equatable/equatable.dart';

class TransactionModel extends Equatable {
  final String id;
  final DestinationModel destination;
  final int amountOfTraveller;
  final String selectedSeat;
  final bool insurance;
  final bool refundable;
  final double vat;
  final int price;
  final int grandTotal;

  const TransactionModel({
    required this.destination,
    this.id = '',
    this.amountOfTraveller = 0,
    this.selectedSeat = '',
    this.insurance = false,
    this.refundable = false,
    this.vat = 0,
    this.price = 0,
    this.grandTotal = 0,
  });

  @override
  List<Object> get props {
    return [
      destination,
      amountOfTraveller,
      selectedSeat,
      insurance,
      refundable,
      vat,
      price,
      grandTotal,
    ];
  }

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      destination: DestinationModel.fromJson(json['destination']['id'],
          json['destination'] as Map<String, dynamic>),
      amountOfTraveller: json['amountOfTraveller']?.toInt() ?? 0,
      selectedSeat: json['selectedSeat'] ?? '',
      insurance: json['insurance'] ?? false,
      refundable: json['refundable'] ?? false,
      vat: json['vat']?.toDouble() ?? 0.0,
      price: json['price']?.toInt() ?? 0,
      grandTotal: json['grandTotal']?.toInt() ?? 0,
    );
  }
}
