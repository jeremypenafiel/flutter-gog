import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gog/backend/font_provider.dart';
import 'package:gog/backend/game_controller.dart';
import 'package:gog/ui/BoardScreen/hierarchy_ui.dart';


class Popup extends StatefulWidget {
  final int popup;

  const Popup (
    {Key? key,
    required this.popup
    }):super(key:key);

  @override
  _PopupState createState() => _PopupState(popup: popup);
}

class _PopupState extends State<Popup> {
  double _soundEffectsVolume = 50.0;
  double _musicVolume = 50.0;
  final int popup;
  final AudioManager audioManager = AudioManager();
  _PopupState (
    {Key? key,
    required this.popup
    });

  @override
  void initState() {
    super.initState();
    _loadSettings();
  }

  Future<void> _loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _soundEffectsVolume = prefs.getDouble('soundEffectsVolume') ?? 50.0;
      _musicVolume = prefs.getDouble('musicVolume') ?? 50.0;
      audioManager.setBackgroundVolume(_musicVolume);
      audioManager.setSoundEffectsVolume(_soundEffectsVolume);
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('soundEffectsVolume', _soundEffectsVolume);
    await prefs.setDouble('musicVolume', _musicVolume);
  }

  void _resetSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('soundEffectsVolume', 50.0);
    await prefs.setDouble('musicVolume', 50.0);
    Provider.of<FontProvider>(context, listen: false).setSelectedFont('Roboto');
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    final fontProvider = Provider.of<FontProvider>(context);
    final String _popupName;
    final List<Widget> list=[];
    final List<Widget> _forActions=[];
    

    switch(popup){

      //settings
      case 1:
        _popupName="Settings";

        list.add(const Divider());
        list.add(const SizedBox(height: 15,));
        list.add(const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Font'
            ),
          )
        );

        list.add( Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(80, 35),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 212, 157, 75),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      AudioManager().playSfx('Sounds/button-sfx.mp3');
                      fontProvider.setSelectedFont('Roboto');
                      _saveSettings();
                    },
                    child: Text(
                      'Roboto',
                      style: GoogleFonts.roboto(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 7,),
                
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(80, 35),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 212, 157, 75),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      AudioManager().playSfx('Sounds/button-sfx.mp3');
                      fontProvider.setSelectedFont('Lobster');
                      _saveSettings();
                    },
                    child: Text(
                      'Lobster',
                      style: GoogleFonts.lobster(
                        color: Colors.black
                      ),
                    ),
                  ),
                ),

                const SizedBox(width: 7,),
                
                Flexible(
                  fit: FlexFit.tight,
                  child: ElevatedButton(
                    style: ButtonStyle(
                      minimumSize: MaterialStateProperty.all<Size>(
                        const Size(80, 35),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                      const Color.fromARGB(255, 212, 157, 75),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                    ),
                    onPressed: () {
                      AudioManager().playSfx('Sounds/button-sfx.mp3');
                      fontProvider.setSelectedFont('Oswald');
                      _saveSettings();
                    },
                    child: Text(
                      'Oswald',
                      style: GoogleFonts.oswald(
                        color: Colors.black),
                      
                    ),
                  ),
                ),
              ],
            ));

        list.add(const SizedBox(height: 20));

        list.add(const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Sound Effects Volume'
            ),
          )
        );

        list.add(Slider(
              value: _soundEffectsVolume,
              min: 0,
              max: 100,
              label: _soundEffectsVolume.round().toString(),
              activeColor: Colors.black54,
              inactiveColor: const Color.fromARGB(255, 196, 196, 196),
              thumbColor: const Color.fromARGB(255, 61, 61, 61),
              onChanged: (double value) {
                setState(() {
                  _soundEffectsVolume = value;
                });
                audioManager.setSoundEffectsVolume(_soundEffectsVolume/100);
                _saveSettings();
              },
            ));

        list.add(const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'Music Volume'
            ),
          )
        );    

        list.add(Slider(
              value: _musicVolume,
              min: 0,
              max: 100,
              label: _musicVolume.round().toString(),
              activeColor: Colors.black54,
              inactiveColor: const Color.fromARGB(255, 196, 196, 196),
              thumbColor: const Color.fromARGB(255, 61, 61, 61),
              onChanged: (double value) {
                setState(() {
                  _musicVolume = value;
                  
                });
                audioManager.setBackgroundVolume(_musicVolume/100);
                _saveSettings();
              },
            ));
 
        list.add(
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                const Color.fromARGB(255, 197, 197, 197),
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
              setState(() {
                // Reset volume sliders and variables to default values
                _musicVolume = 50; // Assuming default volume is 50%
                _soundEffectsVolume = 50; // Assuming default volume is 50%
              });
              audioManager.setBackgroundVolume(_musicVolume / 100);
              audioManager.setSoundEffectsVolume(_soundEffectsVolume / 100);
              _resetSettings();
            },
            child:  const Text(
              'Reset Settings',
              style: TextStyle(
                color: Colors.black
              ),
            ),
          ),
        );

        _forActions.add(TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 212, 157, 75),
            ),
          ),
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          onPressed: () {
            Navigator.of(context).pop();
          }));
      break;

      //On finish game
      case 2:
      AudioManager().playSfx('Sounds/victory-sfx.mp3');
        _popupName="Victory";
        _forActions.add(
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all<Color>(
                        const Color.fromARGB(255, 250, 133, 9),
                      ),
                      overlayColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 223, 146, 30),
                      ),
                      fixedSize: MaterialStateProperty.all<Size>(
                        const Size(100, 45),
                      ),
                      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      ),
                      shape: MaterialStateProperty.all<OutlinedBorder>(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                          side: const BorderSide(color: Colors.black),
                        ),
                      ),
                    ),
                    
                    onPressed: () {
                      AudioManager().playSfx('Sounds/button-sfx.mp3');
                      GameController gameController = Provider.of<GameController>(context, listen: false);
                      gameController.onReady();
                      Navigator.popUntil(context, ModalRoute.withName('/board'));
                    },
                    child:  const Text(
                      'NEW GAME',
                      style: TextStyle(
                        color: Colors.black
                      ),
                    ),
                  ),

              SizedBox(width: 10,),

              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                    Color.fromARGB(255, 255, 255, 255),
                  ),
                  overlayColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 223, 146, 30),
                  ),
                  fixedSize: MaterialStateProperty.all<Size>(
                    const Size(100, 45),
                  ),
                  padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  ),
                  shape: MaterialStateProperty.all<OutlinedBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                      side: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
                
                onPressed: () {
                  AudioManager().playSfx('Sounds/button-sfx.mp3');
                  Navigator.popUntil(context, ModalRoute.withName('/'));
                },
                child:  const Text(
                  'EXIT',
                  style: TextStyle(
                    color: Colors.black
                  ),
                ),
              ),
            ],
          )
        );
        break;

      //Guide
      case 3:
        _popupName="Guide";
        list.add(const Divider());
        
        list.add(
          const Text(
            "Pieces",
            style: TextStyle(fontSize: 20), // Increase font size to 20
          ),
        );
        list.add(const Text("Each player has a set of 21 pieces and represents as soldiers with hierarchy of ranks"));
        list.add(
          const Text(
            "Movement",
            style: TextStyle(fontSize: 20), // Increase font size to 20
          ),
        );
        list.add(const Text("Each player can move only one piece per turn and each piece can move one square, either forward, backward or sideways."));
        list.add(
          const Text(
            "Challenge",
            style: TextStyle(fontSize: 20), // Increase font size to 20
          ),
        );
        list.add(const Text("Each piece can challenge an opposing piece directly adjacent in front, behind or side of it. A challenge is initiated by placing the piece on the adjacent square where an opposing piece is located. Regardless of which piece initiated the challenge, the rank of the pieces determines which piece is to be removed from the board."));
        list.add(const Text("Pieces Rank/Hierarchy"));
        list.add(const HierarchyWidget(backgroundColor: Color.fromARGB(255, 38, 38, 38),));
        _forActions.add(TextButton(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(
            const Color.fromARGB(255, 212, 157, 75),
            ),
          ),
          child: const Text(
            'Close',
            style: TextStyle(
              color: Colors.black
            ),
          ),
          onPressed: () {
            AudioManager().playSfx('Sounds/button-sfx.mp3');
            Navigator.of(context).pop();
          }));

      //no assigned value
      default:
        _popupName="Error";
        _forActions.add(const Text(""));
        
    }
    
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(5)
        )
      ),
      title: Center(
        child: Text(_popupName)
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: list,
        ),
      ),
      actions: _forActions
      
    
    );
  }
}


