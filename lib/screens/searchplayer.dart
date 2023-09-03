import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/cubits/cubit/player/cubit/getplayer_cubit.dart';

class searchplayer extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    // TODO: implement buildActions
    return [
     IconButton(onPressed: (
         ) {
       query="";

     }, icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    // TODO: implement buildLeading
    return
      IconButton(onPressed: (
          ) {
        Navigator.pop(context);

      }, icon: Icon(Icons.arrow_back_ios));

  }

  @override
  Widget buildResults(BuildContext context) {
    // TODO: implement buildResults
    return Column(
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
                    Row(
                      children: [

                      ],
                    ),
                    SizedBox(height: 10),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.Result.result?.length,
                        itemBuilder: (BuildContext context, int index) {
                          return InkWell(
                            splashColor: Color(0xFF38003C).withOpacity(1),
                            onTap: () {
                              // Navigator.push(
                              //   context,
                              //   MaterialPageRoute(
                              //     builder: (BuildContext context) =>
                              //         PlayerInformation(),
                              //   ),
                              // );
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
                                          onPressed: () {
                                            // Navigator.push(
                                            //   context,
                                            //   MaterialPageRoute(
                                            //     builder:
                                            //         (BuildContext context) =>
                                            //             PlayerInformation(),
                                            //   ),
                                            // );
                                          },
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
                                          "${index }",
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
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    // TODO: implement buildSuggestions
    return Center(child: Text("search"),);
  }

}