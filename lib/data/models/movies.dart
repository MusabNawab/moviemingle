class Movies {
  final int id;
  final String name;
  final String? mediumImg;
  final String? originalImg;
  final String tvmazeUrl;
  final String languages;
  final List<String> genres;
  final String status;
  final DateTime? premiered;
  final DateTime? ended;
  final double? rating;
  final String summary;
  final Map<String, dynamic> schedule;
  final double score;

  Movies({
    required this.id,
    required this.name,
    required this.mediumImg,
    required this.originalImg,
    required this.tvmazeUrl,
    required this.languages,
    required this.genres,
    required this.status,
    required this.premiered,
    required this.ended,
    required this.rating,
    required this.summary,
    required this.schedule,
    required this.score,
  });

  factory Movies.fromJson(Map<String, dynamic> map) {
    final Map<String, dynamic> show = map["show"];
    return Movies(
        id: show["id"],
        name: show["name"],
        mediumImg: show["image"] == null ? null : show["image"]["medium"],
        originalImg: show["image"] == null ? null : show["image"]["original"],
        tvmazeUrl: show["url"],
        languages: show["language"],
        genres: List.from(show["genres"].map((e) => e.toString())),
        status: show["status"],
        premiered: parser(show["premiered"]),
        ended: parser(show["ended"]),
        rating: show["rating"]["average"] == null
            ? null
            : show["rating"]["average"].toDouble(),
        summary: show["summary"],
        schedule: show["schedule"],
        score: map["score"] * 100);
  }

  static DateTime? parser(String? formattedDate) {
    if (formattedDate != null) {
      return DateTime.parse(formattedDate);
    }
    return null;
  }

  @override
  String toString() {
    return 'Movies(id: $id, name: $name, mediumImg: $mediumImg, originalImg: $originalImg, tvmazeUrl: $tvmazeUrl, languages: $languages, genres: $genres, status: $status, premiered: $premiered, ended: $ended, rating: $rating, summary: $summary, schedule: $schedule, score: $score)';
  }
}
