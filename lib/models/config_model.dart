import 'dart:convert';

class ConfigModel {
    final int? id;
    final DateTime? createdAt;
    final String? calculationFlag;
    final dynamic banList;
    final String? tipTitle;
    final String? tipSubTitle;
    final String? tipMediumTitle;
    final String? tipSmallTitle;
    final String? tipList;

    ConfigModel({
        this.id,
        this.createdAt,
        this.calculationFlag,
        this.banList,
        this.tipTitle,
        this.tipSubTitle,
        this.tipMediumTitle,
        this.tipSmallTitle,
        this.tipList,
    });

    factory ConfigModel.fromJson(String str) => ConfigModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory ConfigModel.fromMap(Map<String, dynamic> json) => ConfigModel(
        id: json["id"],
        createdAt: json["created_at"] == null ? null : DateTime.parse(json["created_at"]),
        calculationFlag: json["calculationFlag"],
        banList: json["banList"],
        tipTitle: json["tipTitle"],
        tipSubTitle: json["tipSubTitle"],
        tipMediumTitle: json["tipMediumTitle"],
        tipSmallTitle: json["tipSmallTitle"],
        tipList: json["tipList"],
    );

    Map<String, dynamic> toMap() => {
        "calculationFlag": calculationFlag,
        "banList": banList,
        "tipTitle": tipTitle,
        "tipSubTitle": tipSubTitle,
        "tipMediumTitle": tipMediumTitle,
        "tipSmallTitle": tipSmallTitle,
        "tipList": tipList,
    };
}
