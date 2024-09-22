package com.example.audio_player

import android.media.MediaPlayer
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random


class MainActivity : FlutterActivity() {


    private lateinit var music: MediaPlayer


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "audioChannal"
        ).setMethodCallHandler { call, result ->
            if (call.method == "audioPlayed") {
                val assetPath = call.arguments as String
                playAudio(assetPath)

            } else if (call.method == "audioStop") {

                pauseAudio()


            } else {
                Toast.makeText(this, "someThing went wrong", Toast.LENGTH_SHORT).show()
            }
        }

    }


    private fun playAudio(assetPath: String) {

        mediaPlayer?.stop()
        mediaPlayer?.release()


        val assetFileDescriptor = assets.openFd(assetPath)
        mediaPlayer = MediaPlayer().apply {
            setDataSource(
                assetFileDescriptor.fileDescriptor,
                assetFileDescriptor.startOffset,
                assetFileDescriptor.length
            )
            prepare()
            start()
        }


        private fun pauseAudio() {
            mediaPlayer?.pause()
        }
    }

    override fun onDestroy() {
        super.onDestroy()
        if (music.isPlaying) {
            music.stop()
        }
        music.release()
    }

}


