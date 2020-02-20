package com.example.chat_app;

import android.os.Bundle;
import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;
import androidx.multidex.MultiDex;

public class MainActivity extends FlutterActivity {
  @Override
  protected void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);
    MultiDex.install(this);
    GeneratedPluginRegistrant.registerWith(this);
    
  }
}
