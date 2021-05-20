import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:outlook/models/Email.dart';
import 'package:outlook/screens/email/email_screen.dart';
import 'package:outlook/shared/responsive.dart';
import 'package:websafe_svg/websafe_svg.dart';

import '../../../components/side_menu.dart';
import '../../../constants.dart';
import 'email_card.dart';

class ListOfEmails extends StatefulWidget {
  const ListOfEmails({
    Key? key,
  }) : super(key: key);

  @override
  _ListOfEmailsState createState() => _ListOfEmailsState();
}

class _ListOfEmailsState extends State<ListOfEmails> {
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawerScrimColor: Colors.red.withOpacity(0.05),
      key: _globalKey,
      drawer: ConstrainedBox(
        child: SideMenu(),
        constraints: BoxConstraints(
          maxWidth: 300.0,
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(kDefaultPadding),
        color: kBgDarkColor,
        child: SafeArea(
          right: false,
          child: Column(
            children: [
              Row(
                children: [
                  if (!Responsive.isDesktop(context))
                    IconButton(
                      icon: Icon(Icons.menu),
                      onPressed: () {
                        _globalKey.currentState!.openDrawer();
                      },
                    ),
                  if (!Responsive.isDesktop(context)) const SizedBox(width: 5),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: "Search",
                        fillColor: kBgLightColor,
                        filled: true,
                        suffixIcon: Padding(
                          padding: const EdgeInsets.all(kDefaultPadding * 0.75),
                          child: WebsafeSvg.asset(
                            "assets/Icons/Search.svg",
                            width: 24,
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              Row(
                children: [
                  WebsafeSvg.asset(
                    "assets/Icons/Angle down.svg",
                    width: 16,
                    color: Colors.black,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Sort by date",
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  Spacer(),
                  MaterialButton(
                    minWidth: 20,
                    onPressed: () {},
                    child: WebsafeSvg.asset(
                      "assets/Icons/Sort.svg",
                      width: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: ListView.builder(
                  itemCount: emails.length,
                  itemBuilder: (context, index) => EmailCard(
                    isActive: Responsive.isMobile(context) ? false : index == 0,
                    email: emails[index],
                    press: Responsive.isMobile(context)
                        ? () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    EmailScreen(email: emails[index]),
                              ),
                            );
                          }
                        : () {},
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
