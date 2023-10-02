import 'dart:core';

class PlantData {
  final String name;
  final String category;
  final String plantingDate;
  final String location;
  final String image;
  final List<GrowthStage> growthStages;

  PlantData(this.name, this.category, this.plantingDate, this.location,
      this.image, this.growthStages);

  factory PlantData.fromJson(Map<String, dynamic> json) {
    final List<dynamic>? growthStagesJson = json['growthStages'];
    final List<GrowthStage> growthStages =growthStagesJson != null?
        growthStagesJson.map((stage) => GrowthStage.fromJson(stage)).toList():[];

    return PlantData(
      json['name'] ?? '',
      json['category'] ?? '',
      json['plantingDate'] ?? '',
      json['location'] ?? '',
      json['image'] ?? '',
      growthStages,
    );
  }
}

class GrowthStage {
  final String stage;
  final String description;
  final String date;
  final List<String> images;

  GrowthStage(this.stage, this.description, this.date, this.images);

  factory GrowthStage.fromJson(Map<String, dynamic> json) {
    final List<dynamic> imagesJson = json['images'];
    final List<String> images = imagesJson != null
        ? List<String>.from(imagesJson.map((image) => image.toString()))
        : [];
    return GrowthStage(
      json['stage'] ?? '',
      json['description'] ?? '',
      json['date'] ?? '',
      images,
    );
  }
}
