import 'package:flutter/material.dart';
import 'package:hotstar_ui/constants.dart';

class VerticalMovieTile extends StatelessWidget {
  String link;
  VerticalMovieTile({this.link});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4.0),
        child: Image.network(
          link!=null ? 'https://image.tmdb.org/t/p/w500$link': 'https://mrdeyo.com/whiteboard/wp-content/uploads/2013/08/feather-white-500x700.jpg',
          fit: BoxFit.cover,
        ),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
    );
  }
}


class RoundedTiles extends StatelessWidget {
  String link;
  String name;
  RoundedTiles({this.link, this.name});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 70,
            width: 70,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Theme.of(context).colorScheme.secondary),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage('https://image.tmdb.org/t/p/w500$link'),
              ),
            ),
          ),
          // CircleAvatar(
          //   radius: 35,
          //   backgroundImage: NetworkImage('https://image.tmdb.org/t/p/w500$link'),
          // ), // ? Both are working
          SizedBox(height: 10,),
          Text(
            name,
            style: TextStyle(fontSize: 10, color: Theme.of(context).colorScheme.secondaryVariant),
          ),
        ],
      ),
    );
  }
}