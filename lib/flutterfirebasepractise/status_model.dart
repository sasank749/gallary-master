class StatusModel{
String docid;
String imageURL;
String title;
String message;
StatusModel({this.title,this.imageURL,this.message,this.docid});
toMap(){
  Map<String,dynamic> map=Map();
  map['docid']=docid;
  map['imageURL']=imageURL;
  map['title']=title;
  map['message']=message;
  return map;
}
}