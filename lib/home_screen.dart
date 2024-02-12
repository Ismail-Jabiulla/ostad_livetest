import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'json.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<dynamic> weatherData = jsonDecode(jsonWeather);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather Info App'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        itemCount: weatherData.length,
        itemBuilder: (context, index) {
          Map<String, dynamic> cityWeather = weatherData[index];
          return weatherWidget(cityWeather);
        },
      ),
    );
  }

  Widget weatherWidget(Map<String, dynamic> cityWeather) {
    return Card(
      margin: EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Text('City: ${cityWeather['city']}', style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),),
          ),
          _weatherDetail('Temperature', '${cityWeather['temperature']}°C'),
          _weatherDetail('Condition', '${cityWeather['condition']}'),
          _weatherDetail('Humidity', '${cityWeather['humidity']}%'),
          _weatherDetail('Wind Speed', '${cityWeather['windSpeed']} km/h'),
        ],
      ),
    );
  }

  Widget _weatherDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Text(
        '$title: $value',
        style: const TextStyle(fontSize: 16.0),
      ),
    );
  }
}

