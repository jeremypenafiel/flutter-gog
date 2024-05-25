import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gog/backend/font_provider.dart';

class SettingsPopup extends StatefulWidget {
  final int popup;

  const SettingsPopup (
    {Key? key,
    required this.popup
    }):super(key:key);

  @override
  _SettingsPopupState createState() => _SettingsPopupState(popup: popup);
}

class _SettingsPopupState extends State<SettingsPopup> {
  double _soundEffectsVolume = 50.0;
  double _musicVolume = 50.0;
  final int popup;
  _SettingsPopupState (
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
    final Widget _forActions;

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
                _saveSettings();
              },
            ));
        list.add(TextButton(
              onPressed: () {
                _resetSettings();
              },
              child: Text('Reset to Default'),
            ),);
        _forActions=TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          });
      
      //On finish game
      case 2:
        _popupName="Victory";
        _forActions=Text("");

      //no assigned value
      default:
        _popupName="Error";
        _forActions=Text("");
        
    }
    
    return AlertDialog(
      title: Center(child: Text('$_popupName')),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: list
        ),
      ),
      actions: <Widget>[
       _forActions
      ],
    
      );
  }
}


