class Post {
  int id;
  String title;
  String body;
  Post({
    this.id,
    this.title,
    this.body,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'body': body,
    };
  }

  static Post fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Post(
      id: map['id'],
      title: map['title'],
      body: map['body'],
    );
  }

  static List<Post> listFromMap(List<dynamic> dataList) {
    final List<Post> posts = <Post>[];
    final List<Map<String, dynamic>> mapList =
        List<Map<String, dynamic>>.from(dataList);
    if (dataList != null) {
      for (var data in mapList) {
        if (data != null) {
          posts.add(fromMap(data));
        }
      }
    }
    return posts;
  }

  @override
  String toString() => 'Post(id: $id, title: $title, body: $body)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Post && o.id == id && o.title == title && o.body == body;
  }

  @override
  int get hashCode => id.hashCode ^ title.hashCode ^ body.hashCode;
}
