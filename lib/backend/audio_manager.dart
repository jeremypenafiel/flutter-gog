import 'package:audioplayers/audioplayers.dart';

class AudioManager {
  static final AudioManager _instance = AudioManager._internal(PlayerMode.lowLatency);
  factory AudioManager() => _instance;

  AudioManager._internal(PlayerMode lowLatency) {
    _backgroundPlayer = AudioPlayer();
    _sfxPlayer = AudioPlayer();
  }

  late AudioPlayer _backgroundPlayer;
  late AudioPlayer _sfxPlayer;

    final List<String> _killSfxFiles = [
      'Sounds/first-kill-sfx.mp3',
      'Sounds/second-kill-sfx.mp3',
      'Sounds/third-kill-sfx.mp3',
      'Sounds/fourth-kill-sfx.mp3',
      'Sounds/fifth-kill-sfx.mp3'
    ];
    int _killSfxIndex = 0;

  Future<void> playBackgroundMusic(String filePath, {bool loop = true}) async {
    await _backgroundPlayer.setReleaseMode(loop ? ReleaseMode.loop : ReleaseMode.release);
    await _backgroundPlayer.play(AssetSource(filePath));
  }

  Future<void> stopBackgroundMusic() async {
    await _backgroundPlayer.stop();
  }

  Future<void> resumeBackgroundMusic() async {
    await _backgroundPlayer.resume();
  }

  Future<void> pauseBackgroundMusic() async {
    await _backgroundPlayer.pause();
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

  Future<void> playKillSfx() async {
    await _sfxPlayer.play(AssetSource(_killSfxFiles[_killSfxIndex]));
    _killSfxIndex = (_killSfxIndex + 1) % _killSfxFiles.length;
  }
}
