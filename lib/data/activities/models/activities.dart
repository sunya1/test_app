// To parse this JSON data, do
//
//     final activities = activitiesFromJson(jsonString);


List<Activities> activitiesFromJson(dynamic str) =>
    List<Activities>.from(str.map((x) => Activities.fromJson(x)));

class Activities {
  Activities({
    required this.id,
    this.categoryName,
    required this.availableDates,
    required this.nameRu,
    required this.nameKk,
    required this.nameEn,
    required this.imageUrl,
    required this.code,
    required this.enabled,
    required this.dateRequired,
    required this.skiPassRequired,
    this.description,
    this.workingHours,
    required this.tariffs,
    required this.createdDate,
    required this.updatedDate,
  });

  final int id;
  final dynamic categoryName;
  final List<DateTime> availableDates;
  final String nameRu;
  final String nameKk;
  final String nameEn;
  final String imageUrl;
  final String code;
  final bool enabled;
  final bool dateRequired;
  final bool skiPassRequired;
  final dynamic description;
  final dynamic workingHours;
  final List<Tariff> tariffs;
  final DateTime createdDate;
  final DateTime updatedDate;

  factory Activities.fromJson(Map<String, dynamic> json) => Activities(
        id: json["id"],
        categoryName: json["categoryName"],
        availableDates: List<DateTime>.from(
            json["availableDates"].map((x) => DateTime.parse(x))),
        nameRu: json["nameRu"],
        nameKk: json["nameKk"],
        nameEn: json["nameEn"],
        imageUrl: json["imageUrl"],
        code: json["code"],
        enabled: json["enabled"],
        dateRequired: json["dateRequired"],
        skiPassRequired: json["skiPassRequired"],
        description: json["description"],
        workingHours: json["workingHours"],
        tariffs:
            List<Tariff>.from(json["tariffs"].map((x) => Tariff.fromJson(x))),
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
      );
}

class Tariff {
  Tariff({
    required this.id,
    required this.nameRu,
    required this.nameKk,
    required this.nameEn,
    required this.code,
    required this.enabled,
    required this.axessMetaTariffId,
    required this.priceInfo,
    required this.createdDate,
    required this.updatedDate,
  });

  final int id;
  final String nameRu;
  final String nameKk;
  final String nameEn;
  final String code;
  final bool enabled;
  final int axessMetaTariffId;
  final PriceInfo priceInfo;
  final DateTime createdDate;
  final DateTime updatedDate;

  factory Tariff.fromJson(Map<String, dynamic> json) => Tariff(
        id: json["id"],
        nameRu: json["nameRu"],
        nameKk: json["nameKk"],
        nameEn: json["nameEn"],
        code: json["code"],
        enabled: json["enabled"],
        axessMetaTariffId: json["axessMetaTariffId"],
        priceInfo: PriceInfo.fromJson(json["priceInfo"]),
        createdDate: DateTime.parse(json["createdDate"]),
        updatedDate: DateTime.parse(json["updatedDate"]),
      );
}

class PriceInfo {
  PriceInfo({
    required this.enabled,
    required this.price,
    this.currency,
    required this.hasPickupBox,
    required this.pickupBoxPrice,
    required this.date,
  });

  final bool enabled;
  final double price;
  final Currency? currency;
  final bool hasPickupBox;
  final dynamic pickupBoxPrice;
  final DateTime date;

  factory PriceInfo.fromJson(Map<String, dynamic> json) => PriceInfo(
        enabled: json["enabled"],
        price: json["price"],
        currency: currencyValues.map[json["currency"]],
        hasPickupBox: json["hasPickupBox"],
        pickupBoxPrice: json["pickupBoxPrice"],
        date: DateTime.parse(json["date"]),
      );
}

enum Currency { KZT }

final currencyValues = EnumValues({"KZT": Currency.KZT});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
