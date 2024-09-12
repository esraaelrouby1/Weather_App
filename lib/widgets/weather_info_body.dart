import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/weather_row.dart';

class WeatherInfoBody extends StatelessWidget {
  const WeatherInfoBody({super.key, required this.weather});
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    WeatherModel weatherModel =
        BlocProvider.of<GetWeatherCubit>(context).weatherModel!;

    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(top: 16, right: 8, left: 8, bottom: 72),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF0A0E21),
              Color(0xFF111328),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Updated at ${weatherModel.date.hour}:${weatherModel.date.minute}',
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white70,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        "https:${weatherModel.image}",
                        width: 130,
                      ),
                      Text(
                        '${weatherModel.temp.toString()}°',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 70,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        weatherModel.weatherCondition,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                      ),
                      const SizedBox(height: 30),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Column(
                    children: [
                      Text(
                        weatherModel.cityName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 42,
                          color: Color.fromARGB(255, 237, 122, 27),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.black38,
                  borderRadius: BorderRadius.all(Radius.circular(62)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'Forecast',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 32),
                      Expanded(
                        child: ListView(
                          children: [
                            WeatherRow(
                              name: 'Max     ',
                              icon: Icons.thermostat,
                              value: '${weatherModel.maxTemp.round()}°',
                            ),
                            WeatherRow(
                              name: 'Min     ',
                              icon: Icons.ac_unit,
                              value: '${weatherModel.minTemp.round()}°',
                            ),
                            WeatherRow(
                              name: 'Humidity',
                              icon: Icons.water_drop,
                              value: '${weatherModel.humidity} %',
                            ),
                            WeatherRow(
                              name: 'wind           ',
                              icon: Icons.air,
                              value: '${weatherModel.windSpeed} kph',
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
