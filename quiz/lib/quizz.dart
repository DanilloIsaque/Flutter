import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  int currentQuestionIndex = 0;//indice da pergunta atual
  String? selectedAnswer;
  bool?isCorrect;
  final List<Map<String,dynamic>> questions = [
    {
       'question': 'Qual desses é o animal mais rápido no ambiente maritimo?',
       'answers': ['Peixe-vela','Marlim-preto','Tubarão-mako' ,'Orca'],
       'correctAnswer':'Marlim-preto'
    },
    {
       'question': 'Qual desses é o animal mais perigoso no ambiente maritimo?',
       'answers': [' Polvo-de-anéis-azuis','Agua-viva','Tubarão-branco' ,'Crocodilo-de-água-salgada'],
       'correctAnswer':'Tubarão-branco'
    }
    //adicionar mais perguntas
  ];
  void nextQuestion(){
    if(currentQuestionIndex < questions.length - 1){
      setState(() {
        currentQuestionIndex++;
      });
    }else{
      //fim do quiz, fazer algo depois
    }
  }
  void handleAnswer(String answer){
    setState(() {
      selectedAnswer=answer;
      isCorrect=answer == questions[currentQuestionIndex]['correctAnswer'];
    });
    Future.delayed(Duration(seconds: 2),(){
      setState(() {
        selectedAnswer=null;
        isCorrect=null;
        if(currentQuestionIndex<questions.length-1){
          currentQuestionIndex++;
        }else{
          //fim do quiz,fazer algo
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var currentQuestion = questions[currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[50],
        title: Text('Quiz Marítimo!',style:GoogleFonts.roboto(fontWeight: FontWeight.bold)),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.deepPurple[50],
            width: double.infinity,
            height: 400,
            child: Center(
              child: Text(currentQuestion['question'],
              style: GoogleFonts.roboto(fontWeight: FontWeight.bold,fontSize: 18),),
              ),
          ),
          Wrap(
            children:currentQuestion['answers'].map<Widget>((resposta){
              bool isSelected = selectedAnswer == resposta;
              Color? buttonColor;
              if(isSelected){
                buttonColor = isCorrect! ? Colors.green:Colors.red;
              }

              return meuBtn3(
                resposta,()=> handleAnswer(resposta),buttonColor);
              
            }).toList(),
           // .map<Widget>((resposta) => meuBtn2(resposta, handleAnswer)).toList(),
          )
          /*
          Wrap(
            children: [meuBtn('A'),meuBtn('B'),meuBtn('C'),meuBtn('D')],
          )
        */
        ],
      ),
    );
  }
}

Widget meuBtn(String resposta)=>Container(
  margin: const EdgeInsets.all(16),
  width: 160,
  child: ElevatedButton(
    onPressed: () {},
    child: Text(resposta),
  ),
);
Widget meuBtn2(String resposta,VoidCallback onPressed)=>Container(
  margin: const EdgeInsets.all(16),
  width: 160,
  child: ElevatedButton(
    onPressed: onPressed,
    child: Text(resposta),
  ),
);
Widget meuBtn3(String resposta,VoidCallback onPressed,Color? color)=>
Container(
 margin: const EdgeInsets.all(16),
  width: 160,
  child: ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
    ),
    child: Text(resposta),
  ),
);