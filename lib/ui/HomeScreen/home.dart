import 'package:flutter/material.dart';
import 'package:gog/ui/PopUpScreen/popup.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:gog/backend/route_observer.dart';


class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> with RouteAware {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute? route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPopNext() {
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
  }

  
  @override
  Widget build(BuildContext context) {
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/background.jpg', 
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset('assets/Title.png'),
                ),
                SizedBox(height: 20),
                Container(
                  child: Text('EDIWOW ANG KADIPOTA MO GID'),
                ),
                SizedBox(height: 50),
                RoundedButton(
                  onPressed: () {
                    AudioManager().playSfx('Sounds/sfx-button.wav');
                    Navigator.pushNamed(context, '/board');
                  },
                  text: 'PLAY',
                ),
                SizedBox(height: 20),
                RoundedButton(
                  onPressed: () {
                    AudioManager().playSfx('Sounds/sfx-button.wav');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(popup: 1);
                      },
                    );
                  },
                  text: 'SETTINGS',
                ),
                SizedBox(height: 20),
                RoundedButton(
                  onPressed: () {

                    // Action for button 3
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(popup: 3);
                      },
                      );
                    AudioManager().playSfx('Sounds/sfx-button.wav');

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
