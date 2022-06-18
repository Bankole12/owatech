import 'package:owatech_test/dependency_injection.dart';
import 'package:owatech_test/model/home_card_model.dart';

abstract class MemeListViewContract{
  void onLoadMemeComplete(List<HomeCardModel> items);
  void onLoadMemeError();
}

class MemeListPresenter{
  final MemeListViewContract _view;
  MemeReposiry _repository = Injector().memeRepository;

  MemeListPresenter(this._view){
    _repository = Injector().memeRepository;
  }

  void loadMemes(){
    _repository.fetchMemes()
        .then((value) => _view.onLoadMemeComplete(value))
        .onError((error, stackTrace) => _view.onLoadMemeError());
  }
}