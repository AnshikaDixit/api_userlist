
class SingleUserModel {
   Data? data;
 Support? support;

  SingleUserModel({required this.data, required this.support});

  SingleUserModel.fromJson(Map<String, dynamic> json) {
    data = (json['data'] != null ? Data.fromJson(json['data']) : null)!;
    support =
        (json['support'] != null ? Support.fromJson(json['support']) : null)!;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
   
      data['data'] = this.data!.toJson();
  
      data['support'] = support!.toJson();
    
    return data;
  }
}

class Data {
   int? id;
   String? email;
   String? firstName;
   String? lastName;
   String? avatar;

  Data({required this.id, required this.email,required this.firstName,required this.lastName,required this.avatar});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    email = json['email'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['email'] = email;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['avatar'] = avatar;
    return data;
  }
}

class Support {
   String? url;
   String? text;

  Support({required this.url,required this.text});

  Support.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['url'] = url;
    data['text'] = text;
    return data;
  }
}
