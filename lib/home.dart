import 'package:flutter/material.dart';
import 'dart:async';
import 'confirmation.dart'; // Import your ConfirmationPage here

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late PageController _pageController;
  int _currentPage = 0;

  final List<String> _images = [
    'assets/images/event1.png',
    'assets/images/event2.png',
    'assets/images/event3.png',
  ];

  // Track the expanded state for each event
  final Map<String, bool> _expanded = {
    'Clubs Day': false,
    'Career Center': false,
    'Art Gallery': false,
    'SAMRA EVENT': false,
  };

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    // Set up auto-swiping
    Future.delayed(Duration.zero, () {
      Timer.periodic(const Duration(seconds: 3), (Timer timer) {
        if (_currentPage < _images.length - 1) {
          _currentPage++;
        } else {
          _currentPage = 0;
        }
        if (_pageController.hasClients) {
          _pageController.animateToPage(
            _currentPage,
            duration: const Duration(milliseconds: 300),
            curve: Curves.easeInOut,
          );
        }
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
      backgroundColor: const Color(0xFFFBE9E7),
      body: Column(
        children: [
          // Image Carousel
          SizedBox(
            height: 200,
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: _images.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      _images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 20),

          // Dots Indicator
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _images.length,
              (index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 4),
                width: 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == index
                      ? Colors.grey[700]
                      : Colors.grey[400],
                  shape: BoxShape.circle,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          // Book Now Section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Book Now',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 16),
                _buildExpandableEventCard(
                  title: 'Clubs Day',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDateChip('1 Jun'),
                      _buildDateChip('2 Jun'),
                      _buildDateChip('3 Jun'),
                      _buildDateChip('4 Jun'),
                    ],
                  ),
                ),
                _buildExpandableEventCard(
                  title: 'Career Center',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDateChip('5 Aug'),
                      _buildDateChip('6 Aug'),
                      _buildDateChip('7 Aug'),
                    ],
                  ),
                ),
                _buildExpandableEventCard(
                  title: 'Art Gallery',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDateChip('7 Sep'),
                      _buildDateChip('8 Sep'),
                    ],
                  ),
                ),
                _buildExpandableEventCard(
                  title: 'SAMRA EVENT',
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      _buildDateChip('9 Dec'),
                      _buildDateChip('10 Dec'),
                      _buildDateChip('11 Dec'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpandableEventCard(
      {required String title, required Widget content}) {
    return Card(
      color: Colors.black,
      margin: const EdgeInsets.only(bottom: 16.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: [
          ListTile(
            title: Text(
              title,
              style: const TextStyle(
                  color: Colors.orange, fontWeight: FontWeight.bold),
            ),
            trailing: IconButton(
              icon: Icon(
                _expanded[title]!
                    ? Icons.keyboard_arrow_up
                    : Icons.keyboard_arrow_down,
                color: Colors.orange,
              ),
              onPressed: () {
                setState(() {
                  _expanded[title] = !_expanded[title]!;
                });
              },
            ),
          ),
          if (_expanded[title]!)
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: content,
            ),
        ],
      ),
    );
  }

  Widget _buildDateChip(String label) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ConfirmationPage(), // Use ConfirmationPage from confirmation.dart
          ),
        );
      },
      child: Chip(
        label: Text(
          label,
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
    );
  }
}
