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
    // Play background music when the home page is opened
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
  }

  @override
  void dispose() {
    WidgetsBinding.instance?.removeObserver(this);
    routeObserver.unsubscribe(this);
    // Stop background music when the home page is disposed
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
      // Pause background music when the app is sent to the background
      AudioManager().pauseBackgroundMusic();
    } else if (state == AppLifecycleState.resumed) {
      // Resume background music when the app is brought to the foreground
      AudioManager().resumeBackgroundMusic();
    }
  }

  @override
  void didPopNext() {
    // Resume background music when returning to the home page from another route
    AudioManager().playBackgroundMusic('Sounds/home-bg-music.mp3');
  }

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
                Container(
                  child: Text('EDIWOW ANG KADIPOTA MO GID'),
                ),
                SizedBox(height: 50),

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
