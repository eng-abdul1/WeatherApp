import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/search.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/weather.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Welcome to', style: TextStyle(fontSize: 26, color: Colors.black,
              fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15,),
              Container(
                margin: EdgeInsets.only(left: 22, right: 22),
                height: 70,
                width: 280,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white.withOpacity(0.7),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 13.0),
                  child: Text('WEATHER', style: GoogleFonts.spaceGrotesk(fontSize: 40,
                      fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton:  FloatingActionButton.extended(
          backgroundColor: Colors.white.withOpacity(0.7),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => Search()
            ),
            );
          },
          label: Text('Search', style: TextStyle(fontSize: 28, color: Colors.black,
          fontWeight: FontWeight.bold),),
        ),
    );
  }
}
