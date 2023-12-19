import 'package:equatable/equatable.dart';

class MarketListModel extends Equatable {
  const MarketListModel({
    required this.name,
    required this.id,
  });

  final String name;
  final String id;

  factory MarketListModel.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return const MarketListModel(
        id: "",
        name: "",
      );
    }
    return MarketListModel(id: json["id"] ?? "", name: json["name"] ?? "");
  }

  @override
  List<Object> get props => [];
}
