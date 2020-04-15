import 'package:flutter/material.dart';
import 'package:hotstar_ui/networking.dart';
import 'constants.dart';

class HighlightedMovies extends StatelessWidget {
  Future trending;

  @override
  Widget build(BuildContext context) {
    trending = Networking().getTrending();
    return SizedBox(
        height: 220,
        child: PageView.builder(
            itemCount: 20,
            controller: PageController(viewportFraction: 0.95, initialPage: 1),
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.0, vertical: 4.0),
                child: Container(
                  child: FutureBuilder(
                    future: trending,
                    builder: (BuildContext context, snapshot) {
                      if (snapshot.hasData) {
                        if (snapshot.data != null) {
                          return ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Stack(
                              children: <Widget>[
                                Positioned.fill(
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${snapshot.data['results'][index]['backdrop_path']}',
                                    fit: BoxFit
                                        .cover, // ! fitWidth works with Positioned.fill inside Stack
                                  ),
                                ),
                                Positioned.fill(
                                  child: Container(
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                          begin: Alignment.bottomCenter,
                                          end: Alignment.topCenter,
                                          stops: [
                                            0.0,
                                            0.6
                                          ],
                                          colors: [
                                            Colors.black,
                                            Colors.transparent
                                          ]),
                                    ),
                                  ),
                                ),
                                Align(
                                    alignment: Alignment.bottomLeft,
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 18.0, vertical: 28.0),
                                      child: Text(
                                        snapshot.data['results'][index]
                                            ['title']!=null ? snapshot.data['results'][index]
                                            ['title'] : snapshot.data['results'][index]
                                            ['name'],
                                        style: trendingTitle,
                                      ),
                                    )),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12.0),
                                    child: Text(
                                      '${genres[snapshot.data['results'][index]['genre_ids'][0]]}  |  ${snapshot.data['results'][index]['genre_ids'].length > 1 ? genres[snapshot.data['results'][index]['genre_ids'][1]] : genres[snapshot.data['results'][index]['genre_ids'][0]]}',
                                      style: trendingGenre,
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Text(
                                      '${index + 1}/20',
                                      style: lightFont,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        } else {
                          return Text('Error');
                        }
                      } else if (snapshot.hasError) {
                        return Text('Error');
                      } else {
                        return CircularProgressIndicator();
                      }
                    },
                  ),
                  decoration: BoxDecoration(
                    color: Colors.grey[700],
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              );
            }));
  }
}
