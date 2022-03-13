import 'package:flutter/material.dart';
import 'package:games_app/memory_game/utils/game_logic.dart';
import 'package:games_app/tic_tac_toe_game/ui/theme/color.dart';
import 'package:games_app/tic_tac_toe_game/utils/game_logic.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  String lastValue = "X";
  bool gameOver = false;
  int turn = 0;
  String result = "";
  List<int> scorebord = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  Game2 game2 = Game2();
  @override
  void initState() {
    super.initState();
    game2.board = Game2.initGameBoard();
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Maincolor.x,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "It is ${lastValue} turn".toUpperCase(),
            style: const TextStyle(
                fontSize: 55.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(
            height: 20.0,
          ),
          SizedBox(
            width: boardWidth,
            height: boardWidth,
            child: GridView.count(
              crossAxisCount: Game2.boardlenth ~/ 3,
              padding: EdgeInsets.all(16.0),
              mainAxisSpacing: 16.0,
              crossAxisSpacing: 16.0,
              children: List.generate(Game2.boardlenth, (index) {
                return InkWell(
                  onTap: gameOver
                      ? null
                      : () {
                          if (game2.board![index] == "") {
                            setState(() {
                              game2.board![index] = lastValue;
                              turn++;
                              gameOver = game2.winnerCheck(
                                  lastValue, index, scorebord, 3);
                              if (gameOver) {
                                result = "$lastValue is the Winner (* _ -)";
                              } else if (!gameOver && turn == 9) {
                                result = " It's Draw (- _ -)";
                                gameOver=true;
                              }
                              if (lastValue == "X")
                                lastValue = "O";
                              else
                                lastValue = "X";
                            });
                          }
                        },
                  child: Container(
                    width: Game2.blocSize,
                    height: Game2.blocSize,
                    decoration: BoxDecoration(
                      color: Maincolor.y,
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    child: Center(
                      child: Text(
                        game2.board![index],
                        style: TextStyle(
                            color: game2.board![index] == "X"
                                ? Colors.blue
                                : Colors.pink,
                            fontSize: 64.0),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
          const SizedBox(
            height: 25.0,
          ),
          Text(
            result,
            style: const TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.bold,
                color: Colors.white),
          ),
          const SizedBox(
            height: 25.0,
          ),
       
          ElevatedButton.icon(
            onPressed: () {
              setState(() {
                game2.board = Game2.initGameBoard();
                lastValue = "X";
                gameOver = false;
                turn = 0;
                result = "";
                scorebord = [0, 0, 0, 0, 0, 0, 0, 0, 0];
              });
            },
            icon: Icon(Icons.replay),
            label: Text("Repeat the Game (: "),
          ),
        ],
      ),
    );
  }
}
