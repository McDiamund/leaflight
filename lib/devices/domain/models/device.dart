class Device {
  int id;
  String name;
  String? detail_image;
  int water_level;

  Device({
    required this.id,
    required this.name,
    required this.water_level,
    this.detail_image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'water_level': water_level,
      'detail_image': detail_image
    };
  }

  factory Device.fromJson(Map<String, dynamic> json) {
    return Device(
      id: json['id'],
      name: json['name'],
      water_level: json['water_level'],
      detail_image: json['detail_image']
    );
  }
}