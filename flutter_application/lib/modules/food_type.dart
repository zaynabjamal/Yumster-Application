class FoodTypeModel {
  int id;
  String image;
  String title;
  String time;
  bool bookmark;

  FoodTypeModel({
    required this.id,
    required this.image,
    required this.title,
    required this.time,
    this.bookmark = false,
  });

  void toggleBookmarkRandomly() {
    bookmark = !bookmark;
  }
}
