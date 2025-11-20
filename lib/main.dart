import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const BatmanApp());
}

class BatmanApp extends StatelessWidget {
  const BatmanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Batman App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        colorScheme: const ColorScheme.dark(primary: Colors.yellow),
        textTheme: GoogleFonts.bebasNeueTextTheme(ThemeData.dark().textTheme),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black,
          elevation: 0,
        ),
      ),
      home: const SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 2200), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const LoginPage()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
                  'BATMAN',
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      fontSize: 72,
                      color: Colors.yellow,
                      letterSpacing: 6,
                    ),
                  ),
                )
                .animate()
                .fadeIn(duration: 800.ms)
                .scale(begin: const Offset(0.8, 0.8), end: const Offset(1, 1))
                .then()
                .fadeOut(duration: 300.ms),

            const SizedBox(height: 10),

            Text(
              'Gotham Edition',
              style: GoogleFonts.barlowCondensed(
                textStyle: const TextStyle(fontSize: 16, color: Colors.white70),
              ),
            ).animate().fadeIn(duration: 900.ms),
          ],
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _emailC = TextEditingController();
  final _passC = TextEditingController();

  @override
  void dispose() {
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _emailC,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
            ).animate().fadeIn(duration: 300.ms),

            const SizedBox(height: 12),

            TextField(
              controller: _passC,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
            ).animate().fadeIn(duration: 300.ms),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(44),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => const MainMenu()),
                );
              },
              child: const Text('Login'),
            ).animate().fadeIn(duration: 300.ms),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const RegisterPage()),
                );
              },
              child: const Text('Belum punya akun? Register'),
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _nameC = TextEditingController();
  final _emailC = TextEditingController();
  final _passC = TextEditingController();

  @override
  void dispose() {
    _nameC.dispose();
    _emailC.dispose();
    _passC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nameC,
              decoration: const InputDecoration(
                labelText: 'Nama',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _emailC,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 12),

            TextField(
              controller: _passC,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),

            const SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
                minimumSize: const Size.fromHeight(44),
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Daftar'),
            ),
          ],
        ),
      ),
    );
  }
}

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  int currentIndex = 0;

  static const pages = [BatmanGridPage(), LibraryPage(), AboutPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        backgroundColor: Colors.grey[900],
        selectedItemColor: Colors.yellow,
        unselectedItemColor: Colors.white,
        onTap: (i) => setState(() => currentIndex = i),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.grid_view), label: 'Items'),
          BottomNavigationBarItem(
            icon: Icon(Icons.auto_stories),
            label: 'Library',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: 'About'),
        ],
      ),
    );
  }
}

class BatmanGridPage extends StatelessWidget {
  const BatmanGridPage({super.key});

  @override
  Widget build(BuildContext context) {
    final items = [
      'Batmobile',
      'Bat-Signal',
      'Gotham City',
      'Joker',
      'Catwoman',
      'Robin',
    ];

    return Scaffold(
      appBar: AppBar(title: const Text('Batman Items')),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: GridView.builder(
          itemCount: items.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 12,
            crossAxisSpacing: 12,
            childAspectRatio: 1.1,
          ),
          itemBuilder: (context, i) {
            return Container(
              decoration: BoxDecoration(
                color: Colors.grey[850],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.yellow.withOpacity(0.15)),
              ),
              child: Center(
                child: Text(
                  items[i],
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      color: Colors.yellow,
                      fontSize: 22,
                      letterSpacing: 1.2,
                    ),
                  ),
                ).animate().fadeIn(duration: 400.ms),
              ),
            );
          },
        ),
      ),
    );
  }
}

class LibraryPage extends StatefulWidget {
  const LibraryPage({super.key});

  @override
  State<LibraryPage> createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  int activeIndex = -1;

  final effects = [
    'Batarang Spin Effect',
    'Bat-Signal Flash Effect',
    'Shadow Fade Effect',
    'Joker Shake Effect',
    'Gotham Pulse Effect',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Library (Batman Effects)')),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Center(
              child:
                  Text(
                        'GOTHAM EFFECTS',
                        style: GoogleFonts.bebasNeue(
                          textStyle: const TextStyle(
                            fontSize: 36,
                            color: Colors.yellow,
                            letterSpacing: 3,
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 600.ms)
                      .shake(duration: 600.ms, hz: 2),
            ),

            const SizedBox(height: 20),

            Expanded(
              child: ListView.builder(
                itemCount: effects.length,
                itemBuilder: (context, i) {
                  bool isActive = activeIndex == i;

                  return GestureDetector(
                        onTap: () {
                          setState(() => activeIndex = i);

                          Future.delayed(const Duration(milliseconds: 900), () {
                            setState(() => activeIndex = -1);
                          });
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 300),
                          margin: const EdgeInsets.only(bottom: 15),
                          padding: const EdgeInsets.all(18),
                          decoration: BoxDecoration(
                            color: isActive
                                ? Colors.yellow[800]
                                : Colors.grey[900],
                            borderRadius: BorderRadius.circular(14),
                            boxShadow: isActive
                                ? [
                                    BoxShadow(
                                      color: Colors.yellow.withOpacity(0.7),
                                      blurRadius: 20,
                                      spreadRadius: 2,
                                    ),
                                  ]
                                : [],
                            border: Border.all(
                              color: Colors.yellow.withOpacity(0.2),
                            ),
                          ),
                          child: Row(
                            children: [
                              Icon(
                                    Icons.flash_on,
                                    color: isActive
                                        ? Colors.black
                                        : Colors.yellowAccent,
                                    size: 32,
                                  )
                                  .animate(target: isActive ? 1 : 0)
                                  .scale(
                                    begin: const Offset(1, 1),
                                    end: const Offset(1.3, 1.3),
                                    duration: 300.ms,
                                  )
                                  .rotate(begin: 0, end: 0.3)
                                  .shake(hz: 4, duration: 400.ms),

                              const SizedBox(width: 15),

                              Expanded(
                                child:
                                    Text(
                                          effects[i],
                                          style: GoogleFonts.bebasNeue(
                                            textStyle: TextStyle(
                                              color: isActive
                                                  ? Colors.black
                                                  : Colors.white,
                                              fontSize: 24,
                                              letterSpacing: 2,
                                            ),
                                          ),
                                        )
                                        .animate(target: isActive ? 1 : 0)
                                        .fadeIn(duration: 200.ms)
                                        .slideX(begin: -0.3, end: 0),
                              ),
                            ],
                          ),
                        ),
                      )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideY(begin: 0.3, end: 0);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About Aplikasi')),
      body: Center(
        child: Text(
          'Aplikasi Batman\n\nCopyright © '
          'Mochammad Andwi Haikal - 23552011011',
          textAlign: TextAlign.center,
          style: GoogleFonts.barlowCondensed(
            textStyle: const TextStyle(
              fontSize: 18,
              color: Colors.yellow,
              height: 1.4,
            ),
          ),
        ),
      ),
    );
  }
}
