//import 'package:cloud_firestore/cloud_firestore.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
//import 'package:firebase_storage/firebase_storage.dart';
//import 'package:path/path.dart';

class FriendsPage extends StatefulWidget {
  @override
  State<FriendsPage> createState() => _FriendsPageState();
}

class _FriendsPageState extends State<FriendsPage> {
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
            SizedBox(height: 50,),
            StreamBuilder(stream: db.child('InspiringQuotes')
                .orderByKey()
                .limitToLast(5)
                .onValue,
              builder: (context,snapshot){
                final tilesList = <ListTile> [];
                if(snapshot.hasData) {
                  final cardsList = Map<String,dynamic>.from(
                      (snapshot.data! as Event).snapshot.value);
                  cardsList.forEach((key, value) {
                    final nextCard = Map<String,dynamic>.from(value);
                    final orderTile = ListTile(
                        leading: Icon(Icons.local_cafe),
                        title: Text(nextCard['quote'], maxLines: 4, overflow: TextOverflow.ellipsis,),
                        subtitle: Text(nextCard['author']));
                    tilesList.add(orderTile);
                  });
                }
                return ListView(
                  children: tilesList,
                );
              },
            )
          ],
        )
    );
  }
}