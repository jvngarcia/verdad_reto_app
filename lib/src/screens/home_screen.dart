import 'package:flutter/material.dart';
import 'package:verdad_reto_app/src/layouts/layouts.dart';
import 'package:verdad_reto_app/src/widgets/item_secondary_menu_widget.dart';
import 'package:verdad_reto_app/src/widgets/widgets.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: principalAppBar(),
      body: ListView(
        children: [
          const ItemPrincipalMenu(
            img: 'assets/images/modo-hot.jpg',
            titulo: 'HOT',
            subtitulo: '¿Están todos preparados?',
          ),
          const SizedBox(height: 10),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
            child: Text(
              'OTRAS OPCIONES',
              style: TextStyle(
                fontSize: 25,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                ItemSecondaryMenu(
                  img: 'assets/images/modo-normal.jpg',
                  titulo: 'Normal',
                  subtitulo: 'Preguntas y retos sencillos',
                ),
                ItemSecondaryMenu(
                  img: 'assets/images/mode_novios.jpeg',
                  titulo: 'Novios',
                  subtitulo: 'Preguntas y retos para parejas',
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              children: const [
                ItemSecondaryMenu(
                  img: 'assets/images/pagina-preguntas.jpg',
                  titulo: 'Como jugar',
                  subtitulo: 'Conoce las reglas',
                  mode: 'pagina',
                  route: 'como-jugar',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
