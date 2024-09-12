import 'dart:async';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/widgets/Oops.dart';

class WeatherService {
  final Dio dio;

  WeatherService(this.dio);

  final String baseUrl = 'http://api.weatherapi.com/v1';
  final String apiKey = 'dd4a5599598646c1a3a134006240609';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    Response response =
        await dio.get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

    WeatherModel weatherModel = WeatherModel.fromJson(response.data);
    return weatherModel;
  }

  Future<WeatherModel> getForcast({required cityName}) async {
    try {
      Response response = await dio
          .get('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1');

      WeatherModel weatherModel = WeatherModel.fromJson(response.data);
      return weatherModel;
    } on DioException catch (e) {
      final String errorMessage =
          e.response?.data['error']['message'] ?? const Oops();
      // TODO
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception(const Oops());
    }
  }
}
