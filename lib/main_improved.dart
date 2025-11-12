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
        backgroundColor: Colors.grey[50],
        appBar: AppBar(
          title: Row(
            children: [
              Image.asset('checked.png', width: 40, height: 40),
              const SizedBox(width: 12),
              const Text(
                'Aplikasi To Do List',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.black87,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          elevation: 1,
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
                      decoration: InputDecoration(
                        hintText: 'Masukkan tugas baru...',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        filled: true,
                        fillColor: Colors.white,
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 14,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: ElevatedButton(
                      onPressed: _tambahTugas,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        shadowColor: Colors.transparent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 14,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Tambah',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: daftarTugas.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      decoration: BoxDecoration(
                        color: statusTugas[index]
                            ? Colors.green[50]
                            : Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[200]!),
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16,
                        ),
                        // CHECKBOX DI SEBELAH KIRI
                        leading: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: statusTugas[index]
                                  ? Colors.green[500]!
                                  : Colors.grey[400]!,
                            ),
                          ),
                          child: Checkbox(
                            value: statusTugas[index],
                            onChanged: (bool? value) {
                              _toggleTugas(index);
                            },
                            activeColor: Colors.transparent,
                            checkColor: Colors.green[500],
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            shape: const CircleBorder(),
                          ),
                        ),
                        title: Text(
                          daftarTugas[index],
                          style: TextStyle(
                            decoration: statusTugas[index]
                                ? TextDecoration.lineThrough
                                : TextDecoration.none,
                            color: statusTugas[index]
                                ? Colors.grey[600]
                                : Colors.black87,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_outline,
                            color: Colors.red[400],
                          ),
                          onPressed: () {
                            _hapusTugas(index);
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
