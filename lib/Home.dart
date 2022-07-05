import 'package:flutter/material.dart';
import 'package:youtube_flutter/telas/Biblioteca.dart';
import 'package:youtube_flutter/telas/EmAlta.dart';
import 'package:youtube_flutter/telas/Inicio.dart';
import 'package:youtube_flutter/telas/Inscricao.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  //variavel do indice da bottom navigation
  int _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    List<Widget> telas = [
      Inicio(),
      EmAlta(),
      Inscricao(),
      Biblioteca()
    ];

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.grey),
        backgroundColor: Colors.white,
        title: IconButton(onPressed: (){print("atualizar página");}, icon: Image.asset("imagens/youtube.png"), iconSize: 100),
        //title: Image.asset("imagens/youtube.png", width: 98, height: 22),
        actions: [
          IconButton(
              onPressed: (){print("Ação videocam");},
              icon: Icon(Icons.videocam)),
          IconButton(
              onPressed: (){print("Ação pesquisa");},
              icon: Icon(Icons.search)),
          IconButton(
              onPressed: (){print("Ação conta");},
              icon: Icon(Icons.account_circle))
        ],
      ) ,
      body: Container(
        padding: EdgeInsets.all(16),
        child: telas[_indiceAtual],
      ),
      bottomNavigationBar: BottomNavigationBar(

        //cor fixada, shifting para criar o efeito de mudança de cores.
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.red,

        //definir a cor após selecionar um item
        currentIndex: _indiceAtual,
        onTap: (indice){
          setState((){
            _indiceAtual = indice;
          });
        },

        //itens do bottom navigation
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "Início"
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            label: "Em alta"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.subscriptions),
              label: "Inscrições"
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.folder),
              label: "Biblioteca"
          )
        ],
      ) ,
    );
  }
}
