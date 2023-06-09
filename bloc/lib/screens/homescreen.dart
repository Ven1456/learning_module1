import 'package:bloc/model/covid_model.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc/covid_data_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState(){
    super.initState();
  }
  @override
  void didChangeDependencies()
  {
    super.didChangeDependencies();
    covidDataBloc.fetchCovidData();
  }
  @override
  void dispose()
  {
    covidDataBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Latest Covid Data Using API"),
      ),
      body: StreamBuilder(
          stream: covidDataBloc.covidDataStream,
          builder: (context,AsyncSnapshot<List<CovidModel>>snapshot) {
            if(snapshot.hasData)
              {
                return ListView.builder(itemBuilder: (context,index)
                {
                  return Card(
                    child:ListTile(
                     title: Text(snapshot.data![index].countryName),
                      trailing: Text(snapshot.data![index].totalConfirmed.toString()),
                    )
                  );
                }
                );
              }
            else if (snapshot.hasError)
            {
              return Text("data Error");

            }
            return  Center(child: CircularProgressIndicator());

          },
      ),
    );
  }
}
