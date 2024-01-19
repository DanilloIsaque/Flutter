
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
   MyHomePage({super.key});

  String texto = "Aplicativo";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        title: const Text("Meu primeiro App.")
        ),
        body:Column(
          children: [
            ElevatedButton(onPressed: () {},
             child: const Text('Botão')),
          Image.asset('assets/bloodborne.jpg'),
            Center(
              child: Text(texto),
              ), // usar const para quando for executado no aparelho , a performance melhorar, ja que o valor não muda

        ],
        ) 
    );
  }
}