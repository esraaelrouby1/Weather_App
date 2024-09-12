import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/Oops.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 5, 21),
        title: const Text(
          " Weather App",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) {
                    return const SearchView();
                  },
                ),
              );
            },
            icon: const Icon(
              Icons.search,
              color: Color.fromARGB(255, 237, 122, 27),
              size: 29,
            ),
          )
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, State) {
          if (State is WeatherInitialState) {
            return const NoWeatherBody();
          } else if (State is WeatherLoadedState) {
            return WeatherInfoBody(
              weather: State.weatherModel,
            );
          } else {
            return const Oops();
          }
        },
      ),
    );
  }
}
