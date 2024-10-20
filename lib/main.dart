import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PageView with ScaleTransition',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ScaleTransitionPageView(),
    );
  }
}

class ScaleTransitionPageView extends StatefulWidget {
  @override
  _ScaleTransitionPageViewState createState() =>
      _ScaleTransitionPageViewState();
}

class _ScaleTransitionPageViewState extends State<ScaleTransitionPageView> {
  PageController _pageController = PageController();
  double _currentPage = 0.0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPage = _pageController.page ?? 0;
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PageView with ScaleTransition'),
      ),
      body: PageView.builder(
        controller: _pageController,
        itemCount: 5, // Number of pages
        itemBuilder: (context, index) {
          double scale = (1 - (_currentPage - index).abs()).clamp(0.7, 1.0);
          return Transform.scale(
            scale: scale,
            child: Container(
              margin: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.circular(20.0),
              ),
              child: Center(
                child: Text(
                  'Page ${index + 1}',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
