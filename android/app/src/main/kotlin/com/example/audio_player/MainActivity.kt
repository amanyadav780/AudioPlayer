package com.example.audio_player

import android.media.MediaPlayer
import android.widget.Toast
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import kotlin.random.Random


class MainActivity: FlutterActivity(){



    private lateinit var music: MediaPlayer


    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)


        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "audioChannal").setMethodCallHandler {
                call, result ->
            if(call.method == "audioPlayer") {
                Toast.makeText(this, "Its a toast!", Toast.LENGTH_SHORT).show()


                if (!music.isPlaying) {
                    music.start()

                }
            }
            else {

            }
        }

    }

    override fun onDestroy() {
        super.onDestroy()
        if (music.isPlaying) {
            music.stop()
        }
        music.release() // Release the MediaPlayer resources
    }

}


