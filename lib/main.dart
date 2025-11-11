import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// Importación necesaria para usar Haptic Feedback
import 'package:flutter/services.dart';

// Main application start point
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const CupertinoApp(
      debugShowCheckedModeBanner: false,
      title: 'Ejemplo Navegación y ListView (Cupertino)',
      home: WelcomePage(),
    );
  }
}

// NUEVA PALETA DE COLORES - Inspirada en Champions League
class AppColors {
  // Color principal: Azul oscuro elegante (Champions League)
  static const Color primary = Color(0xFF0B1F3F);

  // Color secundario: Azul mediano para contraste
  static const Color secondary = Color(0xFF1E3A5F);

  // Color de acento: Dorado/Oro (estrellas Champions)
  static const Color accent = Color(0xFFFFB800);

  // Color de acento suave
  static const Color accentLight = Color(0xFFFFC933);

  // Gradiente para fondos especiales
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF0B1F3F), Color(0xFF1E3A5F)],
  );
}

// --- Clase 'WelcomePage' (SIN CAMBIOS) ---
class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Ícono principal con borde dorado
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: CupertinoColors.white,
                    borderRadius: BorderRadius.circular(65),
                    border: Border.all(color: AppColors.accent, width: 4),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.3),
                        blurRadius: 20,
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.sportscourt_fill,
                    color: AppColors.primary,
                    size: 65,
                  ),
                ),
                const SizedBox(height: 35),

                // Título de la app con efecto dorado
                const Text(
                  "Champions App",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accent,
                    fontSize: 38,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 12),

                // Subtítulo descriptivo
                const Text(
                  "Administra y vive la emoción del fútbol europeo",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: CupertinoColors.white,
                    fontSize: 16,
                    letterSpacing: 0.5,
                  ),
                ),
                const SizedBox(height: 50),

                // Botón con nuevo diseño dorado
                CupertinoButton(
                  onPressed: () {
                    // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      CupertinoPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  padding: EdgeInsets.zero,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 16,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.accent,
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.accent.withOpacity(0.4),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          CupertinoIcons.person_alt_circle_fill,
                          color: AppColors.primary,
                          size: 24,
                        ),
                        SizedBox(width: 12),
                        Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: AppColors.primary,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 35),

                // Texto decorativo inferior
                const Text(
                  "⚽ Tu portal a la Champions League 2025 ⚽",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: AppColors.accentLight,
                    fontSize: 14,
                    fontStyle: FontStyle.italic,
                    letterSpacing: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// --- Clase 'LoginPage' (Ajuste Haptic Feedback) ---
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Iniciar Sesión",
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: AppColors.primary,
        border: null,
      ),
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 40),
            child: Container(
              margin: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: CupertinoColors.white,
                borderRadius: BorderRadius.circular(25),
                boxShadow: [
                  BoxShadow(
                    color: CupertinoColors.black.withOpacity(0.2),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Icono con borde dorado
                    Container(
                      width: 95,
                      height: 95,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(47.5),
                        border: Border.all(color: AppColors.accent, width: 3),
                      ),
                      child: const Icon(
                        CupertinoIcons.sportscourt_fill,
                        color: AppColors.accent,
                        size: 48,
                      ),
                    ),
                    const SizedBox(height: 22),
                    const Text(
                      "Bienvenido a Champions App",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    const SizedBox(height: 30),

                    // Email TextField
                    CupertinoTextField(
                      controller: emailController,
                      placeholder: "Correo electrónico",
                      keyboardType: TextInputType.emailAddress,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          CupertinoIcons.mail_solid,
                          color: AppColors.secondary,
                        ),
                      ),
                      style: const TextStyle(color: CupertinoColors.label),
                    ),
                    const SizedBox(height: 18),

                    // Password TextField
                    CupertinoTextField(
                      controller: passwordController,
                      placeholder: "Contraseña",
                      obscureText: true,
                      padding: const EdgeInsets.all(16.0),
                      decoration: BoxDecoration(
                        color: CupertinoColors.systemGrey6,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: CupertinoColors.systemGrey4,
                          width: 1,
                        ),
                      ),
                      prefix: const Padding(
                        padding: EdgeInsets.only(left: 15.0),
                        child: Icon(
                          CupertinoIcons.lock_fill,
                          color: AppColors.secondary,
                        ),
                      ),
                      style: const TextStyle(color: CupertinoColors.label),
                    ),
                    const SizedBox(height: 32),

                    // Login Button con nuevo color
                    CupertinoButton(
                      onPressed: () {
                        // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                        HapticFeedback.heavyImpact();
                        Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (context) => const MenuPage(),
                          ),
                        );
                      },
                      padding: EdgeInsets.zero,
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        decoration: BoxDecoration(
                          color: AppColors.accent,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: [
                            BoxShadow(
                              color: AppColors.accent.withOpacity(0.3),
                              blurRadius: 10,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "INICIAR SESIÓN",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 18),

                    // Back to Welcome Button
                    CupertinoButton(
                      onPressed: () {
                        // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                        HapticFeedback.lightImpact();
                        Navigator.pop(context);
                      },
                      padding: EdgeInsets.zero,
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.back,
                            color: AppColors.secondary,
                            size: 20,
                          ),
                          SizedBox(width: 6),
                          Text(
                            "Volver a inicio",
                            style: TextStyle(
                              color: AppColors.secondary,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

// --- Clase 'MenuPage' (Ajuste Haptic Feedback) ---
class MenuPage extends StatelessWidget {
  const MenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Menú Principal",
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: AppColors.primary,
        border: null,
      ),
      child: Container(
        decoration: const BoxDecoration(
          gradient: AppColors.primaryGradient,
        ), // APLICANDO GRADIENTE
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              const SizedBox(height: 20),
              // Ícono de App con borde dorado
              Center(
                child: Container(
                  width: 110,
                  height: 110,
                  decoration: BoxDecoration(
                    color: AppColors.primary,
                    borderRadius: BorderRadius.circular(55),
                    border: Border.all(color: AppColors.accent, width: 3),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.2),
                        blurRadius: 15,
                        spreadRadius: 1,
                      ),
                    ],
                  ),
                  child: const Icon(
                    CupertinoIcons.sportscourt_fill,
                    color: AppColors.accent,
                    size: 55,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Champions App",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  // Cambiado el color del texto a dorado para mejor contraste
                  color: AppColors.accentLight,
                ),
              ),
              const SizedBox(height: 40),

              // Option 1: Home
              _MenuButton(
                icon: CupertinoIcons.house_fill,
                text: "Home - Partidos",
                color: AppColors.primary,
                onTap: () {
                  // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                  HapticFeedback.selectionClick();
                  Navigator.push(
                    context,
                    CupertinoPageRoute(builder: (_) => const ListViewPage()),
                  );
                },
              ),

              const SizedBox(height: 15),

              // Option 2: Registrar Partido
              _MenuButton(
                icon: CupertinoIcons.plus_circle_fill,
                text: "Registrar Partido",
                color: AppColors.accent,
                onTap: () {
                  // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                  HapticFeedback.selectionClick();
                  Navigator.push(
                    context,
                    CupertinoPageRoute(
                      builder: (_) => const RegistroPartidoPage(),
                    ),
                  );
                },
              ),

              const SizedBox(height: 15),

              // Option 3: Logout
              _MenuButton(
                icon: CupertinoIcons.arrow_left_circle_fill,
                text: "Cerrar Sesión",
                color: CupertinoColors.systemRed,
                onTap: () {
                  // **IMPLEMENTACIÓN HAPTIC FEEDBACK**
                  HapticFeedback.lightImpact();
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// --- Clase '_MenuButton' (SIN CAMBIOS) ---
class _MenuButton extends StatelessWidget {
  final IconData icon;
  final String text;
  final Color color;
  final VoidCallback onTap;

  const _MenuButton({
    required this.icon,
    required this.text,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,
      minSize: 0,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 22),
        decoration: BoxDecoration(
          color: CupertinoColors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: color.withOpacity(0.2), width: 1.5),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(icon, color: color, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w600,
                  color: color,
                ),
              ),
            ),
            Icon(
              CupertinoIcons.right_chevron,
              size: 18,
              color: color.withOpacity(0.6),
            ),
          ],
        ),
      ),
    );
  }
}

// ---------------------- LISTVIEW PAGE (Con Buscador y Filtro) ----------------------
class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  // 💡 Datos de Partidos (Añadimos tipo para el filtro)
  final Map<String, Map<String, List<Map<String, String>>>> partidosData =
      const {
        'Octubre 2025': {
          'Martes 14': [
            {'partido': 'Real Madrid vs Manchester City', 'tipo': 'Ida'},
            {'partido': 'PSG vs Bayern Múnich', 'tipo': 'Ida'},
          ],
          'Miércoles 15': [
            {'partido': 'Barcelona vs Inter de Milán', 'tipo': 'Ida'},
            {'partido': 'Liverpool vs Atlético de Madrid', 'tipo': 'Ida'},
          ],
        },
        'Noviembre 2025': {
          'Martes 4': [
            {'partido': 'Juventus vs Arsenal', 'tipo': 'Vuelta'},
            {'partido': 'Chelsea vs Borussia Dortmund', 'tipo': 'Vuelta'},
          ],
          'Miércoles 5': [
            {'partido': 'AC Milan vs Porto', 'tipo': 'Vuelta'},
            {'partido': 'Benfica vs Sevilla', 'tipo': 'Vuelta'},
          ],
        },
        'Diciembre 2025': {
          'Martes 9': [
            {'partido': 'Manchester United vs PSG', 'tipo': 'Final'},
            {'partido': 'Real Sociedad vs Napoli', 'tipo': 'Final'},
          ],
          'Miércoles 10': [
            {'partido': 'Bayern Múnich vs Barcelona', 'tipo': 'Final'},
            {'partido': 'Liverpool vs Inter de Milán', 'tipo': 'Final'},
          ],
        },
      };

  // 💡 Estado para la búsqueda y el filtro
  String _searchText = '';
  String _selectedFilter = 'Todos';
  final Map<String, dynamic> _filterOptions = const {
    'Todos': 0,
    'Ida': 1,
    'Vuelta': 2,
    'Final': 3,
  };

  // Lógica de Filtrado
  Map<String, Map<String, List<Map<String, String>>>> _getFilteredPartidos() {
    if (_searchText.isEmpty && _selectedFilter == 'Todos') {
      return partidosData;
    }

    final filteredData = <String, Map<String, List<Map<String, String>>>>{};
    final filterType = _selectedFilter;

    partidosData.forEach((mesKey, dias) {
      final filteredDias = <String, List<Map<String, String>>>{};
      dias.forEach((diaKey, partidos) {
        final filteredPartidos = partidos.where((partido) {
          final matchesSearch = partido['partido']!.toLowerCase().contains(
            _searchText.toLowerCase(),
          );
          final matchesFilter =
              filterType == 'Todos' || partido['tipo'] == filterType;
          return matchesSearch && matchesFilter;
        }).toList();

        if (filteredPartidos.isNotEmpty) {
          filteredDias[diaKey] = filteredPartidos;
        }
      });

      if (filteredDias.isNotEmpty) {
        filteredData[mesKey] = filteredDias;
      }
    });
    return filteredData;
  }

  List<Widget> _buildNestedSections(
    Map<String, List<Map<String, String>>> dias,
  ) {
    return dias.entries.map((diaEntry) {
      return Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          right: 10.0,
          top: 5,
          bottom: 5,
        ),
        child: Container(
          decoration: BoxDecoration(
            color: CupertinoColors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: CupertinoColors.black.withOpacity(0.1),
                blurRadius: 5,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, top: 12, bottom: 6),
                child: Row(
                  children: [
                    Container(
                      width: 4,
                      height: 18,
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      diaEntry.key,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: AppColors.primary,
                      ),
                    ),
                  ],
                ),
              ),
              ...diaEntry.value.map((partido) {
                return Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Column(
                    children: [
                      CupertinoListTile(
                        title: Text(
                          partido['partido']!, // Usamos la clave 'partido'
                          style: const TextStyle(
                            fontSize: 15,
                            color: AppColors.primary,
                          ),
                        ),
                        // 💡 Mostramos el tipo de partido como subtítulo o trailing
                        subtitle: Text(
                          partido['tipo']!,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.secondary,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        leading: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: AppColors.accent.withOpacity(0.15),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            CupertinoIcons.sportscourt,
                            color: AppColors.primary,
                            size: 20,
                          ),
                        ),
                        onTap: () {
                          // 💡 IMPLEMENTACIÓN: Context Menu
                          HapticFeedback.lightImpact();
                          _showMatchOptions(context, partido['partido']!);
                        },
                      ),
                      const Divider(
                        height: 1,
                        indent: 50,
                        color: CupertinoColors.systemGrey5,
                      ),
                    ],
                  ),
                );
              }).toList(),
            ],
          ),
        ),
      );
    }).toList();
  }

  // 💡 Función para mostrar CupertinoActionSheet
  void _showMatchOptions(BuildContext context, String matchName) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: Text(
          matchName,
          style: const TextStyle(color: AppColors.primary),
        ),
        message: const Text('Opciones disponibles para este partido:'),
        actions: <CupertinoActionSheetAction>[
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // Lógica para ver detalles
            },
            child: const Text(
              'Ver Detalles',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
          CupertinoActionSheetAction(
            onPressed: () {
              Navigator.pop(context);
              // Lógica para editar
            },
            child: const Text(
              'Editar Partido',
              style: TextStyle(color: AppColors.primary),
            ),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          isDefaultAction: true,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text(
            'Cancelar',
            style: TextStyle(color: CupertinoColors.systemRed),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final filteredPartidos = _getFilteredPartidos();

    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Partidos Champions League 2025",
          style: TextStyle(color: CupertinoColors.white, fontSize: 16),
        ),
        backgroundColor: AppColors.primary,
        border: null,
      ),
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: CupertinoScrollbar(
            // 💡 IMPLEMENTACIÓN: CupertinoScrollbar
            child: ListView(
              padding: const EdgeInsets.all(12),
              children: [
                // 💡 IMPLEMENTACIÓN: CupertinoSearchTextField
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 8.0,
                  ),
                  child: CupertinoSearchTextField(
                    placeholder: 'Buscar equipos...',
                    onChanged: (value) {
                      setState(() {
                        _searchText = value;
                      });
                    },
                  ),
                ),

                // 💡 IMPLEMENTACIÓN: CupertinoSegmentedControl (Filtro)
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10.0,
                    vertical: 12.0,
                  ),
                  child: CupertinoSlidingSegmentedControl<String>(
                    // Usamos SlidingSegmentedControl para un estilo más moderno
                    groupValue: _selectedFilter,
                    backgroundColor: AppColors.primary,
                    thumbColor: AppColors.accent,
                    onValueChanged: (String? value) {
                      if (value != null) {
                        setState(() {
                          _selectedFilter = value;
                        });
                      }
                    },
                    children: _filterOptions.map((key, value) {
                      return MapEntry(
                        key,
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 5,
                            vertical: 8,
                          ),
                          child: Text(
                            key,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              color: _selectedFilter == key
                                  ? AppColors.primary
                                  : CupertinoColors.white,
                            ),
                          ),
                        ),
                      );
                    }),
                  ),
                ),

                // Lista de partidos filtrada
                ...filteredPartidos.entries.map((mesEntry) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 15.0,
                        ),
                        child: Row(
                          children: [
                            const Icon(
                              CupertinoIcons.calendar,
                              color: AppColors.accent,
                              size: 20,
                            ),
                            const SizedBox(width: 8),
                            Text(
                              mesEntry.key,
                              style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: CupertinoColors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      ..._buildNestedSections(mesEntry.value),
                      const SizedBox(height: 20),
                    ],
                  );
                }).toList(),

                // Si no hay partidos, mostramos un mensaje
                if (filteredPartidos.isEmpty)
                  const Padding(
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
                      child: Text(
                        "No se encontraron partidos para la búsqueda/filtro.",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: CupertinoColors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 20),
                Center(
                  child: CupertinoButton(
                    onPressed: () {
                      HapticFeedback.lightImpact();
                      Navigator.pop(context);
                    },
                    padding: EdgeInsets.zero,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 40,
                        vertical: 14,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.accent,
                        borderRadius: BorderRadius.circular(14),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.accent.withOpacity(0.3),
                            blurRadius: 10,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            CupertinoIcons.house_fill,
                            size: 20,
                            color: AppColors.primary,
                          ),
                          SizedBox(width: 10),
                          Text(
                            "Volver al Menú",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// ---------------------- REGISTRO DE PARTIDO (Con Activity Indicator) ----------------------
class RegistroPartidoPage extends StatefulWidget {
  const RegistroPartidoPage({super.key});

  @override
  State<RegistroPartidoPage> createState() => _RegistroPartidoPageState();
}

class _RegistroPartidoPageState extends State<RegistroPartidoPage> {
  final TextEditingController localController = TextEditingController();
  final TextEditingController visitanteController = TextEditingController();
  final TextEditingController estadioController = TextEditingController();

  // 💡 Estado de carga
  bool _isLoading = false;

  DateTime _selectedDate = DateTime.now();

  @override
  void dispose() {
    localController.dispose();
    visitanteController.dispose();
    estadioController.dispose();
    super.dispose();
  }

  void _showDatePicker(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Container(
        height: 216,
        padding: const EdgeInsets.only(top: 6.0),
        margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        color: CupertinoColors.systemBackground.resolveFrom(context),
        child: SafeArea(
          top: false,
          child: CupertinoDatePicker(
            initialDateTime: _selectedDate,
            mode: CupertinoDatePickerMode.date,
            onDateTimeChanged: (DateTime newDate) {
              setState(() {
                _selectedDate = newDate;
              });
            },
          ),
        ),
      ),
    );
  }

  Widget _buildDateSelector(BuildContext context) {
    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 15),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Icon(
          CupertinoIcons.calendar,
          color: AppColors.primary,
          size: 22,
        ),
      ),
      title: const Text(
        "Fecha del Partido",
        style: TextStyle(color: CupertinoColors.label, fontSize: 16),
      ),
      trailing: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          "${_selectedDate.day.toString().padLeft(2, '0')}/${_selectedDate.month.toString().padLeft(2, '0')}/${_selectedDate.year}",
          style: const TextStyle(
            color: AppColors.primary,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      onTap: () => _showDatePicker(context),
    );
  }

  // 💡 Función de guardado con simulación de carga y haptic
  void _savePartido() async {
    // 💡 IMPLEMENTACIÓN: Haptic Feedback al iniciar la acción
    HapticFeedback.heavyImpact();

    setState(() {
      _isLoading = true; // Mostrar el indicador de carga
    });

    // Simular un retraso en la red/base de datos
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      _isLoading = false;
    });

    showCupertinoDialog<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text("Registro Exitoso"),
        content: Text(
          "Partido registrado para el ${_selectedDate.day}/${_selectedDate.month}/${_selectedDate.year} ✅",
        ),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            isDefaultAction: true,
            onPressed: () {
              Navigator.pop(context);
              Navigator.pop(context);
            },
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text(
          "Registrar Partido",
          style: TextStyle(color: CupertinoColors.white),
        ),
        backgroundColor: AppColors.primary,
        border: null,
      ),
      child: Container(
        decoration: const BoxDecoration(gradient: AppColors.primaryGradient),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(20.0),
            children: [
              // Contenedor flotante de inputs
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 5.0),
                decoration: BoxDecoration(
                  color: CupertinoColors.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: CupertinoColors.black.withOpacity(0.2),
                      blurRadius: 10,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Encabezado "Detalles del Partido"
                    const Padding(
                      padding: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 10.0),
                      child: Row(
                        children: [
                          Icon(
                            CupertinoIcons.doc_text_fill,
                            color: AppColors.accent,
                            size: 18,
                          ),
                          SizedBox(width: 8),
                          Text(
                            "Detalles del Partido",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Inputs con separadores manuales
                    _buildCupertinoListTile(
                      controller: localController,
                      placeholder: "Equipo Local",
                      icon: CupertinoIcons.flag_fill,
                    ),
                    const Divider(
                      color: CupertinoColors.systemGrey5,
                      height: 1.0,
                      indent: 55,
                    ),
                    _buildCupertinoListTile(
                      controller: visitanteController,
                      placeholder: "Equipo Visitante",
                      icon: CupertinoIcons.flag,
                    ),
                    const Divider(
                      color: CupertinoColors.systemGrey5,
                      height: 1.0,
                      indent: 55,
                    ),
                    _buildDateSelector(context),
                    const Divider(
                      color: CupertinoColors.systemGrey5,
                      height: 1.0,
                      indent: 55,
                    ),
                    _buildCupertinoListTile(
                      controller: estadioController,
                      placeholder: "Estadio",
                      icon: CupertinoIcons.location_fill,
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Save Button (Botón guardar) con indicador de carga
              CupertinoButton(
                onPressed: _isLoading
                    ? null
                    : _savePartido, // Deshabilitar si está cargando
                padding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: BoxDecoration(
                    color: _isLoading
                        ? AppColors.accent.withOpacity(0.5)
                        : AppColors.accent, // Color atenuado si carga
                    borderRadius: BorderRadius.circular(15),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.accent.withOpacity(0.3),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    // 💡 IMPLEMENTACIÓN: CupertinoActivityIndicator
                    child: _isLoading
                        ? const CupertinoActivityIndicator(
                            color: AppColors.primary,
                            radius: 14.0,
                          )
                        : const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                CupertinoIcons.checkmark_circle_fill,
                                color: AppColors.primary,
                              ),
                              SizedBox(width: 10),
                              Text(
                                "Guardar Partido",
                                style: TextStyle(
                                  color: AppColors.primary,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCupertinoListTile({
    required TextEditingController controller,
    required String placeholder,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return CupertinoListTile(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 15),
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: AppColors.accent.withOpacity(0.15),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: CupertinoTextField(
        controller: controller,
        placeholder: placeholder,
        keyboardType: keyboardType,
        decoration: const BoxDecoration(color: CupertinoColors.white),
        padding: const EdgeInsets.symmetric(vertical: 15),
        clearButtonMode: OverlayVisibilityMode.editing,
        textAlignVertical: TextAlignVertical.center,
        style: const TextStyle(fontSize: 16, color: CupertinoColors.black),
      ),
      onTap: () {},
      trailing: const SizedBox.shrink(),
    );
  }
}
