class DataModelJson{
  //data Type
  int? id;
  String? name;
  String? email;
  String? website;
// constructor
  DataModelJson(
      {
       this.id,
      this.name,
      this.email,
      this.website
      }
   );
  //method that assign values to respective datatype vairables
  DataModelJson.fromJson(Map<String,dynamic> json)
  {
    id = json['id'];
    name =json['name'];
    email = json['email'];
    website = json['website'];
  
  }
}