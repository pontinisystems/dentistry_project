

class Message {
  final String title;
  final String description;
   bool update=false;

  Message({this.title, this.description, this.update});

  


  Message copyWith({
    String title,
    String description,
    bool update,
  }) {
    return Message(
      title: title ?? this.title,
      description: description ?? this.description,
      update: this.update ==null ? true :!this.update,
    );
  }
}
