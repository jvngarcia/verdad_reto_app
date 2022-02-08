import 'package:flutter/material.dart';

class ItemPrincipalMenu extends StatelessWidget {
  final String img;
  final String titulo;
  final String subtitulo;
  final String? mode;
  final String? route;

  const ItemPrincipalMenu({
    Key? key,
    required this.img,
    required this.titulo,
    required this.subtitulo,
    this.mode,
    this.route,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: const EdgeInsets.only(top: 30, bottom: 30),
        width: double.infinity,
        height: 270,
        decoration: _cardBorders(),
        child: InkWell(
          borderRadius: BorderRadius.circular(25),
          onTap: () {
            if (mode == 'pagina') {
              Navigator.pushNamed(context, '$route');
            } else {
              Navigator.pushNamed(
                context,
                'mode',
                arguments: titulo.toLowerCase(),
              );
            }
          },
          child: Stack(
            alignment: Alignment.center,
            children: [
              _BackgroundImage(img),
              _ItemDetails(titulo, subtitulo),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardBorders() => BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              offset: Offset(0, 7),
              blurRadius: 10,
            )
          ]);
}

class _ItemDetails extends StatelessWidget {
  final String titulo;
  final String subtitulo;

  const _ItemDetails(this.titulo, this.subtitulo);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 60),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        width: double.infinity,
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'TENDENCIA',
              style: TextStyle(
                fontSize: 15,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 30),
            Text(
              titulo,
              style: const TextStyle(
                fontSize: 30,
                color: Colors.red,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 3),
            Text(
              subtitulo,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.black87,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.only(right: 150),
              child: Text(
                '¡Disfruta del modo mas jugado por todos!',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.black87,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecorationnDetails() => const BoxDecoration(
      color: Colors.deepOrange,
      borderRadius: BorderRadius.only(
        bottomLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ));
}

class _BackgroundImage extends StatelessWidget {
  final String img;

  const _BackgroundImage(this.img);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(25),
      child: Container(
        width: double.infinity,
        height: 270,
        child: FadeInImage(
          placeholder: AssetImage(img),
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
