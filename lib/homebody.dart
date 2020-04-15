import 'package:flutter/material.dart';
import 'titleTiles.dart';
import 'highlightedMovies.dart';
import 'networking.dart';
import 'shapeTile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        HighlightedMovies(),
        TitleTiles(title: 'Best Bollywood Movies',),
        PosterList(),
        TitleTiles(title: 'Best Actors',),
        TopActorsList(),
        TitleTiles(title: 'Upcoming Movies',),
        Upcoming(),
        TitleTiles(title: 'Popular TV',),
        PopularTV(),
        SizedBox(height: 50,),
      ],
    );
  }
}

class PosterList extends StatelessWidget {
  Future trending;
  @override
  Widget build(BuildContext context) {
    trending = Networking().getDrama();
    return SizedBox(
      height: 180,
      child: FutureBuilder(
          future: trending,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                //Implementation
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return VerticalMovieTile(
                        link: snapshot.data['results'][index]['poster_path'],
                      );
                    });
              } else {
                return Center(child: Text('Error Loading Items'));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error Loading Items'));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class TopActorsList extends StatelessWidget {
  Future persons;
  @override
  Widget build(BuildContext context) {
    persons = Networking().getPersons();
    return SizedBox(
      height: 100,
      child: FutureBuilder(
          future: persons,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                //Implementation
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return RoundedTiles(
                        link: snapshot.data['results'][index]['profile_path'],
                        name: snapshot.data['results'][index]['name'],
                      );
                    });
              } else {
                return Center(child: Text('Error Loading Items'));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error Loading Items'));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}

class Upcoming extends StatelessWidget {
  Future trending;
  @override
  Widget build(BuildContext context) {
    trending = Networking().getUpcoming();
    return SizedBox(
      height: 180,
      child: FutureBuilder(
          future: trending,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                //Implementation
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return VerticalMovieTile(
                        link: snapshot.data['results'][index]['poster_path'],
                      );
                    });
              } else {
                return Center(child: Text('Error Loading Items'));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error Loading Items'));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}


class PopularTV extends StatelessWidget {
  Future trending;
  @override
  Widget build(BuildContext context) {
    trending = Networking().getTV();
    return SizedBox(
      height: 180,
      child: FutureBuilder(
          future: trending,
          builder: (BuildContext context, snapshot) {
            if (snapshot.hasData) {
              if (snapshot.data != null) {
                //Implementation
                return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 20,
                    itemBuilder: (BuildContext context, index) {
                      return VerticalMovieTile(
                        link: snapshot.data['results'][index]['poster_path'],
                      );
                    });
              } else {
                return Center(child: Text('Error Loading Items'));
              }
            } else if (snapshot.hasError) {
              return Center(child: Text('Error Loading Items'));
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}
