import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 2, 5, 21),
        title: const Text(
          "Search City",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
      ),
      body: Container(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Center(
            child: TextField(
              style: const TextStyle(
                color: Colors.white,
                fontSize: 22,
              ),
              onSubmitted: (value) async {
                var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
                getWeatherCubit.getWeather(cityName: value);
                Navigator.pop(context);
              },
              decoration: const InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 237, 122, 27),
                  ),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color.fromARGB(255, 237, 122, 27),
                  ),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                hintText: "Enter City Name",
                hintStyle: TextStyle(
                  color: Colors.white60,
                ),
                labelText: "Search",
                labelStyle: TextStyle(color: Colors.white),
                suffix: Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                border: OutlineInputBorder(),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
