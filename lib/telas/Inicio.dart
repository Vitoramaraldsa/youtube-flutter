import 'package:flutter/material.dart';
import 'package:youtube_flutter/model/video.dart';

import '../ApiConfig.dart';


class Inicio extends StatefulWidget {
  const Inicio({Key? key}) : super(key: key);

  @override
  State<Inicio> createState() => _InicioState();
}

class _InicioState extends State<Inicio> {

  @override
  Widget build(BuildContext context) {

    _listarVideos() {
      ApiConfig api = ApiConfig();
      print(api.pesquisar(""));
      return api.pesquisar("");
    }

    return FutureBuilder<dynamic>(
        //propriedade que define qual é a função que retorna os valores futuros
        future: _listarVideos(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.none:
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
              break;
            case ConnectionState.active:
            case ConnectionState.done:
              //casa haja dados a exibir
              if(snapshot.hasData){
                  return ListView.separated(
                      itemBuilder: (context,index){

                        //carregar videos em memória
                        List<Video> videos = snapshot.data;
                        // acessar vídeos por único item
                        Video video = videos[index];

                        return Column(
                          children: [
                            Container(
                              height: 200,
                              decoration: BoxDecoration(image: DecorationImage(image: NetworkImage(video.thumbnail), fit: BoxFit.cover)),
                            )
                          ],
                        );
                      },
                      separatorBuilder: (covariant,index) => Divider(height: 2, color: Colors.red),
                      itemCount: snapshot.data.length
                  );
              }else{
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

        }
    );
  }
}