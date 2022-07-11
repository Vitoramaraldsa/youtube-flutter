import 'package:flutter/material.dart';

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
      //IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, "");
        },
        icon: Icon(Icons.arrow_back));
  }

  @override
  Widget buildResults(BuildContext context) {
    //o future delayed
    Future.delayed(Duration.zero,(){
      close(context, query);
    });
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
   List<String> lista = [];
   if(query.isNotEmpty){
      lista = [
        "Android", "Android navegação", "IOS", "Jogos","carro","java"
      ].where(
              (element) => element.toLowerCase().startsWith(query.toLowerCase())
      ).toList();

      return ListView.builder(
        itemCount: lista.length,
          itemBuilder: (context,index){
             return ListTile(
               onTap: (){/*query = lista[index];*/ close(context,lista[index]);},
               title: Text(lista[index]),
             );
          }
      );

   }else{
     return Center(child: Text("Nenhum resultado para a pesquisa."),);
   }
  }
}
