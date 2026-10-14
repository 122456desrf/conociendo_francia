import 'package:flutter/material.dart';
import '../data/lugares_data.dart';
import '../models/lugar.dart';
import '../widgets/lugar_card.dart';
import 'detail_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _categoria = 'Todos';
  String _busqueda = '';
  final Set<int> _favoritos = {};

  List<Lugar> get _filtrados {
    return lugares.where((l) {
      final okCategoria = _categoria == 'Todos' || l.categoria == _categoria;
      final q = _busqueda.toLowerCase();
      final okBusqueda = l.nombre.toLowerCase().contains(q) ||
          l.ciudad.toLowerCase().contains(q);
      return okCategoria && okBusqueda;
    }).toList();
  }

  Future<void> _abrirDetalle(Lugar lugar) async {
    // Se espera (async/await) el resultado que devuelve Navigator.pop
    final esFavorito = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          lugar: lugar,
          favoritoInicial: _favoritos.contains(lugar.id),
        ),
      ),
    );
    if (esFavorito == null) return;
    setState(() {
      esFavorito ? _favoritos.add(lugar.id) : _favoritos.remove(lugar.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    final lista = _filtrados;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Conociendo Francia'),
        actions: [
          IconButton(
            icon: const Icon(Icons.account_circle, size: 30),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('Favoritos guardados: ${_favoritos.length}')),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: TextField(
              onChanged: (v) => setState(() => _busqueda = v),
              decoration: InputDecoration(
                hintText: 'Buscar lugar o ciudad...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: categorias.length,
              separatorBuilder: (_, __) => const SizedBox(width: 8),
              itemBuilder: (context, i) {
                final cat = categorias[i];
                return ChoiceChip(
                  label: Text(cat),
                  selected: _categoria == cat,
                  onSelected: (_) => setState(() => _categoria = cat),
                );
              },
            ),
          ),
          Expanded(
            child: lista.isEmpty
                ? const Center(child: Text('No se encontraron lugares'))
                : ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: lista.length,
                    itemBuilder: (context, i) {
                      final lugar = lista[i];
                      return LugarCard(
                        lugar: lugar,
                        favorito: _favoritos.contains(lugar.id),
                        onTap: () => _abrirDetalle(lugar),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
