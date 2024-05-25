import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal();
  factory AudioManager() => _instance;

  AudioManager._internal() {
    _backgroundPlayer = AudioPlayer();
    _sfxPlayer = AudioPlayer();
  }

  late AudioPlayer _backgroundPlayer;
  late AudioPlayer _sfxPlayer;

  Future<void> playBackgroundMusic(String filePath, {bool loop = true}) async {
    await _backgroundPlayer.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
    await _backgroundPlayer.play(AssetSource(filePath));
  }

  Future<void> stopBackgroundMusic() async {
    await _backgroundPlayer.stop();
  }

  Future<void> playSfx(String filePath) async {
    await _sfxPlayer.play(AssetSource(filePath));
  }

   Future<void> setBackgroundVolume(double volume) async {
    await _backgroundPlayer.setVolume(volume);
  }

  Future<void> setSoundEffectsVolume(double volume) async {
    await _sfxPlayer.setVolume(volume);
  }
}
