class User {
  int user_id;
  String first_name, last_name, email, api_token;

  User( this.first_name, this.last_name, this.email,
      [this.api_token,this.user_id]);
  User.fromJson(Map<String,dynamic>jsonObject){
    this.user_id=jsonObject['user_id'];
    this.first_name=jsonObject['first_name'];
    this.last_name=jsonObject['last_name'];
    this.email=jsonObject['email'];
    this.api_token=jsonObject['api_token'];
  }


}
