import 'package:flutter/material.dart';
import 'package:gog/main.dart';
import 'package:gog/ui/PopUpScreen/settings.dart';

/// Flutter code sample for [Dialog].

void main() => runApp( Settings());


class Settings extends StatefulWidget{
  const Settings({super.key});

  @override
    State<Settings> createState() => _SettingsDialog();




}


class _SettingsDialog extends State<Settings> {
   double bgm_val =50;
   double sfx_val =50;

   void updatevalues(double bgmval, double sfxval){
    setState(() {
      bgm_val=bgmval;
      sfx_val=sfxval;
    });


   }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Dialog Sample')),
        body:  Center(
          child: Column
          (mainAxisAlignment: MainAxisAlignment.center,
          children: 
          
            [SettingsContent(updatevalues),
             Text("bgm value: ${bgm_val.toString()}"),
             Text("sfx value: ${sfx_val.toString()}")                          
            ]
          ),
        ),
      ),
    );
  }
}



class SettingsContent extends StatefulWidget{
  final Function update;
  const SettingsContent(this.update, {super.key});

  @override
    State<SettingsContent> createState() => _SettingsContent();



}


class _SettingsContent extends State<SettingsContent> {
   double bgm_val =_SettingsDialog().bgm_val;
   double sfx_val =_SettingsDialog().sfx_val;




  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => Dialog(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const Text('Settings'),
                const SizedBox(height: 15),
                Slider(
                  value: bgm_val, 
                  min: 0,
                  max: 100,
                  divisions: 100,
                  label: bgm_val.toStringAsFixed(0),  
                  onChanged: (double value){
                    setState(() {
                      bgm_val=value;
                      widget.update(bgm_val,sfx_val);
                  });
                  } ),
                const SizedBox(height: 15),
                Slider(
                  value: sfx_val, 
                  max: 100,  
                  onChanged: (double value){
                    setState(() {
                      sfx_val=value;
                      widget.update(bgm_val,sfx_val);
                  });
                  }),
                const SizedBox(height: 15),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'),
                ),
              ],
            ),
          ),
        ),
      ),
      child: const Text('Show Dialog'),
    );
  }
}


