import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';

void main() {
  runApp(const RegistrationPage());
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  _RegistrationPageState createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage>{
   
  final TextEditingController namaMataKuliahController = TextEditingController();
  final TextEditingController kodeMataKuliahController = TextEditingController();
  final TextEditingController dosenPengampuController = TextEditingController();
  final TextEditingController pegawaiIdController = TextEditingController();
  final TextEditingController lokasiPerkuliahanController = TextEditingController();
  final TextEditingController sesiController = TextEditingController();
  final TextEditingController jenisPerkuliahanController = TextEditingController();
  final TextEditingController waktuPerkuliahanController = TextEditingController();

    void _simpanData(String namaMataKuliah, String kodeMataKuliah, String dosenPengampu, String pegawaiId, String lokasiPerkuliahan, String sesi, String jenisPerkuliahan, String waktuPerkuliahan) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('namaMataKuliah', namaMataKuliah);
    prefs.setString('kodeMataKuliah', kodeMataKuliah);
    prefs.setString('dosenPengampu', dosenPengampu);
    prefs.setString('pegawaiId', pegawaiId);
    prefs.setString('lokasiPerkuliahan', lokasiPerkuliahan);
    prefs.setString('sesi', sesi);
    prefs.setString('jenisPerkuliahan', jenisPerkuliahan);
    prefs.setString('waktuPerkuliahan', waktuPerkuliahan);
  }

  @override  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Image.asset('assets/logo_del.jpeg'),
        ),
        title: Text(
          'Registrasi Mata Kuliah',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            fontFamily: 'Montserrat',
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView( 
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                'Isi Formulir Registrasi',
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ), 
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20.0),
              TextFormField(
                controller: namaMataKuliahController,
                decoration: InputDecoration(
                  labelText: 'Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: kodeMataKuliahController,
                decoration: InputDecoration(
                  labelText: 'Kode Mata Kuliah',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: dosenPengampuController,
                decoration: InputDecoration(
                  labelText: 'Dosen Pengampu',
                  border: OutlineInputBorder(),
                ),
              ),
            SizedBox(height: 10.0),
            TextFormField(
                controller: pegawaiIdController,
              decoration: InputDecoration(
                labelText: 'Pegawai ID',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
                controller: lokasiPerkuliahanController,
              decoration: InputDecoration(
                labelText: 'Lokasi Perkuliahan',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
                controller: sesiController,
              decoration: InputDecoration(
                labelText: 'Sesi',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10.0),
            TextFormField(
                controller: jenisPerkuliahanController,
              decoration: InputDecoration(
                labelText: 'Jenis Perkuliahan',
                border: OutlineInputBorder(),
              ),
            ),
              SizedBox(height: 10.0),
              TextFormField(
                controller: waktuPerkuliahanController,
                decoration: InputDecoration(
                  labelText: 'Waktu Perkuliahan',
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  
                  String namaMataKuliah = namaMataKuliahController.text;
                  String kodeMataKuliah = kodeMataKuliahController.text;
                  String dosenPengampu = dosenPengampuController.text;
                  String pegawaiId = pegawaiIdController.text;
                  String lokasiPerkuliahan = lokasiPerkuliahanController.text;
                  String sesi = sesiController.text;
                  String jenisPerkuliahan = jenisPerkuliahanController.text;
                  String waktuPerkuliahan = waktuPerkuliahanController.text;
                  print('Nama Mata Kuliah: $namaMataKuliah');
                  print('Kode Mata Kuliah: $kodeMataKuliah');
                  print('Dosen Pengampu: $dosenPengampu');
                  print('ID Pegawai: $pegawaiId');
                  print('Lokasi Perkuliahan: $lokasiPerkuliahan');
                  print('Sesi: $sesi');
                  print('Jenis Perkuliahan: $jenisPerkuliahan');
                  print('Waktu Perkuliahan: $waktuPerkuliahan');

                  _simpanData(namaMataKuliah, kodeMataKuliah, dosenPengampu, pegawaiId, lokasiPerkuliahan, sesi, jenisPerkuliahan, waktuPerkuliahan);
                  Navigator.push(
                    context, 
                    MaterialPageRoute(builder: (context) => HomePage())
                  );
                },
                child: Text('Daftar'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
