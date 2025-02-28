import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';

class TicketScreen extends StatefulWidget {
  const TicketScreen({super.key});

  @override
  State<TicketScreen> createState() => _TicketScreenState();
}

class _TicketScreenState extends State<TicketScreen> {
  int _selectedTicketIndex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(height: 20),
                const Text(
                  'Choose Ticket',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTicketIndex = 0;
                        });
                      },
                      child: CustomPaint(
                        painter: DashedBorderPainter(
                          color: _selectedTicketIndex == 0 ? Colors.orange : Colors.grey,
                          strokeWidth: 1,
                          dashLength: 5,
                          dashGap: 3,
                        ),
                        child: Container(
                          width: 160,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TicketWidget(
                            width: 160,
                            height: 200,
                            isCornerRounded: true,
                            padding: const EdgeInsets.all(15),
                            child: TicketOption(
                              title: 'VIP',
                              price: '\$50.00',
                              description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              priceColor: _selectedTicketIndex == 0
                                  ? Colors.blue
                                  : Colors.black,
                              iconColor: _selectedTicketIndex == 0
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedTicketIndex = 1;
                        });
                      },
                      child: CustomPaint(
                        painter: DashedBorderPainter(
                          color: _selectedTicketIndex == 1 ? Colors.orange : Colors.grey,
                          strokeWidth: 1,
                          dashLength: 5,
                          dashGap: 3,
                        ),
                        child: Container(
                          width: 160,
                          height: 200,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TicketWidget(
                            width: 160,
                            height: 200,
                            isCornerRounded: true,
                            padding: const EdgeInsets.all(15),
                            child: TicketOption(
                              title: 'Economy',
                              price: '\$30.00',
                              description:
                              'Lorem ipsum dolor sit amet, consectetur adipiscing elit.',
                              priceColor: _selectedTicketIndex == 1
                                  ? Colors.blue
                                  : Colors.black,
                              iconColor: _selectedTicketIndex == 1
                                  ? Colors.blue
                                  : Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Number of Seats',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Row(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.remove),
                        ),
                        const Text('6'),
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.add),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15,
                    ),
                    textStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  child: const Text('Continue'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TicketOption extends StatelessWidget {
  final String title;
  final String price;
  final String description;
  final Color? priceColor;
  final Color? iconColor;

  const TicketOption({
    super.key,
    required this.title,
    required this.price,
    required this.description,
    this.priceColor,
    this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Icon(
              Icons.local_offer,
              color: iconColor,
            ),
            const SizedBox(width: 5),
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text(
          description,
          style: const TextStyle(fontSize: 12),
        ),
        const SizedBox(height: 15),
        Text(
          '$price /Person',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: priceColor,
          ),
        ),
      ],
    );
  }
}

class DashedBorderPainter extends CustomPainter {
  final Color color;
  final double strokeWidth;
  final double dashLength;
  final double dashGap;

  DashedBorderPainter({
    required this.color,
    required this.strokeWidth,
    required this.dashLength,
    required this.dashGap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, 0),
        Offset(startX + dashLength, 0),
        paint,
      );
      startX += dashLength + dashGap;
    }

    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(0, startY),
        Offset(0, startY + dashLength),
        paint,
      );
      startY += dashLength + dashGap;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}