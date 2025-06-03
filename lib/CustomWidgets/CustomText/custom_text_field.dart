import 'package:flutter/material.dart';
import 'package:hotelbookingapp/CustomWidgets/CustomText/text1.dart';

import '../../Themes/colors.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final IconData? icon, icon2;
  final double height;
  final bool obscureText;
  final TextEditingController? controller;
  final void Function(String)? onChanged;

  const CustomTextField({
    super.key,
    required this.label,
    this.icon,
    this.icon2,
    this.height = 45,
    this.obscureText = false,
    this.controller,
    this.onChanged,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final FocusNode _focusNode = FocusNode();
  bool _isObscured = false;
  late IconData _currentIcon2;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.obscureText;
    _currentIcon2 = widget.icon2 ??
        Icons.visibility_off; // Default hanya jika icon2 dipanggil
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text1(
            text1: widget.label,
            color: AppColors.black,
            size: 13,
          ),
          Container(
            height: widget.height,
            margin: const EdgeInsets.symmetric(vertical: 4),
            width: double.infinity,
            padding: const EdgeInsets.all(3.0),
            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: AppColors.beauBlue),
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextFormField(
              controller: widget.controller,
              onChanged: widget.onChanged,
              focusNode: _focusNode,
              obscureText: _isObscured,
              style: const TextStyle(
                color: AppColors.black,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: widget.label.toLowerCase(),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: -1),
                hintStyle: const TextStyle(
                  color: AppColors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
                prefixIcon: widget.icon != null
                    ? Icon(
                        widget.icon,
                        size: 20,
                        color: AppColors.black,
                      )
                    : null,
                suffixIcon: widget.icon2 != null
                    ? IconButton(
                        icon: Icon(
                          _currentIcon2,
                          size: 20,
                          color: AppColors.black,
                        ),
                        onPressed: () {
                          setState(() {
                            _isObscured = !_isObscured;
                            _currentIcon2 =
                                _isObscured ? widget.icon2! : Icons.visibility;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
