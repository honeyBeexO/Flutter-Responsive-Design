import 'package:flutter/material.dart';
import 'package:outlook/components/side_menu.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'package:outlook/shared/responsive.dart';
import 'components/list_of_emails.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size _size = MediaQuery.of(context).size;
    return Scaffold(
      extendBody: true,
      body: Responsive(
        mobile: ListOfEmails(),
        tablet: Row(
          children: [
            Expanded(
              flex: 4,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: 6,
              child: EmailScreen(),
            ),
          ],
        ),
        desktop: Row(
          children: [
            Expanded(
              flex: _size.width > 1300 ? 2 : 4,
              child: SideMenu(),
            ),
            Expanded(
              flex: _size.width > 1300 ? 3 : 5,
              child: ListOfEmails(),
            ),
            Expanded(
              flex: _size.width > 1300 ? 8 : 10,
              child: EmailScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
