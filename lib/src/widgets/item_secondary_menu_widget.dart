import 'package:flutter/material.dart';

class ItemSecondaryMenu extends StatelessWidget {
  final String img;
  final String titulo;
  final String subtitulo;
  final String? mode;
  final String? route;

  const ItemSecondaryMenu(
      {Key? key,
      required this.img,
      required this.titulo,
      required this.subtitulo,
      this.mode,
      this.route})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: _cardDecoration(),
        width: double.infinity,
        child: InkWell(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _PrincipalImg(img),
              _ItemDetails(titulo, subtitulo),
            ],
          ),
        ),
      ),
    );
  }

  BoxDecoration _cardDecoration() => BoxDecoration(
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
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              color: Colors.deepOrange,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            subtitulo,
            style: const TextStyle(
              color: Colors.black54,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }
}

class _PrincipalImg extends StatelessWidget {
  final String img;

  const _PrincipalImg(this.img);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(25),
        topRight: Radius.circular(25),
      ),
      child: Container(
        height: 110,
        child: FadeInImage(
          width: double.infinity,
          placeholder: AssetImage(img),
          image: AssetImage(img),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
