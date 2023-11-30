import 'package:flutter/material.dart';

class DaurHeroScreen extends StatefulWidget {
  @override
  _DaurHeroScreenState createState() => _DaurHeroScreenState();
}

class _DaurHeroScreenState extends State<DaurHeroScreen> {
  PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Daur Hero'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Carousel at the top
          Stack(
            children: [
              Container(
                height: 200, // Adjust the height as needed
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    Container(
                      color: Colors.blue,
                      child: Center(
                        child: Text('Screen 1'),
                      ),
                    ),
                    Container(
                      color: Colors.green,
                      child: Center(
                        child: Text('Screen 2'),
                      ),
                    ),
                    Container(
                      color: Colors.orange,
                      child: Center(
                        child: Text('Screen 3'),
                      ),
                    ),
                    Container(
                      color: Colors.red,
                      child: Center(
                        child: Text('Screen 4'),
                      ),
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_back),
                  onPressed: _currentPage > 0
                      ? () {
                          _pageController.previousPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      : null,
                ),
              ),
              Positioned(
                right: 0,
                top: 0,
                bottom: 0,
                child: IconButton(
                  icon: Icon(Icons.arrow_forward),
                  onPressed: _currentPage < 3
                      ? () {
                          _pageController.nextPage(
                              duration: Duration(milliseconds: 300),
                              curve: Curves.easeInOut);
                        }
                      : null,
                ),
              ),
            ],
          ),
          // Changing content at the bottom
          Expanded(
            child: IndexedStack(
              index: _currentPage,
              children: [
                // Content for Screen 1
                Container(
                  color: Colors.blue,
                  child: Center(
                    child: Text('Content for Screen 1'),
                  ),
                ),
                // Content for Screen 2
                Container(
                  color: Colors.green,
                  child: Center(
                    child: Text('Content for Screen 2'),
                  ),
                ),
                // Content for Screen 3
                Container(
                  color: Colors.orange,
                  child: Center(
                    child: Text('Content for Screen 3'),
                  ),
                ),
                Container(
                  color: Colors.red,
                  child: Center(
                    child: Text('Content for Screen 4'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
