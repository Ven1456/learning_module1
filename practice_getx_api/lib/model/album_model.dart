class AlbumModel
{
  final int albumId,id;
  final String title,url,thumbnailUrl;

  AlbumModel({


    required this.albumId,
    required this.id,
    required this.title,
    required this.url,
    required this.thumbnailUrl
  }
  );
  factory AlbumModel.fromJson(Map<String,dynamic> json)
  {
    return AlbumModel(
        albumId: json ["albumId"],
        id: json ["id"],
        title: json ["title"],
        url: json ["url"],
        thumbnailUrl: json ["thumbnailUrl"]);
  }


}

