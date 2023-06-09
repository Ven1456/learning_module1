
import 'package:bloc/model/covid_model.dart';
import 'package:bloc/network_api/covid_api.dart';

class Repository
{
CovidApi covidApiRepo = CovidApi();

Future<List<CovidModel>> getLatestCovidData()
=> covidApiRepo.getLatestCovidData() ;
}