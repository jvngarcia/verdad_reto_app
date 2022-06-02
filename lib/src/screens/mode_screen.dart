import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:flutter/material.dart';
import 'package:verdad_reto_app/src/layouts/layouts.dart';
import 'package:verdad_reto_app/src/providers/providers.dart';

class ModeScreen extends StatefulWidget {
  const ModeScreen({Key? key}) : super(key: key);

  @override
  State<ModeScreen> createState() => _ModeScreenState();
}

class _ModeScreenState extends State<ModeScreen> {
  String text = '¿Ya sabes que elegirás?';

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

  void _handleTap(mode, option) {
    setState(() {
      final data = gameMode.loadData(mode, option);
      data.then((content) {
        text = content;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final AdWidget adWidget = AdWidget(ad: myBanner);
    final String mode =
        ModalRoute.of(context)?.settings.arguments.toString() ?? 'no-mode';

    return Scaffold(
      appBar: principalAppBar(),
      body: Center(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              width: 320,
              height: 200,
              alignment: Alignment.center,
              decoration: _cardDecoration(),
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 16,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MaterialButton(
                  color: Colors.deepOrange,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  onPressed: () => _handleTap(mode, 'verdad'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 20,
                    ),
                    child: const Text(
                      'VERDAD',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  color: Colors.deepOrange,
                  onPressed: () => _handleTap(mode, 'reto'),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 20,
                    ),
                    child: const Text(
                      'RETO',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
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
