class HomeCardModel {
  String description;
  String like;
  String comment;
  String share;
  String imagePath;

  HomeCardModel({
    required this.description,
    required this.like,
    required this.comment,
    required this.share,
    required this.imagePath
  });

  HomeCardModel.fromMap(Map<String,dynamic> map)
      :description = map['description'],
       like = map['like'],
       comment = map['comment'],
       share = map['share'],
       imagePath = map['imagePath'];
}

abstract class MemeReposiry{
  Future<List<HomeCardModel>> fetchMemes();
}

class FetchDataException implements Exception{
  final _message;

  FetchDataException([this._message]);

  String toString(){
    if(_message == null) return "Exception";
    return "Exception $_message";
  }
}