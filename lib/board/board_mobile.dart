import 'package:flutter/material.dart';
import 'package:the_splendid_market/constant/colors.dart';

class BoardMobile extends StatefulWidget {
  const BoardMobile({super.key});

  @override
  State<BoardMobile> createState() => _BoardMobileState();
}

class _BoardMobileState extends State<BoardMobile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Board Dashboard',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: mainColor, // Replace with your mainColor
                    ),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/home');
                    },
                    child: const Text(
                      'Home',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        color: mainColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 8,
                  children: const [
                    HoverCard(
                      name: 'Ellyse Perry',
                      image:
                          'https://content.api.news/v3/images/bin/767ef800ed57ed5f29ad91a28d4e60ee',
                      backgroundColor: Colors.pink,
                      buttonColor: Colors.pink,
                      text:
                          'Ellyse Perry is an Australian sportswoman who has represented her country in both cricket and soccer.',
                      route: '/ellysePerry',
                    ),
                    HoverCard(
                      name: 'Emma Grace',
                      image:
                          'https://i0.wp.com/www.wonderslist.com/wp-content/uploads/2020/05/Jessica-Alba-USA.jpg?resize=662%2C373&ssl=1',
                      backgroundColor: Colors.blue,
                      buttonColor: Colors.blue,
                      text:
                          'Emma Grace is a talented actress known for her roles in various blockbuster movies.',
                      route: '/emmaGrace',
                    ),
                    HoverCard(
                      name: 'Sophia Smith',
                      image:
                          'https://thumbs.dreamstime.com/b/beautiful-girl-walking-city-37813935.jpg',
                      backgroundColor: Colors.purple,
                      buttonColor: Colors.purple,
                      text:
                          'Sophia Smith is a well-known model and social media influencer with millions of followers.',
                      route: '/sophiaSmith1',
                    ),
                    HoverCard(
                      name: 'Sophia Johnson',
                      image:
                          'https://thumbs.dreamstime.com/b/beautiful-girl-walking-city-37813935.jpg',
                      backgroundColor: mainColor,
                      buttonColor: mainColor,
                      text:
                          'Sophia Johnson is a renowned artist famous for her unique style of painting.',
                      route: '/sophiaJohnson',
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.black,
              width: double.infinity,
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class HoverCard extends StatefulWidget {
  final String image;
  final Color backgroundColor;
  final String name;
  final Color buttonColor;
  final String text;
  final String route;

  const HoverCard({
    super.key,
    required this.name,
    required this.image,
    required this.backgroundColor,
    required this.buttonColor,
    required this.text,
    required this.route,
  });

  @override
  State<HoverCard> createState() => _HoverCardState();
}

class _HoverCardState extends State<HoverCard> {
  bool isHovered = false; // Boolean to track if the card is hovered

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: MouseRegion(
        // MouseRegion widget to detect mouse enter and exit events
        onEnter: (event) {
          setState(() {
            isHovered = true; // Set isHovered to true when mouse enters
          });
        },
        onExit: (event) {
          setState(() {
            isHovered = false; // Set isHovered to false when mouse exits
          });
        },
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            // Animated container for the card background
            AnimatedContainer(
              duration: const Duration(milliseconds: 375),
              height: isHovered ? 300.0 : 280.0, // Change height when hovered
              width: 200.0,
              decoration: BoxDecoration(
                color: widget.backgroundColor,
                borderRadius: BorderRadius.circular(20.0),
              ),
            ),
            // Animated positioning of the inner container
            AnimatedPositioned(
              duration: const Duration(milliseconds: 375),
              curve: Curves.easeOut,
              top: isHovered
                  ? -100.0
                  : 0.0, // if hover Move up otherwise at original position
              // Inner container with image and text
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 375),
                curve: Curves.easeOut,
                height: isHovered ? 300.0 : 280.0, // Change height when hovered
                width: 200.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10),
                      // Animated container for the image
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 375),
                        curve: Curves.easeOut,
                        height: isHovered
                            ? 120.0
                            : 180.0, // Change size when hovered
                        width: isHovered
                            ? 180.0
                            : 200.0, // Change size when hovered
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          image: DecorationImage(
                            image: NetworkImage(widget.image),
                            fit: BoxFit.cover,
                            alignment: Alignment.topCenter,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      // Name of the person
                      widget.name,
                      style: const TextStyle(
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Text(
                                widget.text,
                                textAlign: TextAlign.center,
                                style: const TextStyle(
                                  fontSize: 10.5,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                              const SizedBox(height: 15.0),
                              // Read More button
                              TextButton(
                                style: TextButton.styleFrom(
                                  backgroundColor: widget.buttonColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20.0),
                                  ),
                                  padding: const EdgeInsets.all(15),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(context, widget.route);
                                },
                                child: const Text(
                                  'Explore',
                                  style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EllysePerryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ellyse Perry'),
      ),
      body: const Center(
        child: Text(
          'Details about Ellyse Perry.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class EmmaGracePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Emma Grace'),
      ),
      body: const Center(
        child: Text(
          'Details about Emma Grace.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SophiaSmithPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sophia Smith'),
      ),
      body: const Center(
        child: Text(
          'Details about Sophia Smith.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}

class SophiaJohnsonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sophia Johnson'),
      ),
      body: const Center(
        child: Text(
          'Details about Sophia Johnson.',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
