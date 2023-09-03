import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sports/screens/search.dart';
import 'package:sports/screens/searchplayer.dart';
import '../data/cubits/cubit/player/cubit/getplayer_cubit.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher.dart';





class Players extends StatefulWidget {
  Players({
    Key? key,
    required this.teamname,
  }) : super(key: key);
  final String teamname;

  @override
  State<Players> createState() => _PlayersState();
}

class _PlayersState extends State<Players> {
  @override
  void initState() {
    super.initState();

    context.read<GetplayerCubit>().getplayer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: searchplayer());
              },
              icon: Icon(Icons.search))
        ],
        backgroundColor: Color(0xFF38003C),
        title: Text(
          widget.teamname,
          style: TextStyle(color: Colors.white, fontFamily: 'Sofia'),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          BlocBuilder<GetplayerCubit, GetplayerState>(
            builder: (context, state) {
              if (state is GetplayerInitial) {
                return Center(child: Text(""));
              } else if (state is loding) {
                return Align(
                    alignment: Alignment.center,
                    child: Center(child: CircularProgressIndicator()));
              } else if (state is getplayerscucces) {
                return Expanded(
                  child: Column(
                    children: [
                      SizedBox(height: 10),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: SearchWidget(),
                      // ),
                      SizedBox(height: 10),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.Result.result?.length,
                          itemBuilder: (BuildContext context, int index) {
                            String? a1 =
                                state.Result.result?[index].playerName ?? " ";
                            String? a2 =
                                state.Result.result?[index].playerNumber ?? " ";
                            String? a3 =
                                state.Result.result?[index].playerCountry ??
                                    " ";
                            String? a4 =
                                state.Result.result?[index].playerImage ?? " ";
                            String? a5 =
                                state.Result.result?[index].playerType ?? " ";
                            String? a6 =
                                state.Result.result?[index].playerAge ?? " ";
                            String? a7 =
                                state.Result.result?[index].playerYellowCards ??
                                    " ";
                            String? a8 =
                                state.Result.result?[index].playerRedCards ??
                                    " ";
                            String? a9 =
                                state.Result.result?[index].playerGoals ?? " ";
                            String? a10 =
                                state.Result.result?[index].playerAssists ??
                                    " ";
                            String? a11 =
                                state.Result.result?[index].teamName ??
                                    " ";

                            return InkWell(
                              splashColor: Color(0xFF38003C).withOpacity(1),
                              onTap: () {
                                _showPlayerDetailsDialog(context, a1, a2, a3,
                                    a4, a5, a6, a7, a8, a9, a10,a11);
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    padding: EdgeInsets.all(0),
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 2,
                                          blurRadius: 5,
                                          offset: Offset(0, 3),
                                        ),
                                      ],
                                    ),
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                      ),
                                      child: Row(
                                        children: [
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.arrow_forward,
                                                color: Colors.black),
                                          ),
                                          SizedBox(width: 20),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state.Result.result?[index]
                                                        .playerName as String ??
                                                    " ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15,
                                                  color: Colors.black,
                                                  fontFamily: 'Sofia',
                                                ),
                                              ),
                                              SizedBox(
                                                height: 8,
                                              ),
                                              Text(
                                                state.Result.result?[index]
                                                        .playerType as String ??
                                                    " ",
                                                style: TextStyle(
                                                  fontWeight: FontWeight.w300,
                                                  fontSize: 17,
                                                  color: Colors.black,
                                                  fontFamily: 'Sofia',
                                                ),
                                              ),
                                            ],
                                          ),
                                          Spacer(),
                                          Image.network(
                                            state.Result.result![index]
                                                    .playerImage ??
                                                "",
                                            errorBuilder:
                                                (context, error, stackTrace) {
                                              return Text("");
                                            },
                                            height: 80,
                                            width: 40,
                                            fit: BoxFit.fill,
                                          ),
                                          SizedBox(width: 15),
                                          Text(
                                            state.Result.result?[index]
                                                    .playerNumber ??
                                                " ",
                                            style: TextStyle(
                                              fontSize: 20,
                                              color: Colors.black,
                                              fontFamily: 'Sofia',
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else {
                return Center(child: Text("error"));
              }
            },
          ),
        ],
      ),
    );
  }
}

void _showPlayerDetailsDialog(
  BuildContext context,
  String playerName,
  String playernumber,
  String playercountry,
  String playerimgae,
  String playerPosition,
  String playerage,
  String playeryellow,
  String playererd,
  String playergoals,
  String playerassists,
    String team,
) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        contentPadding: EdgeInsets.zero,
        buttonPadding: EdgeInsetsDirectional.all(15),
        backgroundColor: Colors.transparent,
        icon: Padding(
          padding: const EdgeInsets.all(5),
          child: CircleAvatar(
              child: IconButton(
                icon: Icon(Icons.share),
                color: Colors.white,
                onPressed: () async => _openWhatsAppWeb(),
              ),
              backgroundColor: Color(0xFF38003C)),
        ),
        iconPadding: EdgeInsets.only(top: 20, bottom: 20),
        iconColor: Colors.white,
        content: SizedBox(
          width: 400, // Set the desired width for the AlertDialog
          child: SingleChildScrollView(
            child: Card(
              elevation: 3,
              shape: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(20)),
                borderSide: BorderSide(
                  color: Color(0xFF38003C),
                  width: 4,
                ),
              ),
              shadowColor: Colors.blueAccent.withOpacity(1),
              child: Padding(
                padding: const EdgeInsets.all(16.0), // Add padding to the card
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Column(
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    playerName,
                                    style: TextStyle(
                                      fontSize: 17,
                                      color: Colors.black,
                                      fontFamily: 'Sofia',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 8,
                              ),
                              Align(
                                alignment: Alignment.center,
                                child: Text(
                                  playernumber,
                                  style: TextStyle(
                                    fontSize: 35,
                                    color: Colors.black,
                                    fontFamily: 'Sofia',
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Image.network(
                            playerimgae,
                            errorBuilder: (context, error, stackTrace) {
                              return Text(
                                "",
                                style: TextStyle(color: Colors.red),
                              );
                            },
                            height: MediaQuery.of(context).size.height * .1,
                            width: MediaQuery.of(context).size.width * .2,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),
                    Divider(
                      height: 30,
                      thickness: 4,
                      color: Color(0xFF38003C),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Player Age:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerage,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Position:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerPosition,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Player Assist : ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playerassists,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "player goals:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playergoals,
                          style: TextStyle(
                            fontSize: 18,
                            color: Color(0xFF38003C),
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "player yellow cards:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playeryellow,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "player Red cards:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playererd,
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "player team:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          team,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Nationality:",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          playercountry,
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Sofia',
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Divider(
                      height: 30,
                      color: Color(0xFF38003C),
                      thickness: 1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  );
}
void _sharePlayerWithWhatsApp(String playerName, String playerClub) async {

    await launch("8554844");

}
void _openWhatsAppWeb() async {
  final String whatsappWebUrl = "https://web.whatsapp.com/";
  try {
    if (await canLaunch(whatsappWebUrl)) {
      await launch(whatsappWebUrl);
    } else {
      print("Could not open WhatsApp web: URL not launchable.");
    }
  } catch (e) {
    print("Error opening WhatsApp web: $e");
  }
}