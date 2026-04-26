package com.angcyo.flutter3.abc

import android.graphics.Color
import android.os.Build
import android.os.Bundle
import android.view.Window
import android.view.WindowManager
import androidx.core.view.WindowCompat
import io.flutter.embedding.android.FlutterActivity

/**
 * 2023-10-20
 * */
class MainActivity : FlutterActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        //enableEdgeToEdgeOld()
        //window.decorView.setBackgroundColor(Color.MAGENTA)

        //2026-4-26 沉浸式
        enableEdgeToEdge(window)
    }

    /**
     * https://developer.android.com/about/versions/15/behavior-changes-15#edge-to-edge
     * */
    private fun enableEdgeToEdgeOld() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.P /*28*/) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R /*30*/) {
                window.attributes.layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS
            } else {
                window.attributes.layoutInDisplayCutoutMode =
                    WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            }
        }
    }

    /**
     * Copy from [androidx.core:core:1.18.0]
     * [androidx.core.view.WindowCompat.enableEdgeToEdge]
     * */
    private fun enableEdgeToEdge(window: Window) {
        // This triggers the initialization of the decor view here to prevent the attributes set by
        // this method from getting overwritten by the initialization later.
        window.decorView

        WindowCompat.setDecorFitsSystemWindows(window, false)
        window.statusBarColor = Color.TRANSPARENT
        window.navigationBarColor = Color.TRANSPARENT
        if (Build.VERSION.SDK_INT >= 28) { // Build.VERSION_CODES.P
            val newMode =
                if (Build.VERSION.SDK_INT >= 30) WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_ALWAYS
                else WindowManager.LayoutParams.LAYOUT_IN_DISPLAY_CUTOUT_MODE_SHORT_EDGES
            val attrs = window.attributes
            if (attrs.layoutInDisplayCutoutMode != newMode) {
                attrs.layoutInDisplayCutoutMode = newMode
                window.attributes = attrs
            }
        }
        if (Build.VERSION.SDK_INT >= 29) { //Build.VERSION_CODES.Q
            window.isStatusBarContrastEnforced = false
            window.isNavigationBarContrastEnforced = false
        }
    }
}