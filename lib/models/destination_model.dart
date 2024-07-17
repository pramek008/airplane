
import 'package:equatable/equatable.dart';

class DestinationModel extends Equatable {
  final String id;
  final String about;
  final String city;
  final String imgUrl;
  final String name;
  final List interests;
  final List photos;
  final int price;
  final double rating;

  const DestinationModel({
    required this.id,
    this.about = '',
    this.city = '',
    this.imgUrl = '',
    this.name = '',
    this.interests = const [],
    this.photos = const [],
    this.price = 0,
    this.rating = 0.0,
  });

  @override
  List<Object> get props {
    return [
      id,
      about,
      city,
      imgUrl,
      name,
      interests,
      photos,
      price,
      rating,
    ];
  }

  factory DestinationModel.fromJson(String id, Map<String, dynamic> json) {
    return DestinationModel(
      id: id,
      about: json['about'] ?? '',
      city: json['city'] ?? '',
      imgUrl: json['imgUrl'] ?? '',
      name: json['name'] ?? '',
      interests: List.from(json['interests']),
      photos: List.from(json['photos']),
      price: json['price']?.toInt() ?? 0,
      rating: json['rating']?.toDouble() ?? 0.0,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'about': about,
        'city': city,
        'imgUrl': imgUrl,
        'name': name,
        'interests': interests,
        'photos': photos,
        'price': price,
        'rating': rating,
      };
}
