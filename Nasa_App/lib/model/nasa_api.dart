class NasaImage {
  final String title;
  final String description;
  final String imageUrl;
  final String dateCreated;
  final String center;
  final List<String> keywords;

  NasaImage({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.dateCreated,
    required this.center,
    required this.keywords,
  });

  factory NasaImage.fromJson(Map<String, dynamic> json) {
    final data = json['data'][0];

    return NasaImage(
      title: data['title'] ?? 'No Title',
      description: data['description'] ?? 'No Description',
      imageUrl: json['links'] != null && json['links'].isNotEmpty
          ? json['links'][0]['href']
          : '',
      dateCreated: data['date_created'] ?? 'Unknown Date',
      center: data['center'] ?? 'Unknown Center',
      keywords: data['keywords'] != null
          ? List<String>.from(data['keywords'])
          : [],
    );
  }
}
