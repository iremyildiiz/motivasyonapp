import 'package:flutter/material.dart';

class EmojiSecPage extends StatelessWidget {
  const EmojiSecPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Duygunu Seç',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/İMAGES/appbar.JPG'),
              fit: BoxFit.cover,
            ),
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/İMAGES/emojisayfasi.JPG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Bugün Nasılsın?',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    _showMessage(context);
                  },
                  icon: const Icon(
                    Icons.sentiment_satisfied,
                    size: 40,
                    color: Colors.green,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showMessage(context);
                  },
                  icon: const Icon(
                    Icons.sentiment_dissatisfied,
                    size: 40,
                    color: Colors.red,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    _showMessage(context);
                  },
                  icon: const Icon(
                    Icons.sentiment_neutral,
                    size: 40,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _showMessage(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Hadi Günün Sözünü Seç.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Ana sayfaya geri dön işlemi.
              },
              child: const Text('Tamam'),
            ),
          ],
        );
      },
    );
  }
}
