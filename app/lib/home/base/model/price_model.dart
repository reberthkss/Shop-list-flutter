import 'package:equatable/equatable.dart';

class Price extends Equatable {
  const Price({
    required this.period,
    required this.value,
  });

  final String period;
  final String value;

  factory Price.fromJson(Map<dynamic, dynamic>? json) {
    if (json == null) {
      return defaultValue();
    }

    return Price(period: json['period'] ?? '', value: json['price'] ?? "0");
  }

  static Price defaultValue() {
    return const Price(
      period: '',
      value: "0",
    );
  }

  @override
  List<Object> get props => [
        period,
        value,
      ];
}
