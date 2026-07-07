package com.example.cescpro
import android.os.Build
import android.os.Bundle
import android.view.View
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity(){

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //解决部分小米手机底部白色区域改成黑色，和app 主题色统一
        window.navigationBarColor =
            android.graphics.Color.BLACK
    }
}


