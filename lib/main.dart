import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                useMaterial3: false,
                primarySwatch: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherCondition,
                ),
              ),
              debugShowCheckedModeBanner: false,
              home: const HomeView(),
            );
          },
        ),
      ),
    );
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  if (condition == "Sunny" || condition == "Clear") {
    return Colors.orange;
  } else if (condition.contains("cloudy")) {
    return Colors.blueGrey;
  } else if (condition.contains("rain") || condition.contains("drizzle")) {
    return Colors.blue;
  } else if (condition.contains("snow") || condition.contains("sleet")) {
    return Colors.cyan;
  } else if (condition.contains("fog") || condition.contains("Mist")) {
    return Colors.grey;
  } else if (condition.contains("thunder") || condition.contains("Blizzard")) {
    return Colors.purple;
  } else if (condition.contains("freezing")) {
    return Colors.lightBlue;
  } else if (condition.contains("pellets")) {
    return Colors.indigo;
  } else if (condition.contains("Overcast")) {
    return Colors.blueGrey;
  } else {
    return Colors.blueGrey; // Default color for unknown conditions
  }
}
