import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';

void showRoomSelectionModal(BuildContext context) {
  showModalBottomSheet(
    context: context,
    backgroundColor: Colors.white,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
    ),
    isScrollControlled: true,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          int kamar = 1;
          int dewasa = 2;
          int anak = 0;

          void _incrementKamar() => setState(() => kamar++);
          void _decrementKamar() => setState(() => kamar--);
          void _incrementDewasa() => setState(() => dewasa++);
          void _decrementDewasa() => setState(() => dewasa--);
          void _incrementAnak() => setState(() => anak++);
          void _decrementAnak() => setState(() => anak--);

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
                  "Pilih kamar dan tamu",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 16),
                _buildCounter("Kamar", kamar, _incrementKamar, _decrementKamar),
                _buildCounter(
                    "Dewasa", dewasa, _incrementDewasa, _decrementDewasa),
                _buildCounter("Anak-anak (0 - 17 tahun)", anak, _incrementAnak,
                    _decrementAnak),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () => Navigator.pop(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.button2Color,
                    minimumSize: const Size(double.infinity, 40),
                  ),
                  child: const Text(
                    "Simpan",
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          );
        },
      );
    },
  );
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
            onPressed: value > 0 ? onRemove : null,
            icon: const Icon(Icons.remove),
          ),
          Text(value.toString(), style: const TextStyle(fontSize: 16)),
          IconButton(
            onPressed: onAdd,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    ],
  );
}
