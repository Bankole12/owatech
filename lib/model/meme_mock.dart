import 'package:owatech_test/model/home_card_model.dart';

class MockMemeData implements MemeReposiry{
  @override
  Future<List<HomeCardModel>> fetchMemes() {
    return Future.value(data);
  }
}

var data = <HomeCardModel>[
  HomeCardModel(
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus arcu enim urna et. Tellus cursus volutpat.',
    like: '52',
    comment: '17',
    share: '3',
    imagePath: 'assets/images/Rectangle45.png'
  ),
  HomeCardModel(
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus arcu enim urna et. Tellus cursus volutpat.',
      like: '52',
      comment: '17',
      share: '3',
      imagePath: 'assets/images/Donald.png'
  ),
  HomeCardModel(
      description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tellus arcu enim urna et. Tellus cursus volutpat.',
      like: '52',
      comment: '17',
      share: '3',
      imagePath: 'assets/images/Lady.png'
  ),
];