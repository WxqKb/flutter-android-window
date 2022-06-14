package qiuxiang.android_window_example

import android.graphics.Color
import android.graphics.drawable.ColorDrawable
import android.os.Bundle
import android.os.PersistableBundle
import io.flutter.embedding.android.FlutterActivity

class MainActivity : qiuxiang.android_window.AndroidWindowActivity() {
    override fun onCreate(savedInstanceState: Bundle?, persistentState: PersistableBundle?) {
        super.onCreate(savedInstanceState, persistentState)
        // 设置窗口背景透明
    }

    override fun onResume() {
        super.onResume()
        // 点击外部，dialog不消失
        setFinishOnTouchOutside(false)
        window.setBackgroundDrawable(ColorDrawable(Color.TRANSPARENT))
        // 设置窗口大小
        var lp = window.attributes
        lp.width = context.resources.getDimension(R.dimen.dialog_widget).toInt()
        lp.height = context.resources.getDimension(R.dimen.dialog_height).toInt()
        window.attributes = lp
    }

}