import 'package:flutter/material.dart';

class FinalQuiz extends StatefulWidget { 
  final int pontuacao;
   FinalQuiz({super.key,required this.pontuacao});

  @override
  State<FinalQuiz> createState() => _finalQuiz();
}

  class _finalQuiz extends State<FinalQuiz> {
  
      @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: 
      Column(
        children: [
          Container(

         color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Text('Parabéns! Sua pontuação foi de ${widget.pontuacao} pontos ', //widget pega valor de outra estrutura de classe
             ),
              ),
          ),
        ]
      ),
    );
  }
  }