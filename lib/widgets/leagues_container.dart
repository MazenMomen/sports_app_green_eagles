import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sports_app_green_eagles/data/cubits/GetLeaguesCubit/get_leagues_cubit.dart';

class LeaguesContainer extends StatelessWidget {
  final int index;
  const LeaguesContainer({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetLeaguesCubit, GetLeaguesState>(
      builder: (context, state) {
        try {
          if (state is GetLeaguesLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is GetLeaguesSuccess) {
            return Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: const DecorationImage(
                      image: AssetImage("assets/images/bg.jpg"),
                      fit: BoxFit.fill)),
              child: StaggeredGrid.count(
                crossAxisCount: 8,
                mainAxisSpacing: 4,
                crossAxisSpacing: 4,
                children: [
                  StaggeredGridTile.count(
                    crossAxisCellCount: 4,
                    mainAxisCellCount: 3,
                    child: Image.network(
                      state.response.result[index].leagueLogo ?? "",
                      errorBuilder: (context, exception, stackTrace) {
                        return const Text("");
                      },
                    ),
                  ),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 4,
                      mainAxisCellCount: 2,
                      child: FittedBox(
                        fit: BoxFit.scaleDown,
                        child: Text(
                          state.response.result[index].leagueName,
                          style: const TextStyle(
                              fontFamily: "SofiaPro",
                              fontSize: 28,
                              color: Color(0xFF38003C),
                              fontWeight: FontWeight.w900),
                        ),
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 1,
                      mainAxisCellCount: 1,
                      child: Image.network(
                        state.response.result[index].countryLogo ?? "",
                        errorBuilder: (context, exception, stackTrace) {
                          return const Text("");
                        },
                      )),
                  StaggeredGridTile.count(
                      crossAxisCellCount: 3,
                      mainAxisCellCount: 1,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Text(
                            state.response.result[index].countryName,
                            style: const TextStyle(
                                fontFamily: "SofiaPro",
                                fontSize: 28,
                                color: Color(0xFF38003C),
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      )),
                  StaggeredGridTile.count(
                    crossAxisCellCount: 8,
                    mainAxisCellCount: 1.2,
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: ElevatedButton(
                          style: ButtonStyle(
                            shape: MaterialStateProperty.all<
                                RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8.0),
                              ),
                            ),
                            overlayColor:
                                MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.pressed)) {
                                  return const Color(0xFF38003C)
                                      .withOpacity(.1);
                                }
                                return const Color(0xFF38003C).withOpacity(.1);
                              },
                            ),
                          ),
                          onPressed: () {},
                          child: const Row(
                            children: [
                              Spacer(),
                              Text(
                                "View Teams",
                                style: TextStyle(
                                    fontFamily: "SofiaPro",
                                    fontSize: 18,
                                    color: Color(0xFF38003C),
                                    fontWeight: FontWeight.w100),
                              ),
                              Spacer(),
                              Icon(
                                Icons.arrow_forward,
                                color: Color(0xFF38003C),
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
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
