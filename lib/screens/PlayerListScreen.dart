// import 'package:flutter/material.dart';
// import 'package:sports/screens/player.dart';
// import 'package:sports/screens/search.dart';
// import '../data/models/api.dart';
// import '../data/repo/getplayers-repo.dart'; // Import your service class
//
// class PlayerListScreen extends StatefulWidget {
//   @override
//   _PlayerListScreenState createState() => _PlayerListScreenState();
// }
//
// class _PlayerListScreenState extends State<PlayerListScreen> {
//   final PlayerService playerService = PlayerService(
//     apiKey: '78d1729b6765416f7346de1b1f4ee4e06b81e3286cd1218a202b18ebe0261326',
//     teamId: '90', // Replace with your teamId
//   );
//
//   List<Result> players = [];
//
//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }
//
//   Future<void> fetchData() async {
//     try {
//       final fetchedPlayers = await playerService.fetchPlayers();
//       setState(() {
//         players = fetchedPlayers ?? [];
//       });
//     } catch (error) {
//       print('Error fetching data: $error');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           onPressed: () {
//             Navigator.pop(context); // Add logic to navigate back
//           },
//           icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
//         ),
//         backgroundColor: Color.fromARGB(255, 62, 142, 64),
//         title: Text(
//           "Team name", // Change this to your team name
//           style: TextStyle(color: Colors.white, fontFamily: 'Sofia'),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 10),
//           Align(
//             alignment: Alignment.center,
//             child: SearchWidget(),
//           ),
//           SizedBox(height: 10),
//           Expanded(
//             child: ListView.builder(
//               itemCount: players.length,
//               itemBuilder: (BuildContext context, int index) {
//                 final player = players[index];
//                 return InkWell(
//                   splashColor: Color(0xFF38003C).withOpacity(1),
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (BuildContext context) => Playersss(),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     children: [
//                       Container(
//                         margin: EdgeInsets.all(5),
//                         padding: EdgeInsets.all(0),
//                         decoration: BoxDecoration(
//                           boxShadow: [
//                             BoxShadow(
//                               color: Colors.grey.withOpacity(0.5),
//                               spreadRadius: 2,
//                               blurRadius: 5,
//                               offset: Offset(0, 3),
//                             ),
//                           ],
//                         ),
//                         child: Container(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 10, horizontal: 20),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                           ),
//                           child: Row(
//                             children: [
//                               IconButton(
//                                 onPressed: () {
//                                   Navigator.push(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (BuildContext context) =>
//                                           Playersss(),
//                                     ),
//                                   );
//                                 },
//                                 icon: Icon(Icons.arrow_forward,
//                                     color: Colors.black),
//                               ),
//                               SizedBox(width: 20),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     player.playerName ?? ' ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 20,
//                                       color: Colors.black,
//                                       fontFamily: 'Sofia',
//                                     ),
//                                   ),
//                                   SizedBox(
//                                     height: 8,
//                                   ),
//                                   Text(
//                                     player.playerType ?? ' ',
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.w300,
//                                       fontSize: 17,
//                                       color: Colors.black,
//                                       fontFamily: 'Sofia',
//                                     ),
//                                   )
//                                 ],
//                               ),
//                               Spacer(),
//                               Image.network(
//                                 player.playerImage ??
//                                     "https://m.media-amazon.com/images/M/MV5BMmQzZWRiMWMtYWJjOC00NzhjLWE0ZTktMGViYzU5NjFkZTRjXkEyXkFqcGdeQXVyOTAyMDgxODQ@._V1_FMjpg_UX1000.jpg",
//                                 height: 80,
//                                 width: 60,
//                                 fit: BoxFit.fill,
//                               ),
//                               SizedBox(width: 15),
//                               Text(
//                                 "${index + 1}",
//                                 style: TextStyle(
//                                   fontSize: 30,
//                                   color: Colors.black,
//                                   fontFamily: 'Sofia',
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
