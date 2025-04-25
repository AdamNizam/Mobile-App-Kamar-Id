import 'package:flutter/material.dart';
import 'package:hotelbookingapp/Constants/colors.dart';
import 'package:hotelbookingapp/Widgets/custombtn.dart';

class CardCreditPage extends StatelessWidget {
  const CardCreditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Credit Card
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: const LinearGradient(
                    colors: [AppColors.buttonColor, AppColors.doggerBlue],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.account_balance, color: Colors.white),
                            SizedBox(width: 8),
                            Text('BANK INDONESIA',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Text('CREDIT',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    SizedBox(height: 24),
                    Text('0000 2363 8364 8269',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            letterSpacing: 2)),
                    SizedBox(height: 8),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('VALID THRU\n5/23',
                            style: TextStyle(color: Colors.white)),
                        Text('633', style: TextStyle(color: Colors.white)),
                      ],
                    ),
                    SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Andre Luckmana',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                        Image(
                          image: AssetImage('images/card.png'),
                          width: 40,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),

            Expanded(
              child: Container(
                padding: const EdgeInsets.all(24),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                ),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Enter card details',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: AppColors.buttonColor,
                        ),
                      ),
                      const SizedBox(height: 24),
                      _textField(label: "Card name", icon: 'images/card.png'),
                      const SizedBox(height: 16),
                      _textField(label: "Card number"),
                      const SizedBox(height: 16),
                      Row(
                        children: [
                          Expanded(child: _textField(label: "Expiry date")),
                          const SizedBox(width: 16),
                          Expanded(child: _textField(label: "CVV")),
                        ],
                      ),
                      const SizedBox(height: 32),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomButton(text: 'Save', onTap: () {}),
      ),
    );
  }

  Widget _textField({required String label, String? icon}) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(
          color: AppColors.cadetGray,
        ),
        suffixIcon: icon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: Image.asset(icon, width: 24),
              )
            : null,
        border: const UnderlineInputBorder(),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.buttonColor,
            width: 2.0,
          ),
        ),
      ),
    );
  }
}
