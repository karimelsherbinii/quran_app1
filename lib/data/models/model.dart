class Sora {
  late int code;
  late String status;
  late List<Data> data;

  Sora(this.code, this.status, this.data);

  Sora.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      // ignore: deprecated_member_use
      data = <Data>[];
      json['data'].forEach((v) {
        data.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['code'] = code;
    data['status'] = status;
    data['data'] = this.data.map((v) => v.toJson()).toList();
    return data;
  }
}

class Data {
  late int number;
  late String name;
  late String englishName;
  late String englishNameTranslation;
  late int numberOfAyahs;
  late String revelationType;

  Data(this.number, this.name, this.englishName, this.englishNameTranslation,
      this.numberOfAyahs, this.revelationType);

  Data.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['number'] = number;
    data['name'] = name;
    data['englishName'] = englishName;
    data['englishNameTranslation'] = englishNameTranslation;
    data['numberOfAyahs'] = numberOfAyahs;
    data['revelationType'] = revelationType;
    return data;
  }
}















// class Post {
//   late int userId;
//   late int id;
//   late String title;
//   late String body;
//   Post(this.userId, this.id, this.title, this.body);

//   Post.fromJson(Map<String, dynamic> json) {
//     userId = json['userId'];
//     id = json['id'];
//     title = json['title'];
//     body = json['body'];
//   }
// }
