class NewsModel{
final String source;
final String title;
final String url;
final String time;

const NewsModel({
  required this.source,
  required this.title,
  required this.url,
  required this.time,

});

factory NewsModel.fromJson(Map<String, dynamic> json){
  return NewsModel(
      source: (json["articles"][0]["source"]).toString(),
      title: (json["articles"][0]["title"]).toString(),
      url: (json["articles"][0]["urlToImage"]).toString(),
      time: (json["articles"][0]["publishedAt"]).toString(),
  );
}
}