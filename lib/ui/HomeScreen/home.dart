import 'package:flutter/material.dart';
import 'package:gog/ui/PopUpScreen/settings.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Home Page'),
      // ),
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', // Replace 'assets/background.jpg' with your image path
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: 
                  Image.asset('assets/Title.png',
                  ),
                ),
                
                SizedBox(height: 20),

                Container(
                  child: Text(
                    'EDIWOW ANG KADIPOTA MO GID'
                    ),
                ),

                SizedBox(height: 50),

                RoundedButton(
                  onPressed: () {
                    // Action for button 1
                    Navigator.pushNamed(context, '/board');
                  },
                  text: 'PLAY',
                ),
                SizedBox(height: 20),
                RoundedButton(
                  onPressed: () {
                    // Action for button 2
                    // 
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return SettingsPopup();
                      },
                    );

                  },
                  text: 'SETTINGS',
                ),
                SizedBox(height: 20),
                RoundedButton(
                  onPressed: () {
                    // Action for button 3
                  },
                  text: 'GUIDE',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatefulWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  _RoundedButtonState createState() => _RoundedButtonState();
}

class _RoundedButtonState extends State<RoundedButton> {
  bool _isTapped = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) {
        setState(() {
          _isTapped = true;
        });
      },
      onTapUp: (_) {
        setState(() {
          _isTapped = false;
        });
        widget.onPressed();
      },
      onTapCancel: () {
        setState(() {
          _isTapped = false;
        });
      },
      child: Container(
        width: 184,
        height: 62,
        decoration: BoxDecoration(
          color: _isTapped ? Colors.orange : Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: _isTapped ? Colors.orange : Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: _isTapped ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
