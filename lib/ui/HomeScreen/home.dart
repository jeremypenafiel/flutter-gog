import 'package:flutter/material.dart';
import 'package:gog/ui/PopUpScreen/popup.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:gog/backend/route_observer.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with RouteAware, WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance?.addObserver(this);
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    routeObserver.unsubscribe(this);
    AudioManager().stopBackgroundMusic();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    ModalRoute? route = ModalRoute.of(context);
    if (route is PageRoute) {
      routeObserver.subscribe(this, route);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.paused) {
      AudioManager().pauseBackgroundMusic();
    } else if (state == AppLifecycleState.resumed) {
      AudioManager().resumeBackgroundMusic();
    }
  }

  @override
  void didPopNext() {
    setState(() {
      _messageIndex = (_messageIndex + 1) % _messages.length;
    });
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
  }

  final List<String> _messages = [
    'All warfare is based on deception.',
    'The skillful soldier does not raise a second levy, neither are his supply-wagons loaded more than twice.',
    'He will win who knows when to fight and when not to fight.',
    'Making no mistakes is what establishes the certainty of victory, for it means conquering an enemy that is already defeated.',
    'If the enemy leaves a door open, you must rush in.'
  ];
  int _messageIndex = 0;

  @override
  Widget build(BuildContext context) {
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
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(_messages[_messageIndex],
                    style: const TextStyle(fontWeight: FontWeight.bold),),
                  ),
                ),
                SizedBox(height: 80),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 212, 157, 75),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(120, 45),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: () {
                    AudioManager().playSfx('Sounds/button-sfx.mp3');
                    Navigator.pushNamed(context, '/board');
                  },
                  child:  const Text(
                    'PLAY',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

                // RoundedButton(
                //   onPressed: () {
                //     AudioManager().playSfx('Sounds/button-sfx.mp3');
                //     Navigator.pushNamed(context, '/board');
                //   },
                //   text: 'PLAY',
                // ),
                SizedBox(height: 20),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 212, 157, 75),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(120, 45),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: () {
                    AudioManager().playSfx('Sounds/button-sfx.mp3');
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(popup: 1);
                      },
                    );
                  },
                  child:  const Text(
                    'SETTINGS',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

                // RoundedButton(
                //   onPressed: () {
                //     AudioManager().playSfx('Sounds/button-sfx.mp3');
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return Popup(popup: 1);
                //       },
                //     );
                //   },
                //   text: 'SETTINGS',
                // ),

                SizedBox(height: 20),

                ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 255, 255, 255),
                    ),
                    overlayColor: MaterialStateProperty.all<Color>(
                    const Color.fromARGB(255, 212, 157, 75),
                    ),
                    fixedSize: MaterialStateProperty.all<Size>(
                      const Size(120, 45),
                    ),
                    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                    ),
                    shape: MaterialStateProperty.all<OutlinedBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                  
                  onPressed: () {
                    // Action for button 3
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Popup(popup: 3);
                      },
                    );
                    AudioManager().playSfx('Sounds/button-sfx.mp3');
                  },
                  child:  const Text(
                    'GUIDE',
                    style: TextStyle(
                      color: Colors.black
                    ),
                  ),
                ),

                // RoundedButton(
                //   onPressed: () {
                //     // Action for button 3
                //     showDialog(
                //       context: context,
                //       builder: (BuildContext context) {
                //         return Popup(popup: 3);
                //       },
                //     );
                //     AudioManager().playSfx('Sounds/button-sfx.mp3');
                //   },
                //   text: 'GUIDE',
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const RoundedButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 184,
        height: 62,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(2),
          border: Border.all(
            color: Colors.white,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
