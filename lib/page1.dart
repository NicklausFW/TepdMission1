import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const foreground = Color(0xFFF8BBD0);
const background = Color(0xFFFF4081);
const change = Color(0xFF670435);

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Color inactive = foreground;
  Color active = change;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        foregroundColor: inactive,
        backgroundColor: Color(0xFFFF4081),
        child: Icon(Icons.favorite),
        onPressed: () {
          setState(() {
            if (inactive == foreground) {
              inactive = change;
            } else if (inactive != foreground) {
              inactive = foreground;
            }
          });
        },
      ),
      appBar: AppBar(
        centerTitle: true,
        title: Text('NicklausFW'),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color(0xFF3383CD),
                Color(0xFF11249f),
              ],
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topRight, colors: [
          Color(0xFF3383CD),
          Color(0xFF00DCB0),
        ])),
        child: Column(
          children: <Widget>[
            Flexible(
              flex: 2,
              child: ClipPath(
                clipper: Clipper(),
                child: Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFF3383CD),
                        Color(0xFF11249f),
                      ],
                    ),
                    image: DecorationImage(
                      image: AssetImage("assets/images/diamondsBG.png"),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Expanded(
                        child: Stack(
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(left: 15, top: 40),
                              child: Image(
                                image:
                                    AssetImage("assets/images/minecraft.png"),
                                alignment: Alignment.topCenter,
                                width: 260,
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 260),
                              child: Image(
                                image: AssetImage("assets/images/steve.png"),
                                alignment: Alignment.topCenter,
                                width: 1500,
                                height: 1500,
                                fit: BoxFit.fitWidth,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                height: 300,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    gallery(
                      image: "assets/images/minecraft1.png",
                    ),
                    gallery(
                      image: "assets/images/minecraft2.png",
                    ),
                    gallery(
                      image: "assets/images/minecraft3.png",
                    ),
                    gallery(
                      image: "assets/images/minecraft4.png",
                    ),
                    gallery(
                      image: "assets/images/minecraft5.png",
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  child: Text(
                    'THE WORLD IS YOURS FOR THE MAKING',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              flex: 4,
              child: Column(
                children: <Widget>[
                  Container(
                    height: 300,
                    child: ListView(
                      scrollDirection: Axis.vertical,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(left: 10, right: 10),
                          child: Column(
                            children: <Widget>[
                              Text(
                                  'Prepare for an adventure of limitless possibilities as you build, mine, battle mobs, and explore the ever-changing Minecraft landscape.'
                                  'New tools, locations, and spaces are yours to explore, thanks to our regular updates. Check out the latest.'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'If you can dream it, you can build it. Put your imagination and limitless resources to work with Creative Mode.'
                                  'Get crafty and use the surrounding environment to gather building materials—see how breaking down trees can help you create something new.'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'It’s always best to avoid the unpredictable by distancing yourself from wandering mobs—you never know what’ll happen if they get too close!'
                                  'Discover all the versatile ways dust from the Redstone ore can be used to enhance your creations, bring them to life, or give them some bang.'),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                  'Get instant access to over 50 Marketplace items with new additions each month. Share with friends on your own private Realms server.!'
                                  'Keep your gameplay endlessly inventive and fun with skin packs, texture packs, and more—some of which were built by our very own community members!'),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class gallery extends StatelessWidget {
  const gallery({@required this.image});
  final String image;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Card(
        child: Wrap(
          children: <Widget>[
            Image(
              image: AssetImage(
                image,
              ),
              width: 100,
              height: 200,
              fit: BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }
}

class Clipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // TODO: implement getClip
    var path = Path();
    path.lineTo(0, size.height - 50);
    path.quadraticBezierTo(
        size.width / 2, size.height, size.width, size.height - 50);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
