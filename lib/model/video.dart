class Video {
  String id = "";
  String titulo = "";
  String descricao = "";
  String thumbnail = "";
  String canal = "";

  Video(this.id, this.titulo, this.descricao, this.thumbnail, this.canal);

  /*construtor do map json
  Video.fromJson(Map<String,dynamic> json) :
        id = json["id"]?["videoId"] ?? "",
        titulo = json["snippet"]?["title"] ?? "",
        descricao = json["snippet"]?["description"] ?? "",
        thumbnail = json["snippet"]?["thumbnails"]?["high"]?["url"] ?? "",
        canal = json["snippet"]?["chanelId"] ?? "";
   */

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
        json["id"]?["videoId"] ?? "",
        json["snippet"]?["title"] ?? "",
        json["snippet"]?["description"] ?? "",
        json["snippet"]?["thumbnails"]?["high"]?["url"] ?? "",
        json["snippet"]?["chanelId"] ?? "");
  }
}
