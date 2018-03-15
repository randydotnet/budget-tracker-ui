import 'package:budget_tracker/category/CategoryViewContract.dart';
import 'package:budget_tracker/category/CategoryRepository.dart';
import 'package:budget_tracker/common/di/injection.dart';

class CategoryPresenter {
  CategoryViewContract _view;
  CategoryRepository _repository;

  CategoryPresenter(this._view) {
    _repository = new Injector().categoryRepository;
  }

  void loadTransactions() {
    assert(_view != null);

    _repository
        .retrieveTransactionCategories()
        .then((categories) => _view.showCategoriesList(categories))
        .catchError((onError) {
      print(onError);
      _view.showError();
    });
  }
}
