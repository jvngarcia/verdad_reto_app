import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:verdad_reto_app/src/layouts/layouts.dart';

class ComoJugarScreen extends StatefulWidget {
  const ComoJugarScreen({Key? key}) : super(key: key);

  @override
  State<ComoJugarScreen> createState() => _ComoJugarScreenState();
}

class _ComoJugarScreenState extends State<ComoJugarScreen> {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-7376555429579726/1464280781',
    size: AdSize.banner,
    request: const AdRequest(
      keywords: [
        'game',
        'games',
        'plays',
        'play',
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

  final BannerAd myBanner2 = BannerAd(
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
    myBanner2.load();
    // Load ads.
  }

  @override
  void dispose() {
    super.dispose();
    myBanner.dispose();
    myBanner2.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final AdWidget adWidget2 = AdWidget(ad: myBanner2);
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
                alignment: Alignment.center,
                child: adWidget,
                width: myBanner.size.width.toDouble(),
                height: myBanner.size.height.toDouble(),
              ),
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
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: adWidget2,
                width: myBanner.size.width.toDouble(),
                height: myBanner.size.height.toDouble(),
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
