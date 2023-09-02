import 'package:flutter/material.dart';
import 'package:sports/screens/player.dart';
import 'package:sports/screens/search.dart';

class Playerss extends StatelessWidget {
  const Playerss({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_outlined, color: Colors.white),
        ),
        backgroundColor: Color(0xFF38003C),
        title: Text(
          "Team name",
          style: TextStyle(color: Colors.white, fontFamily: 'Sofia'),
        ), centerTitle: true,

      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Align(
            alignment: Alignment.center,
            child: SearchWidget(),
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) {
                return Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.all(5),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => Playersss(),
                            ),
                          );
                        },
                        child: Container(

                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.1,
                          decoration: BoxDecoration(color: Colors.white
                          ,boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 2,
                                blurRadius: 5,
                                offset: Offset(0, 3),

                              ),

                            ],
                          ),
                          child: Row(
                            children: [
                              SizedBox(width: 6,),
                              Center(
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(Icons.arrow_forward),
                                ),
                              ),
                              SizedBox(width: MediaQuery.of(context).size.width * 0.1),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.35,
                                child: Column(
                                  children: [
                                    SizedBox(height: 7,),
                                    Text(
                                      "Player name",
                                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "country",
                                          style: TextStyle(fontWeight: FontWeight.w300, fontSize: 25),
                                        ),
                                        SizedBox(width: 10),
                                        Image.network(
                                          "https://upload.wikimedia.org/wikipedia/commons/thumb/b/be/Flag_of_England.svg/640px-Flag_of_England.svg.png",
                                          height: 40,
                                          width: 40,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(width: 10,),
                              Image.network(
                                "https://m.media-amazon.com/images/M/MV5BMmQzZWRiMWMtYWJjOC00NzhjLWE0ZTktMGViYzU5NjFkZTRjXkEyXkFqcGdeQXVyOTAyMDgxODQ@._V1_FMjpg_UX1000.jpg",
                                height: MediaQuery.of(context).size.height * 0.1,
                                width: 100,
                              ),
                              Text("23", style: TextStyle(fontSize: 40),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
