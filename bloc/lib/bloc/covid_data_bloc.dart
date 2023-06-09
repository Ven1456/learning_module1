import 'package:bloc/model/covid_model.dart';
import 'package:bloc/repository/covid_repository.dart';
import 'package:rxdart/rxdart.dart';

class CovidDataBloc
{
  final _repository = Repository();
  final _covidDataFetcher = PublishSubject<List<CovidModel>>();

  Stream<List<CovidModel>> get covidDataStream => _covidDataFetcher.stream;

  fetchCovidData() async
  {
    List<CovidModel> data = await _repository.getLatestCovidData();
    _covidDataFetcher.sink.add(data);
  }

  dispose()
  {
    _covidDataFetcher.close();
  }

}

final covidDataBloc = CovidDataBloc();
