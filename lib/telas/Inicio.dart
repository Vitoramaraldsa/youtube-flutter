import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/video.dart';
import 'package:youtube_flutter/telas/SeeVideo.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../ApiConfig.dart';

class Inicio extends StatefulWidget {
  String pesquisa;
  Inicio(this.pesquisa);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {
  late YoutubePlayerController _controlleryt;
  @override
  Widget build(BuildContext context) {

      _listarVideos(String pesquisa) {
      ApiConfig api = ApiConfig();
      return api.pesquisar(pesquisa);
      }

    return FutureBuilder<dynamic>(
        //propriedade que define qual é a função que retorna os valores futuros
        future: _listarVideos(widget.pesquisa),
        builder: (context, snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              //casa haja dados a exibir
              if (snapshot.hasData) {
                return ListView.separated(
                    itemBuilder: (context, index) {
                      //carregar videos em memória
                      List<Video> videos = snapshot.data;
                      // acessar vídeos por único item
                      Video video = videos[index];
                      return GestureDetector(
                        //play video
                        onTap: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => SeeVideo(video.id))
                          );
                        },
                        child: Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: NetworkImage(video.thumbnail),
                                      fit: BoxFit.cover)),
                            ),
                            ListTile(
                              title: Text(video.titulo),
                              subtitle: Text(video.descricao),
                            )
                          ],
                        ),
                      );
                    },
                    separatorBuilder: (covariant, index) =>
                        Divider(height: 2, color: Colors.red),
                    itemCount: snapshot.data.length);
              } else {
                return Center(
                  child: Text("Não há dados para exibir"),
                );
              }
              break;
            default:
          }
          //por mais que o código esteja correto, deve existir alguma tratativa para a validação acima
          return Center(
            child: CircularProgressIndicator(),
          );
        });
  }
}
