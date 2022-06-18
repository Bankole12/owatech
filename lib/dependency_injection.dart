import 'package:owatech_test/model/home_card_model.dart';
import 'package:owatech_test/model/meme_fetch.dart';
import 'package:owatech_test/model/meme_mock.dart';

enum Flavor {MOCK,ACTUAL}

class Injector{
  static final Injector _singleton = Injector._internal();
  static Flavor _flavor = Flavor.MOCK;
  static void configure(Flavor flavor){
    _flavor = flavor;
  }

  factory Injector(){
    return _singleton;
  }

  Injector._internal();

  MemeReposiry get memeRepository{
    switch(_flavor){
      case Flavor.MOCK: return MockMemeData();
      default: return FetchActualData();
    }
  }
}