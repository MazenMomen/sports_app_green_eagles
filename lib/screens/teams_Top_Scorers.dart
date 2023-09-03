import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports_app_green_eagles/data/cubits/GetTeamsCubit/get_teams_cubit.dart';
// import 'package:sports_app/Data/Models/get_teams.dart';
// import 'package:sports_app/Data/Repository/get_teams_repo.dart';

class TeamsTopScorersScreen extends StatefulWidget {
  const TeamsTopScorersScreen({super.key});

  @override
  State<TeamsTopScorersScreen> createState() => _TeamsTopScorersScreenState();
}

class _TeamsTopScorersScreenState extends State<TeamsTopScorersScreen> {
  @override
  void initState() {
    // TODO: implement initState
    context.read<GetTeamsCubit>().getTeams();
  }

  //
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {},
          color: Colors.white,
        ),
        elevation: 0,
        backgroundColor: const Color(0xFF38003C),
        title: BlocBuilder<GetTeamsCubit, GetTeamsState>(
          builder: (context, state) {
            if (state is GetTeamsSuccess) {
              return const Text(
                "League Teams",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'SofiaProBold',
                  color: Color(0xFFFFFFFF),
                ),
              );
            } else if (state is GetTeamsLoading) {
              return const Text('');
            } else if (state is GetTopSuccess) {
              return const Text(
                "Top Scorers",
                style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'SofiaProBold',
                  color: Color(0xFFFFFFFF),
                ),
              );
            } else if (state is GetTopLoading) {
              return const Text('');
            } else {
              return const Text('Error');
            }
          },
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                "2023 - 2024",
                style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'SofiaProBold',
                    color: Color(0xFFFFFFFF)),
              ),
            ),
          ),
        ],
      ),
      ///////////////////// End Of The App Bar ////////////////////

      body: ListView(
        children: [
          const SizedBox(
            height: 10,
          ),
          BlocBuilder<GetTeamsCubit, GetTeamsState>(
            builder: (context, state) {
              if (state is GetTeamsLoading || state is GetTeamsSuccess) {
                return Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    //   child: TextField(
                    //     style: const TextStyle(
                    //         color: Color(0xFF38003C),
                    //         fontFamily: 'SofiaProBold',
                    //         fontSize: 16),
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.only(top: 8, bottom: 8),
                    //       filled: true,
                    //       fillColor: Colors.grey.withOpacity(0.5),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       hintText: 'Search',
                    //       hintStyle: const TextStyle(color: Color(0xFF38003C)),
                    //       prefixIcon: const Icon(Icons.search),
                    //       prefixIconColor: const Color(0xFF38003C),
                    //     ),
                    //   ),
                    // ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // const Padding(
                          //   padding: EdgeInsets.only(right: 5),
                          //   child: SearchWidget(),
                          // ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<GetTeamsCubit>().getTeams();
                            },
                            child: const Text(
                              'League Teams',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 18,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              backgroundColor: const Color(0xFF38003C),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(right: 5, left: 5),
                            child: Text(
                              "|",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'SofiaProBold',
                                color: Color(0xFF38003C),
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              context.read<GetTeamsCubit>().getTop();
                            },
                            child: const Text(
                              'Top Scorers',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 18,
                                color: const Color(0xFF38003C),
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              } else if (state is GetTopLoading || state is GetTopSuccess) {
                return Column(
                  children: [
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 20.0, left: 20.0),
                    //   child: TextField(
                    //     style: const TextStyle(
                    //         color: Color(0xFF38003C),
                    //         fontFamily: 'SofiaProBold',
                    //         fontSize: 16),
                    //     decoration: InputDecoration(
                    //       contentPadding:
                    //           const EdgeInsets.only(top: 8, bottom: 8),
                    //       filled: true,
                    //       fillColor: Colors.grey.withOpacity(0.5),
                    //       border: OutlineInputBorder(
                    //         borderRadius: BorderRadius.circular(20.0),
                    //         borderSide: BorderSide.none,
                    //       ),
                    //       hintText: 'Search',
                    //       hintStyle: const TextStyle(color: Color(0xFF38003C)),
                    //       prefixIcon: const Icon(Icons.search),
                    //       prefixIconColor: const Color(0xFF38003C),
                    //     ),
                    //   ),
                    // ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () {
                                context.read<GetTeamsCubit>().getTeams();
                              },
                              child: const Text(
                                'League Teams',
                                style: TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 18,
                                    color: const Color(0xFF38003C)),
                              ),
                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                backgroundColor: Colors.white,
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.only(right: 5, left: 5),
                              child: Text(
                                "|",
                                style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'SofiaProBold',
                                  color: Color(0xFF38003C),
                                ),
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {
                                context.read<GetTeamsCubit>().getTop();
                              },
                              child: const Text(
                                'Top Scorers',
                                style: TextStyle(
                                  fontFamily: 'SofiaProBold',
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  backgroundColor: const Color(0xFF38003C)),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              } else {
                return Center(
                  child: Text('error'),
                );
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),

          /////////// End Of Two Buttons ///////////////////////

          BlocBuilder<GetTeamsCubit, GetTeamsState>(
            builder: (context, state) {
              if (state is GetTeamsInitial) {
                return const Center(
                  child: Text("press"),
                );
              } else if (state is GetTeamsLoading) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFF38003C),
                  ),
                );
              } else if (state is GetTeamsSuccess) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Container(
                            padding: const EdgeInsets.all(15),
                            height: MediaQuery.of(context).size.height * 0.2,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                  image: NetworkImage(
                                      'https://images-eu.ssl-images-amazon.com/images/S/pv-target-images/d768e6894200acbdfc471333a12dac643c3ad64cb032fd9ebef78d6639ca5c8d._RI_TTW_SX720_FMjpg_.jpg'),
                                  fit: BoxFit.cover),
                            ),
                            child: Row(
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.01,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.1,
                                  child: const Text(
                                    '1',
                                    style: TextStyle(
                                        fontSize: 40,
                                        fontFamily: 'SofiaProBold',
                                        color: Colors.white),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 15),
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.3,
                                    child: Image.network(
                                      state.response.result[0].teamLogo,
                                      width: 200,
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  child: Text(
                                    state.response.result[0].teamName,
                                    style: const TextStyle(
                                        fontFamily: 'SofiaProBold',
                                        fontSize: 19,
                                        color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      for (int i = 1; i < state.response.result.length; i++)
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.07,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 5,
                                    blurRadius: 7,
                                    offset: const Offset(0, 3),
                                  ),
                                ],
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 18),
                                    child: SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      child: Text(
                                        '${i + 1}',
                                        style: const TextStyle(
                                            fontFamily: 'SofiaProBold',
                                            fontSize: 25,
                                            color: Color(0xFF38003C)),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
                                    child: Image.network(
                                        state.response.result[i].teamLogo),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.05,
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.48,
                                    child: Text(
                                      state.response.result[i].teamName,
                                      style: const TextStyle(
                                          fontFamily: 'SofiaProBold',
                                          fontSize: 20,
                                          color: Color(0xFF38003C)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                );
              } else if (state is GetTopLoading) {
                return const Center(
                    child: CircularProgressIndicator(
                  color: Color(0xFF38003C),
                ));
              } else if (state is GetTopSuccess) {
                return SingleChildScrollView(
                    child: Column(
                  children: [
                    // for(int i=0; i<state.response.result.length; i++)
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          image: const DecorationImage(
                              image: AssetImage('assets/images/25.jpg'),
                              fit: BoxFit.cover),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              '1',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 50,
                                color: Colors.white,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.response.result[0].playerName ?? '',
                                  style: const TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 25,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Team Name : ${state.response.result[0].teamName ?? ''}',
                                  style: const TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Goals : ${state.response.result[0].goals ?? ''}',
                                  style: const TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Assests : ${state.response.result[0].assists ?? ''}',
                                  style: const TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.height * 0.01,
                                ),
                                Text(
                                  'Penalty Goals : ${state.response.result[0].penaltyGoals ?? ''}',
                                  style: const TextStyle(
                                    fontFamily: 'SofiaProBold',
                                    fontSize: 15,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10, left: 10),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.03,
                        width: double.infinity,
                        child: Row(
                          children: [
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.68,
                            ),
                            const Text(
                              'G',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 15,
                                color: Color(0xFF38003C),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.04,
                            ),
                            const Text(
                              'ASS',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 15,
                                color: Color(0xFF38003C),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.02,
                            ),
                            const Text(
                              'P.G',
                              style: TextStyle(
                                fontFamily: 'SofiaProBold',
                                fontSize: 15,
                                color: Color(0xFF38003C),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    for (int i = 1; i < state.response.result.length; i++)
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: double.infinity,
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 18),
                                child: SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.09,
                                  child: Text(
                                    '${i + 1}',
                                    style: const TextStyle(
                                        fontFamily: 'SofiaProBold',
                                        fontSize: 25,
                                        color: Color(0xFF38003C)),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.53,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        state.response.result[i].playerName ??
                                            '',
                                        style: const TextStyle(
                                            fontFamily: 'SofiaProBold',
                                            fontSize: 20,
                                            color: Color(0xFF38003C)),
                                      ),
                                    ),
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.01,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Text(
                                        state.response.result[i].teamName ?? '',
                                        style: const TextStyle(
                                            fontFamily: 'SofiaProBold',
                                            fontSize: 20,
                                            color: Color(0xFF04F5FF)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.03,
                              ),
                              Row(
                                children: [
                                  Text(
                                    state.response.result[i].goals == null
                                        ? ' '
                                        : state.response.result[i].goals
                                            .toString(),
                                    style: const TextStyle(
                                        fontFamily: 'SofiaProBold',
                                        fontSize: 15,
                                        color: Color(0xFF17A6E6)),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Text(
                                    state.response.result[i].assists == null
                                        ? ''
                                        : state.response.result[i].assists
                                            .toString(),
                                    style: const TextStyle(
                                        fontFamily: 'SofiaProBold',
                                        fontSize: 15,
                                        color: Color(0xFF17A6E6)),
                                  ),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.06,
                                  ),
                                  Text(
                                    state.response.result[i].penaltyGoals ==
                                            null
                                        ? ' '
                                        : state.response.result[i].penaltyGoals
                                            .toString(),
                                    style: const TextStyle(
                                        fontFamily: 'SofiaProBold',
                                        fontSize: 15,
                                        color: Color(0xFF17A6E6)),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                  ],
                ));
              } else {
                return const Center(
                  child: Text('Error'),
                );
              }
            },
          ),
        ],
      ),

///////////////////////// end of Get Teams //////////////////////////////
    );
  }
}
