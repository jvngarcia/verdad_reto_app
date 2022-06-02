import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:verdad_reto_app/src/layouts/layouts.dart';
import 'package:verdad_reto_app/src/widgets/item_secondary_menu_widget.dart';
import 'package:verdad_reto_app/src/widgets/widgets.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-7376555429579726/1464280781',
    size: AdSize.banner,
    request: const AdRequest(
      keywords: [
        'game',
        'games',
        'plays',
        'play',
        'money',
        'Verdad o reto',
        'juego',
        'juegos',
        'jugadores',
        'jugador',
        'retos',
        'juegos para fiestas',
        'juegos para reuniones',
      ],
    ),
    listener: const BannerAdListener(),
  );

  @override
  void initState() {
    super.initState();
    myBanner.load();
    // Load ads.
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);

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
          Container(
            alignment: Alignment.center,
            child: adWidget,
            width: myBanner.size.width.toDouble(),
            height: myBanner.size.height.toDouble(),
          ),
          const SizedBox(height: 15),
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
