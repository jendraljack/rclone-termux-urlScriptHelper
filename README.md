# rclone-termux-urlScriptHelper
<h1>Rclone Termux url uploader Script Helper</h1><br/>
Skrip ini hanya untuk membantu Anda mengunggah berkas dari link download langsung ke penyimpanan awan Anda atau tanpa didownload ke penyimpanan perangkat/Android Anda, tentunya ini hanya untuk program rclone termux.
<br/>
<br/>
<b>1. pasang <a href="https://f-droid.org/packages/com.termux/">Termux Fdroid</a> di Android anda</b><br/>Pasang rclone di termux<br/>ketik:<pre>termux-setup-storage
pkg update
pkg install rclone</pre>
<b>2. Menambahkan akun cloud Anda</b><br/>
ketik: <pre>rclone config</pre><br/>
Ikuti langkahnya seperti <a href="https://rclone.org/drive/">Contoh ini untuk google drive</a><br/>untuk cloud lain tidak jauh berbeda.<br/>
<b>3. memulai skrip.</b><br/>
ketik: <pre>bash Url-RcloneToCloud-SkripHelper.sh</pre><br/>
Itu saja. OK
