import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';


class FriendsPage extends StatefulWidget {

  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
  var userProfile;
  final db = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Container(
                decoration: BoxDecoration(
                    image: DecorationImage (
                      image: AssetImage('assets/LPL_logo.png'),
                      fit: BoxFit.contain,
                    )
                )
            ),
            Container(
              color: Color.fromRGBO(255,255,255,0.9),
            ),
            Container(
              width: double.infinity,
              height: 150,
              alignment: Alignment(0.0,2.5),
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                   'https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'
                ),
                   radius: 60.0,
    ),
    ),
            Container(
              alignment: Alignment(0, 0),
              child: Text(
                 'You have pet this dog this many times:',
                  style: TextStyle(
                    fontSize: 16.0,
                    color:Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                ),
                ),
            ),
            Container(
              alignment: Alignment(0, 0.2),
              child: Text(
                '$_counter',
                style: TextStyle(
                    fontSize: 25.0,
                    color:Colors.blueGrey,
                    letterSpacing: 2.0,
                    fontWeight: FontWeight.w400
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton.extended(
                onPressed: _incrementCounter,
                tooltip: 'Increment',
                label: const Text('Approve'),
                icon: const Icon(Icons.thumb_up),
                backgroundColor: Colors.green,
              ),
            ),
          ],
        )
    );
  }
}
//'https://images.pexels.com/photos/39317/chihuahua-dog-puppy-cute-39317.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'