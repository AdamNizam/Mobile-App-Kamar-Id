import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hotelbookingapp/Themes/colors.dart';

typedef RoomSelectionCallback = void Function(int room, int adult, int child);

void showRoomSelectionModal(
  BuildContext context,
  int initialRoom,
  int initialAdult,
  int initialChild,
  RoomSelectionCallback onSelectionChanged,
) {
  showModalBottomSheet(
    context: context,
    backgroundColor: AppColors.white,
    elevation: 0,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return _RoomSelectionContent(
            initialRoom: initialRoom,
            initialAdult: initialAdult,
            initialChild: initialChild,
            onSelectionChanged: onSelectionChanged,
          );
        },
      );
    },
  );
}

class _RoomSelectionContent extends StatefulWidget {
  final int initialRoom;
  final int initialAdult;
  final int initialChild;
  final RoomSelectionCallback onSelectionChanged;

  const _RoomSelectionContent({
    required this.initialRoom,
    required this.initialAdult,
    required this.initialChild,
    required this.onSelectionChanged,
  });

  @override
  State<_RoomSelectionContent> createState() => _RoomSelectionContentState();
}

class _RoomSelectionContentState extends State<_RoomSelectionContent> {
  late int room;
  late int adult;
  late int child;

  @override
  void initState() {
    super.initState();
    room = widget.initialRoom;
    adult = widget.initialAdult;
    child = widget.initialChild;
  }

  void incrementRoom() => setState(() => room++);
  void decrementRoom() {
    if (room > 1) setState(() => room--);
  }

  void incrementAdult() => setState(() => adult++);
  void decrementAdult() {
    if (adult > 1) setState(() => adult--);
  }

  void incrementChild() => setState(() => child++);

  void decrementChild() {
    if (child > 0) setState(() => child--);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 50,
            height: 5,
            decoration: BoxDecoration(
              color: Colors.grey[400],
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Select Room & Guests",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                _buildCounter("Room", room, incrementRoom, decrementRoom),
                _buildCounter("Adult", adult, incrementAdult, decrementAdult),
                _buildCounter("Child (0 - 17 years)", child, incrementChild,
                    decrementChild),
              ],
            ),
          ),
          const SizedBox(height: 16),
          Text(
            "Total: $room Room, ${adult + child} Guest",
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              widget.onSelectionChanged(room, adult, child);
              Navigator.pop(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.buttonColor,
              minimumSize: const Size(double.infinity, 40),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
            child: const Text(
              "Save",
              style: TextStyle(fontSize: 16, color: AppColors.white),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildCounter(
    String label, int value, VoidCallback onAdd, VoidCallback onRemove) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(label,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
      Row(
        children: [
          IconButton(
            onPressed: onRemove,
            icon: const Icon(
              Icons.remove,
              color: AppColors.redAwesome,
            ),
          ),
          Text(value.toString(), style: const TextStyle(fontSize: 16)),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(
              Icons.add,
            ),
          ),
        ],
      ),
    ],
  );
}
