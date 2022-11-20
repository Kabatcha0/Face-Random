class FaceModle {
  late int age;
  late String gender;
  late String image;
  FaceModle.fromJson(Map<String, dynamic> json) {
    age = json["age"];
    gender = json["gender"];
    image = json["image_url"];
  }
}
