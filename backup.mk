################################################################################
sudo adb reboot bootloader
cd out/target/product/alto5_vdf
sudo /local/tools/fastboot flash boot boot.img;
sudo /local/tools/fastboot flash cache cache.img;
#sudo /local/tools/fastboot flash custpack custpack.img;
sudo /local/tools/fastboot flash persist persist.img;
sudo /local/tools/fastboot flash recovery recovery.img;
sudo /local/tools/fastboot flash system system.img;
sudo /local/tools/fastboot flash userdata userdata.img;
sudo /local/tools/fastboot reboot




################################################################################
      repo init -u git@172.16.11.162:quicl/manifests.git -m l8916_vdf_la2.0.xml
备份: a.tar -cvf jb32cdr_repo_backup /local2/jb32_cdr/.repo  
      c.tar -xvf jb32cdr_repo_backup jb32_cdr/.repo
      d.repo sync -l
5、老项目的编译还是按照原来的方式加入prebuilt，修改envsetup.sh后再编译




################################################################################
smb://172.26.8.53/share_server/
http://172.26.8.53/wiki/doku.php
http://bugzilla.tcl-ta.com/
http://172.16.11.162:8081/#/
https://172.16.12.62/teleweb/
http://manpower.tclcom.com/SitePages/ReviewTimeSheet.aspx
http://172.24.63.229/msgm/login.aspx
http://imps.tcl-ta.com/cailiang/drm/drm/CombinedDelivery/Image/Binary/Index1




################################################################################
adb shell mount -o remount -t ext4 /custpack




################################################################################
git add .
git commit -am "your comment"
git format-patch -1 




################################################################################
RootCause: 原因
Solution:  解决方案
TestCase:  测试方法

RootCause：数据库操作没有保护。
Solution：几处没有保护的地方，增加了保护
TestCase：按出错检测，再次测试。

/* ========================================================================== */
/*     Modifications on Features list / Changes Request / Problems Report     */
/* -------------------------------------------------------------------------- */
/*    date   |        author        |         Key          |     comment      */
/* ----------|----------------------|----------------------|----------------- */
/* 11/28/2014|jianlong.ren          |       848619         |install app       */
/* ----------|----------------------|----------------------|----------------- */
/******************************************************************************/

    //[FEATURE]-Begin-Modiry by jianlong.ren,11/27/2014,799656
    //[FEATURE]-End-Modify By jianlong.ren

###%%%comment:[VF]TCD-DRM_-REQ-000730:OMA DRM Forward Lock
###%%%bug number:799656
###%%%product name:alto5_vdf
###%%%root cause:Coding
###%%%Module_Impact:packages/apps/Email
###%%%Test_Suggestion:test as target.
###%%%Solution:add drm.
###%%%Test_Report:ok

git add .
patch_delivery_cli.php -p aaabbbcc

git push ssh://jianlong.ren@172.16.11.162:29418/quicl/platform/packages/providers/DownloadProvider.git HEAD:refs/for/l8916_vdf_la2.1
git push ssh://jianlong.ren@172.16.11.162:29418/quicl/platform/packages/apps/Launcher3.git HEAD:refs/for/l8916_vdf_la2.0
git push ssh://jianlong.ren@172.16.11.162:29418/quicl/platform/packages/providers/MediaProvider.git HEAD:refs/for/l8916_vdf_la2.0

git push ssh://jianlong.ren@172.16.11.162:29418/quicl/platform/packages/apps/Launcher2.git HEAD:refs/for/l8916_vdf_la2.0


################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
################################################################################
锁屏流程:
================================================================================
各个重要类的初始化流程：
PhoneWindowManager					--------|
                      -->  systemReady()			|
								|
KeyguardServiceDelegate						|
在构造方法中通过aidl启动systemUI中的KeyguardService服务	--------|---framework
                      --> onSystemReady()
-----------------------------------------------------------------------------
KeyguardService
启动服务 onCareate() 的时候，会创建
            com.android.systemui.keyguard.KeyguardViewMediator.class,
            com.android.systemui.recent.Recents.class,
            com.android.systemui.volume.VolumeUI.class,
            com.android.systemui.statusbar.SystemBars.class,
            com.android.systemui.usb.StorageNotification.class,
            com.android.systemui.power.PowerUI.class,
            com.android.systemui.media.RingtonePlayer.class
这些类的实例，
                      --> onSystemReady方法是被远程调用的（不是重点）

在实例化的后，调用各重要类的接口start(),来初始化内部的成员：
com.android.systemui.keyguard.KeyguardViewMediator.class:
初始化 KeyguardDisplayManager 和 KeyguardUpdateMonitor ，这两个类在keyguard jar包里，以此来联系
SystemUI 和 Keyguard 两个模块。

com.android.systemui.statusbar.SystemBars.class:
在构造方法里，调用ServiceMonitor来判断并观察 Settings.Secure.BAR_SERVICE_COMPONENT 的值，这个值存放第三方的锁屏应用
（构成须是 service ）,如果有存放的第三方锁屏应用，则启用第三方锁屏， 如果没有则使用反射初始化 SystemUI 自带的锁屏：
PhoneStatusBar (createStatusBarFromConfig)，这个类实际上就是我们常见的滑动解锁界面，包括在SystemUI中.
    注：我们经常以为手机的滑动解锁是锁屏，其实不是，滑动解锁其实相当于屏幕保护界面，它对手机没有一点保护作用，唯一的一点应该就是
防止误操作，这点与PhoneStatusBar类定义在SystemUI中而不是在Keyguard jar包里相互印证，而真正的锁屏则特指：PIN码，SIM PIN码，
密码， SIM PUK码，图案解锁，应该还要包括未出的指纹解锁。

各类作用：
KeyguardBottomAreaView 底部“电话” “锁屏” “相机”对应的View.

KeyguardSecurityContainer
                      -->  showSecurityScreen
################################################################################

/*[BUGFIX]-Mod-BEGIN by TCTNJ(jianlong.ren), 2014/12/24, PR873914*/
/*[BUGFIX]-Mod-END by TCTNJ(jianlong.ren)*/

archermind@am-nbtcl-100:~$sudo adb logcat | egrep -rn "MediaDocumentsProvider|Documents\(|ContentProviderNative"
13080:D/Documents( 5401): Current stack: 
13081:D/Documents( 5401):  * null
13159:D/Documents( 5401): Update found 6 roots in 2526ms
13178:D/Documents( 5401): Update found 6 roots in 1939ms
13194:E/Documents( 5401): recent URI: content://com.android.providers.media.documents/root/images_root/recent
13204:E/Documents( 5401): recent URI: content://com.android.providers.downloads.documents/root/downloads/recent
13217:D/Documents( 5401): Before filtering 0, after 0
13218:D/Documents( 5401): Before filtering 2, after 2
13219:D/Documents( 5401): Found 2 of 2 recent queries done
13314:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	create	 id = 1
13315:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground 	 id = 1
13319:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->try 	 id = 1
13323:E/MediaDocumentsProvider( 4945): OPEN:id = image:35>>>>>>>>>>>>>>>>>>>>
13324:E/MediaDocumentsProvider( 4945): pfd != null -1 >>> thubnail id = 35
13325:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->catch 	 id = 1
13326:W/Documents( 5401): Failed to load thumbnail for content://com.android.providers.media.documents/document/image%3A35: 
13327:W/Documents( 5401): java.io.FileNotFoundException: No such file or directory
13328:W/Documents( 5401): 	at android.database.DatabaseUtils.readExceptionWithFileNotFoundExceptionFromParcel(DatabaseUtils.java:146)
13329:W/Documents( 5401): 	at android.content.ContentProviderProxy.openTypedAssetFile(ContentProviderNative.java:689)
13330:W/Documents( 5401): 	at android.content.ContentProviderClient.openTypedAssetFileDescriptor(ContentProviderClient.java:360)
13331:W/Documents( 5401): 	at android.provider.DocumentsContract.getDocumentThumbnail(DocumentsContract.java:825)
13332:W/Documents( 5401): 	at com.android.documentsui.DirectoryFragment$ThumbnailAsyncTask.doInBackground(DirectoryFragment.java:1059)
13333:W/Documents( 5401): 	at com.android.documentsui.DirectoryFragment$ThumbnailAsyncTask.doInBackground(DirectoryFragment.java:1013)
13334:W/Documents( 5401): 	at android.os.AsyncTask$2.call(AsyncTask.java:288)
13335:W/Documents( 5401): 	at java.util.concurrent.FutureTask.run(FutureTask.java:237)
13336:W/Documents( 5401): 	at com.android.documentsui.ProviderExecutor.run(ProviderExecutor.java:107)
13337:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->Log 	 id = 1
13338:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->finally 	 id = 1
13339:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	preempt	 id = 1
13340:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	create	 id = 2
13341:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground 	 id = 2
13342:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->try 	 id = 2
13343:E/MediaDocumentsProvider( 4945): OPEN:id = image:35>>>>>>>>>>>>>>>>>>>>
13344:E/MediaDocumentsProvider( 4945): pfd != null -1 >>> thubnail id = 35
13345:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->catch 	 id = 2
13346:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	create	 id = 3
13347:W/Documents( 5401): Failed to load thumbnail for content://com.android.providers.media.documents/document/image%3A35: 
13348:W/Documents( 5401): java.io.FileNotFoundException: No such file or directory
13349:W/Documents( 5401): 	at android.database.DatabaseUtils.readExceptionWithFileNotFoundExceptionFromParcel(DatabaseUtils.java:146)
13350:W/Documents( 5401): 	at android.content.ContentProviderProxy.openTypedAssetFile(ContentProviderNative.java:689)
13351:W/Documents( 5401): 	at android.content.ContentProviderClient.openTypedAssetFileDescriptor(ContentProviderClient.java:360)
13352:W/Documents( 5401): 	at android.provider.DocumentsContract.getDocumentThumbnail(DocumentsContract.java:825)
13353:W/Documents( 5401): 	at com.android.documentsui.DirectoryFragment$ThumbnailAsyncTask.doInBackground(DirectoryFragment.java:1059)
13354:W/Documents( 5401): 	at com.android.documentsui.DirectoryFragment$ThumbnailAsyncTask.doInBackground(DirectoryFragment.java:1013)
13355:W/Documents( 5401): 	at android.os.AsyncTask$2.call(AsyncTask.java:288)
13356:W/Documents( 5401): 	at java.util.concurrent.FutureTask.run(FutureTask.java:237)
13357:W/Documents( 5401): 	at com.android.documentsui.ProviderExecutor.run(ProviderExecutor.java:107)
13358:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->Log 	 id = 2
13359:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->finally 	 id = 2
13360:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	doInBackground 	 id = 3
13361:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	doInBackground -->try 	 id = 3
13371:E/MediaDocumentsProvider( 4945): OPEN:id = image:34>>>>>>>>>>>>>>>>>>>>
13372:E/MediaDocumentsProvider( 4945): pfd != null -1 >>> thubnail id = 34
13380:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	onPostExecute 	 id = 2
13398:E/MediaDocumentsProvider( 4945): pfd == null +1 thubnail id = 34
13401:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	doInBackground -->result != null 	 id = 3
13402:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	doInBackground -->finally 	 id = 3
13403:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	onPostExecute 	 id = 3
13404:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A34	onPostExecute -->setImageBitmap 	 id = 3
13411:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	create	 id = 4
13412:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground 	 id = 4
13413:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->try 	 id = 4
13414:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	preempt	 id = 4
13415:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->catch 	 id = 4
13416:E/Documents( 5401): TASK: uri = content://com.android.providers.media.documents/document/image%3A35	doInBackground -->finally 	 id = 4



################################################################################
################################################################################
################################################################################





