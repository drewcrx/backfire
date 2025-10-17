import 'package:flutter/material.dart';
import 'botones.dart';
import 'registro.dart'; // 👈 Importamos la nueva pantalla de registro

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Login',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.green),
      home: const Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                radius: 100.0,
                backgroundColor: Colors.green,
                backgroundImage: AssetImage(
                  "/src/flutter/examples/cuarto/ejemploa/images/Logo_Negro.jpg.jpeg",
                ),
              ),
              const SizedBox(height: 20.0),
              const Text(
                "Backfire",
                style: TextStyle(
                  fontFamily: "BBH_Sans_Bogle",
                  fontSize: 50.0,
                  color: Colors.green,
                ),
              ),
              const Text(
                "Login",
                style: TextStyle(
                  fontFamily: "BBH_Sans_Bartle",
                  fontSize: 30.0,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30.0),

              // Usuario
              SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Usuario",
                      style: TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      style: const TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Ingrese su usuario",
                        hintStyle: const TextStyle(
                          fontFamily: "BBH_Sans_Bogle",
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20.0),

              // Contraseña
              SizedBox(
                width: 400,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Contraseña",
                      style: TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        fontSize: 16,
                        color: Colors.green,
                      ),
                    ),
                    const SizedBox(height: 5),
                    TextField(
                      obscureText: true,
                      style: const TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        color: Colors.black,
                      ),
                      decoration: InputDecoration(
                        hintText: "Ingrese su contraseña",
                        hintStyle: const TextStyle(
                          fontFamily: "BBH_Sans_Bogle",
                          color: Colors.grey,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20.0),
                          borderSide: const BorderSide(color: Colors.green),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30.0),

              // Botones Ingresar / Registrarse
              SizedBox(
                width: 400,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BotonesPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Ingresar",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.black,
                            fontFamily: "BBH_Sans_Bogle",
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 15.0),
                    Expanded(
                      child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(color: Colors.green, width: 2),
                          padding: const EdgeInsets.symmetric(vertical: 15.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegistroPage(),
                            ),
                          );
                        },
                        child: const Text(
                          "Registrarse",
                          style: TextStyle(
                            fontSize: 18.0,
                            color: Colors.green,
                            fontFamily: "BBH_Sans_Bogle",
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25.0),

              // Botón salir
              SizedBox(
                width: 200,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green.shade800,
                    padding: const EdgeInsets.symmetric(vertical: 15.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Saliendo..."),
                        backgroundColor: Colors.green,
                      ),
                    );
                  },
                  child: const Text(
                    "Salir",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                      fontFamily: "BBH_Sans_Bogle",
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
}
