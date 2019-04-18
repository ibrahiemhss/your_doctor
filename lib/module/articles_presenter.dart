import 'package:your_doctor/data/articles/articles_data.dart';
import 'package:your_doctor/util/dependency_injection.dart';

abstract class ArticlesContract {
  void onLoadArticlesCompleted(List<Articles> items);

  void onLoadArticlesError();
}

class ArticlesPresenter {
  ArticlesContract _view;
  ArticlesRepository _repository;

  ArticlesPresenter(this._view) {
    _repository = new Injector().articlesRepository;
  }

  void loadArticles() {
    _repository
        .fetchArticles()
        .then((c) => _view.onLoadArticlesCompleted(c))
        .catchError((onError) => _view.onLoadArticlesError());
  }
}
