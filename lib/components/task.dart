import 'package:first_project/components/difficulty.dart';
import 'package:flutter/material.dart';


class Task extends StatefulWidget {
  final String nome;
  final String foto;
  final int dificuldade;

  const Task( this.nome, this.foto, this.dificuldade,  {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: Colors.blue,
            )
            ,),
          Column(
            children: [
              Container(
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Container(
                      width: 72,
                      height: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                          color: Colors.black26),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.network(
                          widget.foto,
                          fit: BoxFit.cover,
                        ),
                      ),


                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(width: 200,child: Text(widget.nome,
                          style: const TextStyle(fontSize: 24),
                          overflow: TextOverflow.ellipsis ,)
                        ),
                        Difficulty(difficultyLevel: widget.dificuldade,)
                      ],
                    ),
                    SizedBox(
                      height: 52,

                      child: ElevatedButton(onPressed: (){
                        setState(() {
                          nivel++;
                        });

                      },
                          child: const Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Icon(Icons.arrow_drop_up),
                              Text("UP", style: TextStyle(fontSize: 12),)
                            ],
                          )),
                    )
                  ],
                ) ,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(width: 200,child: LinearProgressIndicator(
                      color: Colors.white,
                      value: (widget.dificuldade>0)?
                      (nivel/widget.dificuldade)/10 : 1,
                    ),),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("Nível $nivel", style:
                    const TextStyle(color: Colors.white, fontSize: 16),),
                  ),
                ],
              ),

            ],
          )

        ],
      ),
    );
  }
}