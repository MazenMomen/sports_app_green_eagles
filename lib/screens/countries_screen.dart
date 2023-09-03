import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/widgets/countries_container.dart';
import 'package:sports_app_green_eagles/widgets/top_bar.dart';

class CountriesScreen extends StatelessWidget {
  const CountriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TopBar(index: 0),
      body: BlocBuilder<GetCountriesCubit, GetCountriesState>(
        builder: (context, state) {
          try {
            if (state is GetCountriesLoading) {
              return const Center(child: CircularProgressIndicator.adaptive());
            } else if (state is GetCountriesSuccess) {
              return Padding(
                padding: const EdgeInsets.all(3),
                child: GridView.builder(
                  itemCount: state.response.result.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 4),
                  itemBuilder: (context, index) {
                    return CountriesContainer(index: index);
                  },
                ),
              );
            } else {
              return const Center(child: Text(""));
            }
          } catch (error) {
            return const Center(child: Text(""));
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<GetCountriesCubit>().getCountries();
        },
      ),
    );
  }
}
