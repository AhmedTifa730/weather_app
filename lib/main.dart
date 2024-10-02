import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather/views/home_view.dart';

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
  switch (condition) {
    case 'Sunny':
      return Colors.orange;

    case 'Partly cloudy':
    case 'Cloudy':
    case 'Overcast':
      return Colors.grey;

    case 'Mist':
    case 'Fog':
      return Colors.teal;

    case 'Patchy rain possible':
    case 'Patchy light drizzle':
    case 'Light drizzle':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Light rain shower':
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Light snow showers':
      return Colors.lightBlue;

    case 'Moderate rain at times':
    case 'Moderate rain':
    case 'Heavy rain at times':
    case 'Heavy rain':
    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
      return Colors.blue;

    case 'Moderate snow':
    case 'Moderate or heavy snow showers':
    case 'Patchy moderate snow':
    case 'Patchy heavy snow':
    case 'Heavy snow':
      return Colors.lightBlue;

    case 'Patchy sleet possible':
    case 'Light sleet':
    case 'Light sleet showers':
      return Colors.cyan;

    case 'Moderate or heavy sleet':
    case 'Moderate or heavy sleet showers':
      return Colors.lightBlue;

    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Blizzard':
    case 'Blowing snow':
      return Colors.grey;

    case 'Ice pellets':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
      return Colors.blueGrey;

    case 'Freezing fog':
    case 'Patchy freezing drizzle possible':
    case 'Freezing drizzle':
    case 'Heavy freezing drizzle':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
      return Colors.lightBlue;

    default:
      return Colors.blue;
  }
}
