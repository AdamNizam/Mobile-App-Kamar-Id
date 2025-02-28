import 'package:flutter/material.dart';

import '../../../Widgets/customapp_bar.dart';
import '../../../Widgets/customtextfield.dart';

class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  HelpCenterScreenState createState() => HelpCenterScreenState();
}

class HelpCenterScreenState extends State<HelpCenterScreen> {
  int _selectedFAQ = -1;
  // int _selectedContact = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SafeArea(
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              // Search bar

              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomAppBar(text: 'Help Center', text1: ''),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: CustomTextField(icon: Icons.search,label: 'Search',)
              ),
        
              // Tabs for FAQ and Contact Us
              const TabBar(
                indicatorColor: Colors.red,
                labelColor: Colors.red,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: "FAQ"),
                  Tab(text: "Contact Us"),
                ],
              ),
        
              // TabBarView to switch between FAQ and Contact Us content
              Expanded(
                child: TabBarView(
                  children: [
                    // FAQ tab
                    ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            ChoiceChip(
                              label: const Text('All'),
                              selected: true,
                              onSelected: (_) {},
                              selectedColor: Colors.red.shade100,
                            ),
                            ChoiceChip(
                              label: const Text('Services'),
                              selected: false,
                              onSelected: (_) {},
                            ),
                            ChoiceChip(
                              label: const Text('General'),
                              selected: false,
                              onSelected: (_) {},
                            ),
                            ChoiceChip(
                              label: const Text('Account'),
                              selected: false,
                              onSelected: (_) {},
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        ExpansionPanelList(
                          expandedHeaderPadding: EdgeInsets.zero,
                          elevation: 0,
                          expansionCallback: (int index, bool isExpanded) {
                            setState(() {
                              _selectedFAQ = _selectedFAQ == index ? -1 : index;
                            });
                          },
                          children: [
                            _buildFAQPanel(
                              title: "Can I track my order's delivery status?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 0,
                            ),
                            _buildFAQPanel(
                              title: "Is there a return policy?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 1,
                            ),
                            _buildFAQPanel(
                              title: "Can I save my favorite items for later?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 2,
                            ),
                            _buildFAQPanel(
                              title:
                              "Can I share products with my friends?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 3,
                            ),
                            _buildFAQPanel(
                              title: "How do I contact customer support?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 4,
                            ),
                            _buildFAQPanel(
                              title: "What payment methods are accepted?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 5,
                            ),
                            _buildFAQPanel(
                              title: "How to add review?",
                              content:
                              "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                              isExpanded: _selectedFAQ == 6,
                            ),
                          ],
                        ),
                      ],
                    ),
        
                    // Contact Us tab
                    ListView(
                      padding: const EdgeInsets.all(16.0),
                      children: [
                        _buildContactOption(
                          icon: Icons.headset_mic,
                          title: "Customer Service",
                          content: "Reach our customer service team.",
                          index: 0,
                        ),
                        _buildContactOption(
                          icon: Icons.messenger,
                          title: "WhatsApp",
                          content: "(480) 555-0103",
                          index: 1,
                        ),
                        _buildContactOption(
                          icon: Icons.language,
                          title: "Website",
                          content: "Visit our website for more information.",
                          index: 2,
                        ),
                        _buildContactOption(
                          icon: Icons.facebook,
                          title: "Facebook",
                          content: "Follow us on Facebook.",
                          index: 3,
                        ),
                        _buildContactOption(
                          icon: Icons.facebook,
                          title: "Twitter",
                          content: "Follow us on Twitter.",
                          index: 4,
                        ),
                        _buildContactOption(
                          icon: Icons.facebook,
                          title: "Instagram",
                          content: "Follow us on Instagram.",
                          index: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  ExpansionPanel _buildFAQPanel({
    required String title,
    required String content,
    required bool isExpanded,
  }) {
    return ExpansionPanel(
      headerBuilder: (BuildContext context, bool isExpanded) {
        return ListTile(
          title: Text(title),
        );
      },
      body: ListTile(
        title: Text(content),
      ),
      isExpanded: isExpanded,
    );
  }

  Widget _buildContactOption({
    required IconData icon,
    required String title,
    required String content,
    required int index,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
          vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ExpansionTile(
        leading: Icon(icon, color: Colors.red),
        title: Text(title),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(content),
          ),
        ],
        onExpansionChanged: (bool expanded) {
          setState(() {
            _selectedFAQ = expanded ? index : -1;
          });
        },
      ),
    );
  }
}
