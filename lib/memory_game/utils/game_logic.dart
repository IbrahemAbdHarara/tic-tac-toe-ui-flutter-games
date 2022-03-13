class Game1 {
  final String hiddenCardpath = 'images/wonder.png';
  List<String>? gameImg;
  final List<String> cards_list = [
    "images/image5.png",
    "images/image2.png",
    "images/image3.png",
    "images/image4.png",
    "images/image5.png",
    "images/image2.png",
    "images/image3.png",
    "images/image4.png",
  ];
  List<Map<int, String>> matcheck = [];
  final int cardCount = 8;
  void intiGame() {
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}
