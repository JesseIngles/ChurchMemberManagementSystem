import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('FutureBuilder List Example'),
        ),
        body: ListaMembros(),
      ),
    );
  }
}

class ListaMembros extends StatelessWidget {
  // Função que simula uma chamada de rede para buscar uma lista de membros
  Future<List<String>> fetchMembros() async {
    await Future.delayed(Duration(seconds: 2)); // Simula uma demora
    return List<String>.generate(20, (i) => "Membro $i");
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<String>>(
      future: fetchMembros(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('Erro ao carregar os dados'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('Nenhum membro encontrado'));
        } else {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  leading: Icon(Icons.person),
                  title: Text('${snapshot.data![index]}'),
                  subtitle: Text('Detalhes do ${snapshot.data![index]}'),
                  trailing: Icon(Icons.arrow_forward),
                  onTap: () {
                    print('Tapped on ${snapshot.data![index]}');
                  },
                ),
              );
            },
          );
        }
      },
    );
  }
}
