class Post {
  DateTime _dateRead;
  int _id;
  String _postId;
  String _postTitle;
  String _postUrl;
  String _postImageUrl;
  String _postSource;

  //  String postContent;

  Post(this._postId, this._postTitle, this._postImageUrl, this._postUrl,
      this._postSource, this._dateRead);
  String get postTitle => _postTitle;
  int get id => _id;
  String get postId => _postId;
  String get postUrl => _postUrl;
  String get postImageUrl => _postImageUrl;
  String get postSource => _postSource;
  DateTime get dateRead => _dateRead;

  Post.map(dynamic obj) {
    this._dateRead = obj['dateRead'];
    this._postTitle = obj['postTitle'];
    this._postId = obj['postId'];
    this._id = obj['id'];
    this._postUrl = obj['postUrl'];
    this._postImageUrl = obj['postImageUrl'];
    this._postSource = obj['postSource'];
  }

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    map['dateRead'] = _dateRead;
    map['postTitle'] = _postTitle;
    map['postUrl'] = _postUrl;
    map['postImageUrl'] = _postImageUrl;
    map['postSource'] = _postSource;
    map['postId'] = _postId;
    if (id != null) {
      map['id'] = _id;
    }
    return map;
  }

  Post.fromMap(Map<String, dynamic> map) {
    this._dateRead = map['dateRead'];
    this._postTitle = map['postTitle'];
    this._postId = map['postId'];
    this._id = map['id'];
    this._postUrl = map['postUrl'];
    this._postImageUrl = map['postImageUrl'];
    this._postSource = map['postSource'];
  }
}
