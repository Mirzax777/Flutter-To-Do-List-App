import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> daftarTugas = [
    'Belajar Flutter',
    'Membuat Aplikasi To Do List',
    'Memahami StatefulWidget',
  ];

  // List untuk status tugas
  List<bool> statusTugas = [false, false, false];

  TextEditingController controllerTugas = TextEditingController();

  // Fungsi - Tambah Tugas
  void _tambahTugas() {
    setState(() {
      daftarTugas.add(controllerTugas.text);
      statusTugas.add(false); // STATUS DEFAULT
      controllerTugas.clear();
    });
  }

  // Fungsi - Hapus tugas
  void _hapusTugas(int index) {
    setState(() {
      daftarTugas.removeAt(index);
      statusTugas.removeAt(index); //HAPUS STATUS
    });
  }

  // Fungsi - Checklist Tugas
  void _toggleTugas(int index) {
    setState(() {
      statusTugas[index] = !statusTugas[index];
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.deepPurple,
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset(
                'checked.png',
                width: 40,
                height: 40,
                errorBuilder: (context, error, stackTrace) {
                  return Icon(Icons.error);
                },
              ),
              const SizedBox(width: 12),
              const Text(
                'Aplikasi To Do List',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.blueAccent,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: controllerTugas,
                      decoration: const InputDecoration(
                        hintText: 'Masukkan tugas baru...',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _tambahTugas,
                    child: const Text('Tambah'),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: daftarTugas.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    // CHECKBOX DI SEBELAH KIRI
                    leading: Checkbox(
                      value: statusTugas[index],
                      onChanged: (bool? value) {
                        _toggleTugas(index);
                      },
                    ),
                    title: Text(
                      daftarTugas[index],
                      style: TextStyle(
                        decoration: statusTugas[index]
                            ? TextDecoration
                                  .lineThrough // CORET JIKA SELESAI
                            : TextDecoration.none,
                        color: statusTugas[index]
                            ? Colors
                                  .grey // WARNA ABU-ABU JIKA SELESAI
                            : Colors.black,
                      ),
                    ),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete),
                      onPressed: () {
                        _hapusTugas(index);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
