class CovidModel
{
  String  countryName;
  int totalConfirmed;

  CovidModel({

    required this.countryName,
    required this.totalConfirmed,

});

  factory CovidModel.fromJSON(Map map)
  {
    return CovidModel(
        countryName: map["Country"],
        totalConfirmed: map["TotalConfirmed"]
    );
  }
}