import 'package:basic_state_management/theme.dart';
import 'package:flutter/material.dart';
import 'theme.dart';

void main() {
  runApp(PaymentApps());
}

class PaymentApps extends StatefulWidget {
  @override
  State<PaymentApps> createState() => _PaymentAppsState();
}

class _PaymentAppsState extends State<PaymentApps> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    Widget option(int index, String title, String subtitle, String pricing) {
      return GestureDetector(
        onTap: () {
          setState(() {
            selectedIndex = index;
          });
        },
        child: Container(
          padding: EdgeInsets.all(20),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            border: Border.all(
              color: selectedIndex == index
                  ? Color(0xff007DFF)
                  : Color(0xff40587C),
            ),
          ),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  selectedIndex == index
                      ? Image.asset(
                          'assets/icon_two.png',
                          width: 18,
                          height: 18,
                        )
                      : Image.asset(
                          'assets/icon_one.png',
                          width: 18,
                          height: 18,
                        ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: planTextStyle,
                      ),
                      Text(
                        subtitle,
                        style: descTextStyle,
                      ),
                    ],
                  ),
                  SizedBox(width: 91),
                  Text(
                    pricing,
                    style: priceTextStyle,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }

    Widget header() {
      //* ini untuk widget bagian gmbr logo + judul + sub judul
      return Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 32, right: 32),
        child: SafeArea(
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  'assets/logo.png',
                  width: 267,
                  height: 200,
                ),
              ),
              SizedBox(height: 50.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Upgrade To',
                    style: titleTextStyle,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Text(
                    'Pro',
                    style: titleProTextStyle,
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Text(
                'Go unlock all feature and \nbuild your own bussiner bigger',
                style: subtitleTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      );
    }

    Widget checkoutButton() {
      return Column(
        children: [
          Container(
            width: 311,
            height: 51.23,
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Color(0xff007DFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(71),
                ),
              ),
              onPressed: () {},
              child: Text(
                'CheckOut NOW',
                style: buttonTextStyle,
              ),
            ),
          )
        ],
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xff04112F),
        body: SingleChildScrollView(
          child: Column(
            children: [
              header(),
              SizedBox(height: 50),
              option(0, 'Monthly', 'Good for starting up', '\$20'),
              option(1, 'Quartely', 'Focus on Building', '\$55'),
              option(2, 'Yearly', 'Steady company', '\$220'),
              SizedBox(height: 50),
              selectedIndex == -1 ? SizedBox() : checkoutButton(),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}
