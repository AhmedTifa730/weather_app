import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubits/get_weather_cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search for a city'),
        backgroundColor: const Color.fromARGB(255, 129, 195, 228),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              labelText: 'Search',
              hintText: 'Enter City Name',
              suffixIcon: const Icon(Icons.search),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 32,
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: const BorderSide(
                  color: Colors.purpleAccent,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
