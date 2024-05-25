import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gog/backend/audio_manager.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gog/backend/font_provider.dart';

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
        list.add(Text('Choose Font:'));
        list.add( Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    fontProvider.setSelectedFont('Roboto');
                    _saveSettings();
                  },
                  child: Text('Roboto'),
                ),
                ElevatedButton(
                  onPressed: () {
                    fontProvider.setSelectedFont('Lobster');
                    _saveSettings();
                  },
                  child: Text('Lobster'),
                ),
                ElevatedButton(
                  onPressed: () {
                    fontProvider.setSelectedFont('Oswald');
                    _saveSettings();
                  },
                  child: Text('Oswald'),
                ),
              ],
            ));
        list.add(SizedBox(height: 20));
        list.add(Text('Sound Effects Volume'));
        list.add(Slider(
              value: _soundEffectsVolume,
              min: 0,
              max: 100,
              divisions: 10,
              label: _soundEffectsVolume.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _soundEffectsVolume = value;
                });
                audioManager.setSoundEffectsVolume(_soundEffectsVolume);
                _saveSettings();
              },
            ));
        list.add( Text('Music Volume'));
        list.add(Slider(
              value: _musicVolume,
              min: 0,
              max: 100,
              divisions: 10,
              label: _musicVolume.round().toString(),
              onChanged: (double value) {
                setState(() {
                  _musicVolume = value;
                  
                });
                audioManager.setBackgroundVolume(_musicVolume);
                _saveSettings();
              },
            ));
        list.add(TextButton(
              onPressed: () {
                _resetSettings();
              },
              child: Text('Reset to Default'),
            ),);
        _forActions.add(TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          }));
      
      //On finish game
      case 2:
        _popupName="Victory";
        _forActions.add(Row(
          children: [
            TextButton(style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 250, 133, 9)), child: Text('New Game'),
              onPressed: () {
              Navigator.pushNamed(context, '/board');
              }),
            Expanded(child: SizedBox(width: 20,)),
            TextButton(style: TextButton.styleFrom(backgroundColor: Color.fromARGB(255, 187, 1, 1)), child: Text('Exit Game  '),
              onPressed: () {
              Navigator.pushNamed(context, '/');
          })
          ],));
        

      //Guide
      case 3:
        _popupName="Guide";
        list.add(Text("Pieces"));
        list.add(Text("Each player has a set of 21 pieces and represents as soldiers with hierarchy of ranks"));
        list.add(Text("Movement"));
        list.add(Text("Each player can move only one piece per turn and each piece can move one square, either forward, backward or sideways."));
        list.add(Text("Challenge"));
        list.add(Text("Each piece can challenge an opposing piece directly adjacent in front, behind or side of it. A challenge is initiated by placing the piece on the adjacent square where an opposing piece is located. Regardless of which piece initiated the challenge, the rank of the pieces determines which piece is to be removed from the board."));
        list.add(Text("Pieces Rank/Hierarchy"));
        list.add(Container(color: Colors.grey,
          child: Column(children: [
            Row(children: [Image.asset("assets/White Pieces/white_5star_general.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_4star_general.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_3star_general.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_2star_general.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_1star_general.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_colonel.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_lt_colonel.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_major.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_captain.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_1st_lieut.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_2nd_lieut.png"),Expanded(child: Text("Eliminates any lower-ranking officer below it, the Private, and the Flag except the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_sergeant.png"),Expanded(child: Text("Eliminates only the Private and the Flag."))],),
            Row(children: [Image.asset("assets/White Pieces/white_private.png"),Expanded(child: Text("Eliminates only the Spy."))],),
            Row(children: [Image.asset("assets/White Pieces/white_spy.png"),Expanded(child: Text("Eliminates any piece except the Private."))],),
            Row(children: [Image.asset("assets/White Pieces/white_flag.png"),Expanded(child: Text("Can not eliminate any piece. Losing this piece is instant loss and making it reach the other end of the board is instant win."))],),
            
            ],),
        ));
        _forActions.add(TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          }));

      //no assigned value
      default:
        _popupName="Error";
        _forActions.add(Text(""));
        
    }
    
    return AlertDialog(
      title: Center(child: Text('$_popupName')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: list
        ),
      ),
      actions: _forActions
      
    
      );
  }
}


