


class DataModelJson {
   int? id;
   String ?name;
   String ?email;
    String ? error;


  DataModelJson({ this.id,  this.name,  this.email});

DataModelJson.withError(String errorMessage) {
    error = errorMessage;
  }
  factory DataModelJson.fromJson(Map<String, dynamic> json) {
    return DataModelJson(
      id: json['id'],
      name: json['name'],
      email: json['email'],
    );
  }
}