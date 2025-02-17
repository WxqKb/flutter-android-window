package qiuxiang.android_window

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.content.Intent
import android.content.res.Configuration
import android.os.Build
import android.os.IBinder
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.embedding.engine.dart.DartExecutor

class WindowService : android.app.Service() {
    private lateinit var engine: FlutterEngine
    private lateinit var androidWindow: AndroidWindow
    private var running = false
    private val channelId = "foreground"
    private var draggable = true

    override fun onBind(intent: Intent): IBinder? {
        return null
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        androidWindow.updateLayout()
    }

    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        println(">>>> WindowService onStartCommand")
        if (!running) {
            engine = FlutterEngine(application)
            (application as AndroidWindowApplication).androidWindowMessenger =
                engine.dartExecutor.binaryMessenger
            val entry = intent.getStringExtra("entry") ?: "androidWindow"
            val entryPoint = DartExecutor.DartEntrypoint(findAppBundlePath(), entry)
            engine.dartExecutor.executeDartEntrypoint(entryPoint)

            val focusable = intent.getBooleanExtra("focusable", false)
            val width = intent.getIntExtra("width", 600)
            val height = intent.getIntExtra("height", 800)

            val x = intent.getIntExtra("x", 0)
            val y = intent.getIntExtra("y", 0)
            draggable = intent.getBooleanExtra("draggable", true)
            androidWindow = AndroidWindow(this, focusable, draggable, width, height, x, y, engine)
            androidWindow.open()
            startForeground(1, getNotification())
            running = true
        }
        return super.onStartCommand(intent, flags, startId)
    }

    private fun getNotification(): Notification {
        return if (Build.VERSION.SDK_INT > Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                channelId,
                "Window Service",
                NotificationManager.IMPORTANCE_DEFAULT
            )
            val notificationManager = getSystemService(NOTIFICATION_SERVICE) as NotificationManager
            notificationManager.createNotificationChannel(channel)
            Notification.Builder(this, channel.id)
        } else {
            @Suppress("Deprecation")
            Notification.Builder(this)
        }.build()
    }

    override fun onDestroy() {
        androidWindow.close()
        engine.destroy()
    }
}
