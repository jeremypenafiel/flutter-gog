import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:gog/backend/font_provider.dart';

class SettingsPopup extends StatefulWidget {
  @override
  _SettingsPopupState createState() => _SettingsPopupState();
}

class _SettingsPopupState extends State<SettingsPopup> {
  double _soundEffectsVolume = 50.0;
  double _musicVolume = 50.0;

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
