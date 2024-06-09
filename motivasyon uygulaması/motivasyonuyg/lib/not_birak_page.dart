import 'package:flutter/material.dart';

class NotBirakPage extends StatefulWidget {
  @override
  _NotBirakPageState createState() => _NotBirakPageState();
}

class _NotBirakPageState extends State<NotBirakPage> {
  final List<String> notlar = []; // Notların listesini tutuyorum.

  TextEditingController notController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          ' Kendine Not Bırak',
          style: TextStyle(
            fontWeight: FontWeight.bold, // Başlık fontu kalınlaştırma yaptım.
            fontSize: 20, // Başlık font boyutu ayarladım.
          ),
        ),
        backgroundColor: Colors.blue,
        centerTitle: true, // Başlığı ortaladım.
        flexibleSpace: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/assets/İMAGES/appbar.JPG"),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                "lib/assets/İMAGES/notsayfasi.JPG"), // Arka plan resmi
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Giriş Alanı Tasarımı
              TextField(
                controller: notController,
                decoration: InputDecoration(
                  labelText: 'Not Ekle',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white70,
                ),
              ),
              SizedBox(height: 20),

              // Buton Tasarımı
              ElevatedButton(
                onPressed: () {
                  // Not ekleme işlemi veren kısım
                  setState(() {
                    notlar.add(notController.text);
                    notController.clear();
                  });
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    Colors.blueAccent,
                  ),
                  padding: MaterialStateProperty.all(
                    EdgeInsets.all(15),
                  ),
                ),
                child: Text(
                  'Notu Kaydet',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              SizedBox(height: 20),

              // Liste Görünümü veren kısım.
              Expanded(
                child: ListView.builder(
                  itemCount: notlar.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3,
                      margin: EdgeInsets.symmetric(vertical: 5),
                      child: ListTile(
                        title: Text(notlar[index]),
                        // Silme işlemi
                        trailing: IconButton(
                          icon: Icon(Icons.delete),
                          onPressed: () {
                            setState(() {
                              notlar.removeAt(index);
                            });
                          },
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
