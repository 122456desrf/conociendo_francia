class Lugar {
  final int id;
  final String nombre;
  final String ciudad;
  final String categoria;
  final String descripcionCorta;
  final String descripcionLarga;
  final String imagen;
  final String precio;
  final double calificacion;
  final String duracion;

  const Lugar({
    required this.id,
    required this.nombre,
    required this.ciudad,
    required this.categoria,
    required this.descripcionCorta,
    required this.descripcionLarga,
    required this.imagen,
    required this.precio,
    required this.calificacion,
    required this.duracion,
  });
}
