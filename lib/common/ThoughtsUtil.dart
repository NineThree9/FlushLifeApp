import 'package:health/routes/selfAssessment/Thought.dart';

class ThoughtsUtil {
  static List<Thought> _thoughts = [];

  ThoughtsUtil._() {
    getThoughts();
  }

  static ThoughtsUtil _instance;

  static ThoughtsUtil getInstance() {
    if (_instance == null) {
      _instance = ThoughtsUtil._();
    }
    return _instance;
  }

  Future<List<Thought>> getThoughts() async {
    if (_thoughts.length == 0) {
      _thoughts.add(Thought(id: 1, thoughtAdj: "平和", thoughtNoun: "balanced"));
      _thoughts.add(Thought(id: 2, thoughtAdj: "冷静", thoughtNoun: "calm"));
      _thoughts.add(Thought(id: 3, thoughtAdj: "放松", thoughtNoun: "relaxed"));
      _thoughts.add(Thought(id: 4, thoughtAdj: "鼓舞", thoughtNoun: "encouraged"));
      _thoughts.add(Thought(id: 5, thoughtAdj: "开心", thoughtNoun: "happy"));
      _thoughts.add(Thought(id: 6, thoughtAdj: "满足", thoughtNoun: "satisfied"));
      _thoughts.add(Thought(id: 7, thoughtAdj: "感激", thoughtNoun: "grateful"));
      _thoughts.add(Thought(id: 8, thoughtAdj: "兴奋", thoughtNoun: "excited"));

      _thoughts.add(Thought(id: 9, thoughtAdj: "焦虑", thoughtNoun:"anxiety"));
      _thoughts.add(Thought(id: 10, thoughtAdj: "孤独", thoughtNoun:"loneliness"));
      _thoughts.add(Thought(id: 11, thoughtAdj: "失望", thoughtNoun:"depression"));
      _thoughts.add(Thought(id: 12, thoughtAdj: "疲惫", thoughtNoun:"exhaustion"));
      _thoughts.add(Thought(id: 13, thoughtAdj: "无助", thoughtNoun:"helplessness"));
      _thoughts.add(Thought(id: 14, thoughtAdj: "沮丧", thoughtNoun:"frustration"));
      _thoughts.add(Thought(id: 15, thoughtAdj: "无聊", thoughtNoun:"bore"));
      _thoughts.add(Thought(id: 16, thoughtAdj: "害怕", thoughtNoun:"fear"));
    }
    return _thoughts;
  }

  Future<List<Thought>> getGoodThoughts() async {
    var list = await getThoughts();
    return list.sublist(0, 8);
  }

  Future<List<Thought>> getBadThoughts() async {
    var list = await getThoughts();
    return list.sublist(8);
  }

  Thought getThoughtById(int id) {
    getThoughts();
    for (Thought thought in _thoughts) {
      if (thought.id == id) {
        return thought;
      }
    }
    return _thoughts[0];
  }
}
