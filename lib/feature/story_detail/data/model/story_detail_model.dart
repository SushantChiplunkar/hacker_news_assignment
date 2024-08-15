class StoryDetailModel {
  String? by;
  int? descendants;
  int? id;
  List<dynamic>? kids;
  int? score;
  int? time;
  String? title;
  String? type;
  String? url;

  StoryDetailModel({
    this.by,
    this.descendants,
    this.id,
    this.kids,
    this.score,
    this.time,
    this.title,
    this.type,
    this.url,
  });

  factory StoryDetailModel.fromJson(Map<String, dynamic> json) {
    return StoryDetailModel(
      by: json['by'] as String?,
      descendants: json['descendants'] as int?,
      id: json['id'] as int?,
      kids: json['kids'] as List<dynamic>?,
      score: json['score'] as int?,
      time: json['time'] as int?,
      title: json['title'] as String?,
      type: json['type'] as String?,
      url: json['url'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'by': by,
        'descendants': descendants,
        'id': id,
        'kids': kids,
        'score': score,
        'time': time,
        'title': title,
        'type': type,
        'url': url,
      };

   @override
  String toString() {
    return 'StoryDetailModel{by: $by, descendants: $descendants, id: $id, kids: $kids, score: $score, time: $time, title: $title, type: $type, url: $url}';
  }
      
}
