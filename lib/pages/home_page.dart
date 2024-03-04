import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_cubit/cubits/weathers/weather_cubit.dart';
import 'package:open_weather_cubit/pages/search_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? _city;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Weather'),
        actions: [
          IconButton(
              onPressed: () async {
                _city = await Navigator.push(context,
                    MaterialPageRoute(builder: (context) {
                  return const SearchPage();
                }));

                debugPrint('city: $_city');
                if (_city != null) {
                  context.read<WeatherCubit>().fetchWeather(_city!);
                }
              },
              icon: const Icon(Icons.search))
        ],
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}
