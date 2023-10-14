import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {

  Weather? weather;
  final openWeather = WeatherFactory('0abd81c5cbbd94ba0a8008e5420f03f1');
  String cityName = '';

  getWeather() async{
    try{
      weather = await openWeather.currentWeatherByCityName(cityName);
      setState(() {});
    }
    catch(e){
      print("THE ERROR : $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        elevation: 0,
        title: Text('Search by City name', style: TextStyle(fontSize: 25),),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.all(22.0),
            child: TextField(
              onChanged: (value){
                setState(() {
                  cityName = value;
                });
              },
              decoration: InputDecoration(
                hintText: 'Seach by city',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                suffixIcon: IconButton(
                  onPressed: (){
                    getWeather();
                  },
                  icon: Icon(Icons.search),
                  color: Colors.green,
                ),
              ),
            ),
          ),
          Expanded(
              child: weather !=null? Column(
                mainAxisAlignment: MainAxisAlignment.center,
            children:[
              Text('${weather!.temperature!.celsius!.round()} °C', style: TextStyle(
                  fontSize: 35),
              ),
              Text('${weather!.weatherDescription}', style: TextStyle(
                  fontSize: 20),)
            ],
          ):const SizedBox(),
          ),
        ],
      ),
    );
  }
}
