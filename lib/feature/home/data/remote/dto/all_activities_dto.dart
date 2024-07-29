class AllActivitiesDto {
  AllActivitiesDto({this.events, this.message, this.detail});

  final Map<String, String>? events;
  final String? message;
  final String? detail;

  factory AllActivitiesDto.fromJson(Map<String, dynamic> json) {
    return AllActivitiesDto(
      events: Map<String, String>.from(json),
      message: json['message'] as String?,
      detail: json['detail'] as String?,
    );
  }
}
