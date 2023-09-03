import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetCountriesCubit/get_countries_cubit.dart';
import 'package:sports_app_green_eagles/data/cubits/GetLeaguesCubit/get_leagues_cubit.dart';
import 'package:sports_app_green_eagles/screens/leagues_screen.dart';

class CountriesContainer extends StatelessWidget {
  final int index;
  const CountriesContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCountriesCubit, GetCountriesState>(
      builder: (context, state) {
        try {
          if (state is GetCountriesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GetCountriesSuccess) {
            return InkWell(
              splashColor: const Color(0xFF38003C).withOpacity(.1),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute<void>(
                    builder: (BuildContext context) => const LeaguesScreen(),
                  ),
                );
                final selectedCountryKey =
                    state.response.result[index].countryKey;
                context.read<GetLeaguesCubit>().getLeagues(selectedCountryKey);
              },
              child: Container(
                  margin: const EdgeInsets.all(3),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Image.network(
                        width: MediaQuery.of(context).size.width * 0.16,
                        height: MediaQuery.of(context).size.height * 0.08,
                        state.response.result[index].countryLogo ?? "",
                        errorBuilder: (context, exception, stackTrace) {
                          return const Text("");
                        },
                      ),
                      FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(state.response.result[index].countryName,
                            style: const TextStyle(
                                fontFamily: "SofiaPro",
                                fontSize: 20,
                                color: Color(0xFF38003C),
                                fontWeight: FontWeight.w100)),
                      )
                    ],
                  )),
            );
          } else {
            return const Text("");
          }
        } catch (error) {
          return const Text("");
        }
      },
    );
  }
}
