import 'package:flutter/material.dart';
import 'not_birak_page.dart';
import 'emoji_sec_page.dart'; // Emoji seçim sayfasının import edildiğinden emin olun

void main() {
  runApp(const WidgetDetail());
}

class WidgetDetail extends StatelessWidget {
  const WidgetDetail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Navigator(
        onGenerateRoute: (settings) {
          return MaterialPageRoute(
            builder: (context) => Scaffold(
              body: WidgetDetailBody(),
            ),
          );
        },
      ),
    );
  }
}

class WidgetDetailBody extends StatefulWidget {
  const WidgetDetailBody({Key? key}) : super(key: key);

  @override
  _WidgetDetailBodyState createState() => _WidgetDetailBodyState();
}

class _WidgetDetailBodyState extends State<WidgetDetailBody>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  int _imageIndex = 0;
  List<String> _imagePaths = [
    'lib/assets/İMAGES/resim1.jpg',
    'lib/assets/İMAGES/resim2.jpg',
    'lib/assets/İMAGES/resim3.jpg',
    'lib/assets/İMAGES/resim4.jpg',
    'lib/assets/İMAGES/resim5.jpg',
    'lib/assets/İMAGES/resim6.jpg',
    'lib/assets/İMAGES/resim7.jpg',
    'lib/assets/İMAGES/resim8.jpg',
    'lib/assets/İMAGES/resim9.jpg',
    'lib/assets/İMAGES/resim10.jpg',
    'lib/assets/İMAGES/resim11.jpg',
    'lib/assets/İMAGES/resim12.jpg',
    'lib/assets/İMAGES/resim13.jpg',
    'lib/assets/İMAGES/resim13.jpg',
    'lib/assets/İMAGES/resim14.jpg',
    'lib/assets/İMAGES/resim15.jpg',
    'lib/assets/İMAGES/resim16.jpg',
    'lib/assets/İMAGES/resim17.jpg',
    'lib/assets/İMAGES/resim18.jpg',
    'lib/assets/İMAGES/resim19.jpg',
    'lib/assets/İMAGES/resim20.jpg',
    'lib/assets/İMAGES/resim21.jpg',
    'lib/assets/İMAGES/resim22.jpg',
    'lib/assets/İMAGES/resim23.jpg',
    'lib/assets/İMAGES/resim24.jpg',
    'lib/assets/İMAGES/resim25.jpg',
    'lib/assets/İMAGES/resim26.jpg',
    'lib/assets/İMAGES/resim27.jpg',
    'lib/assets/İMAGES/resim28.jpg',
    'lib/assets/İMAGES/resim29.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(_controller);
    _shuffleImages();
  }

  void _shuffleImages() {
    setState(() {
      _imagePaths.shuffle();
    });
  }

  void _changeImage() {
    setState(() {
      _imageIndex = (_imageIndex + 1) % _imagePaths.length;
    });
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pozitif Bakış",
          style: TextStyle(
            color: Color.fromARGB(
                219, 5, 32, 31), // Başlık rengi ayarlaması yaptım.
            fontWeight: FontWeight.w600, // Başlık kalınlığı ayarladım.
            fontSize: 24, // Başlık boyutu belirledim.
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/İMAGES/appbar.JPG'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            );
          },
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Not Bırak',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => NotBirakPage()),
                );
              },
            ),
            ListTile(
              title: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Emoji Seç',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              trailing: Icon(Icons.arrow_forward),
              onTap: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EmojiSecPage()),
                );
                if (result == true) {}
              },
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return Opacity(
                opacity: _animation.value,
                child: Image(
                  image: AssetImage(_imagePaths[_imageIndex]),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          Positioned(
            bottom: MediaQuery.of(context).size.height * 0.13 - 25,
            left: MediaQuery.of(context).size.width * 0.36 - 50,
            child: ElevatedButton(
              onPressed: _changeImage,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 29, 116, 134),
                ),
                foregroundColor: MaterialStateProperty.all(
                  Color.fromARGB(255, 3, 0, 0),
                ),
                shape: MaterialStateProperty.all(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                textStyle: MaterialStateProperty.all(
                  const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
              child: const Text('Günün Sözünü Seç'),
            ),
          ),
        ],
      ),
    );
  }
}
