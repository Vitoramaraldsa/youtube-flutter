import 'dart:convert';


import 'package:http/http.dart' as http;

import 'model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyBTjd2Ep2TiHlHsh_DbEU9QM-iWGL66Yh0";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class ApiConfig{

  Future<List<Video>?> pesquisar (String pesquisa) async {
    http.Response response = await http.get(
        Uri.parse(
            URL_BASE +
                "search"
                "?part=snippet"
                "&type=video"
                "&maxResults=20"
                "&order=date"
                "&key=$CHAVE_YOUTUBE_API"
                "&channelId=$ID_CANAL"
                "&q=$pesquisa"

        )
    );

    if(response.statusCode == 200) {
      Map<String, dynamic> dadosJson = jsonDecode(response.body);
      List<Video> listaVideos = dadosJson["items"].map<Video>(
              (map) {
            return Video.fromJson(map);
          }
      ).toList();
      return listaVideos;
    }


      /*
      for(var video in listaVideos){
        print("video: " + video.descricao);
      }
       */

      //primeira abordagem
      //print("resultado: " + dadosJson["items"].toString());
      /*
      for(var video in dadosJson["items"]){
        print("Resultado: " + video.toString());
      }
       */


      /*
      for(var video in videos){
        print(video.titulo);
      }*/

      //(2)preencher os videos enquanto percorre os itens do json.
      /*
      for(var video in dadosJson["items"]){
        print("Resultado: " + video.toString());
      }
      }else{
        print("status code: ${response.statusCode}");
       }
      */
  }

}