import '../models/lugar.dart';

const List<String> categorias = ['Todos', 'Monumentos', 'Museos', 'Naturaleza'];

const List<Lugar> lugares = [
  Lugar(
    id: 1,
    nombre: 'Torre Eiffel',
    ciudad: 'París',
    categoria: 'Monumentos',
    descripcionCorta: 'El símbolo de Francia y de la ciudad del amor.',
    descripcionLarga:
        'Inaugurada en 1889 para la Exposición Universal, la Torre Eiffel mide '
        'unos 330 metros y es uno de los monumentos más visitados del mundo. '
        'Puedes subir por las escaleras o en ascensor hasta la cima para ver '
        'todo París. Por la noche se ilumina con miles de luces brillantes.',
    imagen: 'assets/images/eiffel.jpg',
    precio: '€29',
    calificacion: 4.8,
    duracion: '2 - 3 h',
  ),
  Lugar(
    id: 2,
    nombre: 'Museo del Louvre',
    ciudad: 'París',
    categoria: 'Museos',
    descripcionCorta: 'Hogar de la Mona Lisa y miles de obras maestras.',
    descripcionLarga:
        'El Louvre es el museo de arte más grande del mundo. Antiguo palacio '
        'real, hoy guarda obras como la Mona Lisa, la Victoria de Samotracia '
        'y la Venus de Milo. Su famosa pirámide de cristal es la entrada '
        'principal. Se recomienda reservar con anticipación.',
    imagen: 'assets/images/louvre.jpg',
    precio: '€22',
    calificacion: 4.7,
    duracion: '4 - 6 h',
  ),
  Lugar(
    id: 3,
    nombre: 'Mont Saint-Michel',
    ciudad: 'Normandía',
    categoria: 'Monumentos',
    descripcionCorta: 'Una abadía medieval sobre una isla de mareas.',
    descripcionLarga:
        'Esta abadía del siglo VIII se levanta sobre un islote rocoso que, '
        'con la marea alta, queda rodeado por el mar. Es Patrimonio de la '
        'Humanidad y uno de los paisajes más impresionantes de Francia. '
        'Camina por sus callejuelas hasta llegar a la cima de la abadía.',
    imagen: 'assets/images/montsaintmichel.jpg',
    precio: '€13',
    calificacion: 4.9,
    duracion: '5 - 6 h',
  ),
  Lugar(
    id: 4,
    nombre: 'Palacio de Versalles',
    ciudad: 'Versalles',
    categoria: 'Museos',
    descripcionCorta: 'El lujo y los jardines del Rey Sol.',
    descripcionLarga:
        'Residencia de los reyes de Francia durante más de un siglo, el '
        'Palacio de Versalles deslumbra con su Salón de los Espejos, sus '
        'apartamentos reales y sus enormes jardines con fuentes. Queda a '
        'unos 30 minutos de París en tren.',
    imagen: 'assets/images/versalles.jpg',
    precio: '€21',
    calificacion: 4.6,
    duracion: '5 - 7 h',
  ),
  Lugar(
    id: 5,
    nombre: 'Campos de Lavanda',
    ciudad: 'Provenza',
    categoria: 'Naturaleza',
    descripcionCorta: 'Paisajes morados y aroma a campo en verano.',
    descripcionLarga:
        'Entre finales de junio y julio, Provenza se llena de campos de '
        'lavanda que parecen no tener fin. Es ideal para fotografía, '
        'caminatas y para visitar pueblos pintorescos como Gordes y '
        'Sault. Prueba también la miel y los productos de lavanda locales.',
    imagen: 'assets/images/lavanda.jpg',
    precio: 'Gratis',
    calificacion: 4.8,
    duracion: 'Día completo',
  ),
  Lugar(
    id: 6,
    nombre: 'Costa Azul',
    ciudad: 'Niza',
    categoria: 'Naturaleza',
    descripcionCorta: 'Playas, sol y el mar Mediterráneo.',
    descripcionLarga:
        'La Costa Azul (Côte d\'Azur) reúne ciudades como Niza, Cannes y '
        'Saint-Tropez. Disfruta del Paseo de los Ingleses, playas de '
        'aguas turquesas, mercados coloridos y una gastronomía '
        'mediterránea deliciosa.',
    imagen: 'assets/images/costaazul.jpg',
    precio: 'Gratis',
    calificacion: 4.5,
    duracion: '2 - 3 días',
  ),
];
