class Post {
  //You are assuring flutter that you will initialize this in your code before its used.
  late String body;
  late String author;
  int likes = 0;
  bool userLiked = false;

  Post(this.body, this.author);

  void likePost() {
    userLiked = !userLiked;
    if (userLiked) {
      likes += 1;
    } else {
      likes -= 1;
    }
  }
}