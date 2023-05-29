class DetailsModel{
  final String title;
  final String content;

  const DetailsModel({
    required this.title,
    required this.content,

  });

  factory DetailsModel.fromJson(Map<String, dynamic> json){
    return DetailsModel(
        title: (json["articles"][0]["title"]).toString(),
        content: (json["articles"][0]["content"]).toString()
    );
  }
}