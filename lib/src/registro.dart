import 'package:flutter/material.dart';

class RegistroPage extends StatefulWidget {
  const RegistroPage({super.key});

  @override
  State<RegistroPage> createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  String? generoSeleccionado;
  String? provinciaSeleccionada;
  DateTime? fechaSeleccionada;

  final List<String> provincias = [
    "Azuay",
    "Bolívar",
    "Cañar",
    "Carchi",
    "Chimborazo",
    "Cotopaxi",
    "El Oro",
    "Esmeraldas",
    "Galápagos",
    "Guayas",
    "Imbabura",
    "Loja",
    "Los Ríos",
    "Manabí",
    "Morona Santiago",
    "Napo",
    "Orellana",
    "Pastaza",
    "Pichincha",
    "Santa Elena",
    "Santo Domingo de los Tsáchilas",
    "Sucumbíos",
    "Tungurahua",
    "Zamora Chinchipe",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: const Text(
          "Registro de Usuario",
          style: TextStyle(
            fontFamily: "BBH_Sans_Bogle",
            color: Colors.black,
            fontSize: 24,
          ),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Complete los datos",
              style: TextStyle(
                fontFamily: "BBH_Sans_Bogle",
                fontSize: 22,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildCampo("N° Control")),
                const SizedBox(width: 10),
                Expanded(child: _buildCampo("CURP")),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildCampo("Nombre(s)")),
                const SizedBox(width: 10),
                Expanded(child: _buildCampo("Usuario")),
              ],
            ),
            const SizedBox(height: 20),

            Row(
              children: [
                Expanded(child: _buildCampo("Apellido Paterno")),
                const SizedBox(width: 10),
                Expanded(child: _buildCampo("Apellido Materno")),
              ],
            ),
            const SizedBox(height: 20),

            _buildCampo("Password", esPassword: true),
            const SizedBox(height: 20),

            // Campo de fecha agregado
            const Text(
              "Fecha de nacimiento",
              style: TextStyle(
                fontFamily: "BBH_Sans_Bogle",
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 5),
            GestureDetector(
              onTap: () async {
                DateTime? nuevaFecha = await showDatePicker(
                  context: context,
                  initialDate: DateTime(2000),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: const ColorScheme.light(
                          primary: Colors.green,
                          onPrimary: Colors.black,
                          onSurface: Colors.black,
                        ),
                      ),
                      child: child!,
                    );
                  },
                );
                if (nuevaFecha != null) {
                  setState(() {
                    fechaSeleccionada = nuevaFecha;
                  });
                }
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Text(
                  fechaSeleccionada == null
                      ? "Seleccione una fecha"
                      : "${fechaSeleccionada!.day}/${fechaSeleccionada!.month}/${fechaSeleccionada!.year}",
                  style: const TextStyle(
                    fontFamily: "BBH_Sans_Bogle",
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),

            const Text(
              "Género",
              style: TextStyle(
                fontFamily: "BBH_Sans_Bogle",
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(
                      "Femenino",
                      style: TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        color: Colors.white,
                      ),
                    ),
                    activeColor: Colors.green,
                    value: "Femenino",
                    groupValue: generoSeleccionado,
                    onChanged: (value) {
                      setState(() {
                        generoSeleccionado = value;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<String>(
                    title: const Text(
                      "Masculino",
                      style: TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        color: Colors.white,
                      ),
                    ),
                    activeColor: Colors.green,
                    value: "Masculino",
                    groupValue: generoSeleccionado,
                    onChanged: (value) {
                      setState(() {
                        generoSeleccionado = value;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            const Text(
              "Provincia",
              style: TextStyle(
                fontFamily: "BBH_Sans_Bogle",
                fontSize: 18,
                color: Colors.green,
              ),
            ),
            const SizedBox(height: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: DropdownButton<String>(
                value: provinciaSeleccionada,
                isExpanded: true,
                hint: const Text(
                  "Seleccione su provincia",
                  style: TextStyle(
                    fontFamily: "BBH_Sans_Bogle",
                    color: Colors.grey,
                  ),
                ),
                items: provincias.map((provincia) {
                  return DropdownMenuItem(
                    value: provincia,
                    child: Text(
                      provincia,
                      style: const TextStyle(
                        fontFamily: "BBH_Sans_Bogle",
                        color: Colors.black,
                      ),
                    ),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    provinciaSeleccionada = value;
                  });
                },
              ),
            ),
            const SizedBox(height: 30),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildBoton("Guardar", Colors.green, Colors.black, () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Datos guardados correctamente."),
                      backgroundColor: Colors.green,
                    ),
                  );
                }),
                _buildBoton("Salir", Colors.green.shade800, Colors.white, () {
                  Navigator.pop(context);
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCampo(String label, {bool esPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontFamily: "BBH_Sans_Bogle",
            color: Colors.green,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 5),
        TextField(
          obscureText: esPassword,
          style: const TextStyle(
            fontFamily: "BBH_Sans_Bogle",
            color: Colors.black,
          ),
          decoration: InputDecoration(
            hintText: "Ingrese $label",
            hintStyle: const TextStyle(
              fontFamily: "BBH_Sans_Bogle",
              color: Colors.grey,
            ),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.green),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildBoton(String texto, Color fondo, Color textoColor, VoidCallback onPressed) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: fondo,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        texto,
        style: TextStyle(
          fontFamily: "BBH_Sans_Bogle",
          color: textoColor,
          fontSize: 18,
        ),
      ),
    );
  }
}
