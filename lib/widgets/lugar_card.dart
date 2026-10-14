import 'package:flutter/material.dart';
import '../models/lugar.dart';

class LugarCard extends StatelessWidget {
  final Lugar lugar;
  final bool favorito;
  final VoidCallback onTap;

  const LugarCard({
    super.key,
    required this.lugar,
    required this.favorito,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.only(bottom: 16),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Hero(
              tag: 'lugar_${lugar.id}',
              child: ImagenLugar(ruta: lugar.imagen, aspectRatio: 16 / 10),
            ),
            Padding(
              padding: const EdgeInsets.all(14),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          lugar.nombre,
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            const Icon(Icons.place, size: 16, color: Colors.red),
                            const SizedBox(width: 4),
                            Text(lugar.ciudad,
                                style: const TextStyle(color: Colors.black54)),
                          ],
                        ),
                        const SizedBox(height: 6),
                        Text(
                          lugar.descripcionCorta,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  if (favorito)
                    const Padding(
                      padding: EdgeInsets.only(left: 8),
                      child: Icon(Icons.favorite, color: Colors.red),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Imagen local con proporción fija (se recorta con BoxFit.cover,
/// nunca se deforma) y respaldo si el archivo no existe.
class ImagenLugar extends StatelessWidget {
  final String ruta;
  final double aspectRatio;

  const ImagenLugar({super.key, required this.ruta, this.aspectRatio = 3 / 2});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: aspectRatio,
      child: Image.asset(
        ruta,
        fit: BoxFit.cover,
        alignment: Alignment.center,
        filterQuality: FilterQuality.high,
        errorBuilder: (context, error, stack) => Container(
          color: const Color(0xFFDDE3F5),
          child: const Icon(Icons.image_not_supported,
              size: 48, color: Color(0xFF1F3A93)),
        ),
      ),
    );
  }
}
