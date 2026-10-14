import 'package:flutter/material.dart';
import '../models/lugar.dart';
import '../widgets/lugar_card.dart';

class DetailScreen extends StatefulWidget {
  final Lugar lugar;
  final bool favoritoInicial;

  const DetailScreen({
    super.key,
    required this.lugar,
    this.favoritoInicial = false,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  late bool _favorito = widget.favoritoInicial;

  @override
  Widget build(BuildContext context) {
    final l = widget.lugar;
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) Navigator.pop(context, _favorito);
      },
      child: Scaffold(
        appBar: AppBar(title: Text(l.nombre)),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
                child: Hero(
                  tag: 'lugar_${l.id}',
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ImagenLugar(ruta: l.imagen, aspectRatio: 3 / 2),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l.nombre,
                        style: const TextStyle(
                            fontSize: 26, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 6),
                    Row(
                      children: [
                        const Icon(Icons.place, color: Colors.red, size: 18),
                        const SizedBox(width: 4),
                        Text(l.ciudad,
                            style: const TextStyle(
                                fontSize: 16, color: Colors.black54)),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _info(Icons.star, Colors.amber, '${l.calificacion}',
                            'Calificación'),
                        _info(Icons.payments, Colors.green, l.precio, 'Precio'),
                        _info(Icons.schedule, Colors.blue, l.duracion,
                            'Duración'),
                      ],
                    ),
                    const SizedBox(height: 24),
                    const Text('Acerca de este lugar',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    const SizedBox(height: 8),
                    Text(l.descripcionLarga,
                        style: const TextStyle(fontSize: 16, height: 1.5)),
                    const SizedBox(height: 28),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          setState(() => _favorito = !_favorito);
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(_favorito
                                  ? 'Agregado a favoritos'
                                  : 'Quitado de favoritos'),
                              duration: const Duration(seconds: 1),
                            ),
                          );
                        },
                        icon: Icon(_favorito
                            ? Icons.favorite
                            : Icons.favorite_border),
                        label: Text(_favorito
                            ? 'En favoritos'
                            : 'Agregar a favoritos'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: _favorito
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(context).colorScheme.primary,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _info(IconData icono, Color color, String valor, String etiqueta) {
    return Column(
      children: [
        Icon(icono, color: color, size: 30),
        const SizedBox(height: 4),
        Text(valor, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text(etiqueta,
            style: const TextStyle(fontSize: 12, color: Colors.black54)),
      ],
    );
  }
}
