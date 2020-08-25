
class Message {


Message({
    this.action,
    this.userMessage,
    this.technicalMessage,
  });


String userMessage;
bool action;
String technicalMessage;


  Map<String, dynamic> toMap() {
    return {
      'action': action,
      'userMessage': userMessage,
      'technicalMessage': technicalMessage,
    };
  }


 
}
