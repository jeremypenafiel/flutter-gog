import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class SettingsPopup extends StatefulWidget {
  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  double _soundEffectsVolume = 50.0;
  double _musicVolume = 50.0;
  String _selectedFont = 'Font 1';

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
      _selectedFont = prefs.getString('selectedFont') ?? 'Font 1';
    });
  }

  Future<void> _saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('soundEffectsVolume', _soundEffectsVolume);
    await prefs.setDouble('musicVolume', _musicVolume);
    await prefs.setString('selectedFont', _selectedFont);
  }

  void _resetSettings() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setDouble('soundEffectsVolume', 50.0);
    await prefs.setDouble('musicVolume', 50.0);
    await prefs.setString('selectedFont', 'Font 1');
    _loadSettings();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Settings'),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text('Choose Font:'),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFont = 'Font 1';
                    });
                    _saveSettings();
                  },
                  child: Text('Font 1'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFont = 'Font 2';
                    });
                    _saveSettings();
                  },
                  child: Text('Font 2'),
                ),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      _selectedFont = 'Font 3';
                    });
                    _saveSettings();
                  },
                  child: Text('Font 3'),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text('Sound Effects Volume'),
            Slider(
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
            ),
            Text('Music Volume'),
            Slider(
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
            ),
            TextButton(
              onPressed: () {
                _resetSettings();
              },
              child: Text('Reset to Default'),
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}

