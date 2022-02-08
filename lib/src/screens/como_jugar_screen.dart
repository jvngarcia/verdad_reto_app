import 'package:flutter/material.dart';
import 'package:verdad_reto_app/src/layouts/layouts.dart';

class ComoJugarScreen extends StatelessWidget {
  const ComoJugarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: principalAppBar(),
      body: Center(
        child: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage('assets/images/pagina-preguntas.jpg'),
            fit: BoxFit.contain,
            alignment: Alignment.bottomCenter,
            repeat: ImageRepeat.repeat,
            opacity: 0.3,
          )),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 50),
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                alignment: Alignment.center,
                decoration: _cardDecoration(),
                child: Column(
                  children: const [
                    Text(
                      '¿Cómo jugar?',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      '¡Las reglas son simples! Cada jugador tiene un turno para contestar el teléfono y elegir entre verdad o reto. Si elige verdad, debe responder con sinceridad la pregunta que aparece en pantalla. Si elige reto, debe ejecutar la acción que aparece en pantalla. Si se niega, deberá realizar un reto proporcionado por todo el equipo.',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.roofing_outlined),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            offset: Offset(0, 7),
            blurRadius: 10,
          )
        ],
      );
}
