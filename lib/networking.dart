import 'package:http/http.dart' as http;
import 'dart:convert';

String api_key = '1ad4eb7829b40adb656928f7a3771bbc';

class Networking{
  Future getTrending() async{
    var response = await http.get('https://api.themoviedb.org/3/trending/all/day?api_key=$api_key');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

  Future getPersons() async{
    var response = await http.get('https://api.themoviedb.org/3/person/popular?api_key=$api_key&language=en-US&page=1');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

  Future getUpcoming() async{
    var response = await http.get('https://api.themoviedb.org/3/movie/upcoming?api_key=$api_key&language=en-US&page=1');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

  Future getDrama() async{
    var response = await http.get('https://api.themoviedb.org/3/movie/577328/recommendations?api_key=$api_key&language=en-US&page=1');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

  Future getTV() async{
    var response = await http.get('https://api.themoviedb.org/3/tv/popular?api_key=$api_key&language=en-US&page=1');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

  Future getLatest() async{
    var response = await http.get('https://api.themoviedb.org/3/movie/latest?api_key=$api_key&language=en_US');
    if(response.statusCode == 200){
      return jsonDecode(response.body.toString());
    } else {return null;}
  }

}