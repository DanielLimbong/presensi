import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'matkulregist.dart';
import 'absensi.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String? namaMataKuliah;
  String? kodeMataKuliah;
  String? dosenPengampu;
  String? pegawaiId;
  String? lokasiPerkuliahan;
  String? sesi;
  String? jenisPerkuliahan;
  String? waktuPerkuliahan;
  List<String> mataKuliah = []; 

  @override
  void initState() {
    super.initState();
    getDataFromSharedPreferences();
  }

  Future<void> getDataFromSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      namaMataKuliah = prefs.getString('namaMataKuliah');
      kodeMataKuliah = prefs.getString('kodeMataKuliah');
      dosenPengampu = prefs.getString('dosenPengampu');
      pegawaiId = prefs.getString('pegawaiId');
      lokasiPerkuliahan = prefs.getString('lokasiPerkuliahan');
      sesi = prefs.getString('sesi');
      jenisPerkuliahan = prefs.getString('jenisPerkuliahan');
      waktuPerkuliahan = prefs.getString('waktuPerkuliahan');
      if (namaMataKuliah != null) { 
        mataKuliah.add(namaMataKuliah!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/logo_del.jpeg'),
        ),
        title: const Text(
          'Presensi Institut Teknologi Del',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: mataKuliah.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PresensiPage()),
                    );
                    print('Mata Kuliah: ${mataKuliah[index]}');
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      constraints: const BoxConstraints(
                        minWidth: 80,
                        minHeight: 50,
                      ),
                      color: Colors.blue[300],
                      child: Center(
                        child: Text(
                          mataKuliah[index],
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('Floating Action Button pressed');
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => RegistrationPage()),
          );
        },
        child: const Icon(Icons.add),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
