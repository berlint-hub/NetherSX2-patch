.class public Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;
.super Landroidx/fragment/app/o;
.source "SetupWizardDataDirectoryFragment.java"


# static fields
.field private static final REQ_CODE_FOLDER_PICKER:I = 0x3e9


# instance fields
.field private btnGrantPerm:Landroid/widget/Button;

.field private currentSelectedPath:Ljava/lang/String;

.field private rbCustom:Landroid/widget/RadioButton;

.field private rbInternal:Landroid/widget/RadioButton;

.field private tvPathDisplay:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetcurrentSelectedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$mopenFolderPicker(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V
    .registers 1

    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->openFolderPicker()V

    return-void
.end method

.method static bridge synthetic -$$Nest$mrequestAllFilesPermission(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->requestAllFilesPermission(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mselectCustomPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustomPath(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mselectInternal(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectInternal(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 33
    invoke-direct {p0}, Landroidx/fragment/app/o;-><init>()V

    .line 40
    const-string v0, ""

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    return-void
.end method

.method public static applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 386
    if-eqz p0, :cond_af

    if-nez p1, :cond_6

    goto/16 :goto_af

    .line 388
    :cond_6
    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "_preferences"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 389
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "UI/DataDirectory"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_2f} :catch_30

    .line 392
    goto :goto_34

    .line 390
    :catch_30
    move-exception v0

    .line 391
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 395
    :goto_34
    const-string v0, "internal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_52

    .line 396
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 397
    if-nez p1, :cond_47

    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object p1

    .line 398
    :cond_47
    if-eqz p1, :cond_4e

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_50

    :cond_4e
    const-string p0, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_50
    move-object p1, p0

    .line 399
    goto :goto_53

    .line 400
    :cond_52
    nop

    .line 404
    :goto_53
    :try_start_53
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 405
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 406
    new-instance v0, Ljava/io/File;

    const-string v1, "memcards"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 407
    new-instance v0, Ljava/io/File;

    const-string v1, "bios"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 408
    new-instance v0, Ljava/io/File;

    const-string v1, "cheats"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 409
    new-instance v0, Ljava/io/File;

    const-string v1, "covers"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 410
    new-instance v0, Ljava/io/File;

    const-string v1, "sstates"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 411
    new-instance v0, Ljava/io/File;

    const-string v1, "gamesettings"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 412
    new-instance v0, Ljava/io/File;

    const-string v1, "inputprofiles"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_a1
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_a1} :catch_a2

    .line 415
    goto :goto_a6

    .line 413
    :catch_a2
    move-exception p0

    .line 414
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 418
    :goto_a6
    :try_start_a6
    invoke-static {p1}, Lxyz/aethersx2/android/NativeLibrary;->setDataDirectory(Ljava/lang/String;)V
    :try_end_a9
    .catchall {:try_start_a6 .. :try_end_a9} :catchall_aa

    .line 421
    goto :goto_ae

    .line 419
    :catchall_aa
    move-exception p0

    .line 420
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 422
    :goto_ae
    return-void

    .line 386
    :cond_af
    :goto_af
    return-void
.end method

.method private dp(Landroid/content/Context;I)I
    .registers 4

    .line 43
    if-nez p1, :cond_5

    mul-int/lit8 p2, p2, 0x2

    return p2

    .line 44
    :cond_5
    int-to-float p2, p2

    .line 47
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 44
    const/4 v0, 0x1

    invoke-static {v0, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method private openFolderPicker()V
    .registers 4

    .line 309
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 310
    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 311
    const/16 v1, 0x43

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 313
    const/16 v1, 0x3e9

    :try_start_14
    invoke-virtual {p0, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_17} :catch_18

    .line 319
    goto :goto_29

    .line 314
    :catch_18
    move-exception v0

    .line 315
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 316
    if-eqz v0, :cond_29

    .line 317
    const-string v1, "Failed to launch folder picker"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 320
    :cond_29
    :goto_29
    return-void
.end method

.method private requestAllFilesPermission(Landroid/content/Context;)V
    .registers 5

    .line 323
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_42

    .line 325
    :try_start_6
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 326
    if-eqz p1, :cond_14

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    goto :goto_16

    :cond_14
    const-string p1, "xyz.aethersx2.android"

    :goto_16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "package:"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    .line 327
    invoke-virtual {p0, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_33} :catch_34

    .line 333
    goto :goto_42

    .line 328
    :catch_34
    move-exception p1

    .line 330
    :try_start_35
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 331
    invoke-virtual {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3f} :catch_40

    goto :goto_41

    .line 332
    :catch_40
    move-exception p1

    :goto_41
    nop

    .line 335
    :cond_42
    :goto_42
    return-void
.end method

.method private selectCustomPath(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    .line 301
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 302
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 303
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 304
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Selected: [Custom]\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 305
    invoke-static {p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 306
    return-void
.end method

.method private selectInternal(Landroid/content/Context;Ljava/lang/String;)V
    .registers 6

    .line 293
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 294
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/widget/RadioButton;->setChecked(Z)V

    .line 295
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 296
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Selected: [Internal Storage]\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 297
    const-string p2, "internal"

    invoke-static {p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 298
    return-void
.end method

.method private updatePermissionButton()V
    .registers 4

    .line 338
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    if-nez v0, :cond_5

    return-void

    .line 339
    :cond_5
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    const/16 v2, 0x8

    if-lt v0, v1, :cond_1b

    .line 340
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    .line 341
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    if-eqz v0, :cond_16

    goto :goto_17

    :cond_16
    const/4 v2, 0x0

    :goto_17
    invoke-virtual {v1, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 342
    goto :goto_20

    .line 343
    :cond_1b
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    invoke-virtual {v0, v2}, Landroid/widget/Button;->setVisibility(I)V

    .line 345
    :goto_20
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 349
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/o;->onActivityResult(IILandroid/content/Intent;)V

    .line 350
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_a1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_a1

    if-eqz p3, :cond_a1

    .line 351
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 352
    if-eqz p1, :cond_a1

    .line 353
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 354
    if-eqz p2, :cond_23

    .line 356
    :try_start_18
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    const/4 v0, 0x3

    invoke-virtual {p3, p1, v0}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_20} :catch_21

    goto :goto_22

    .line 360
    :catch_21
    move-exception p3

    :goto_22
    nop

    .line 363
    :cond_23
    nop

    .line 365
    :try_start_24
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_28} :catch_29

    .line 366
    goto :goto_2b

    :catch_29
    move-exception p1

    const/4 p1, 0x0

    .line 369
    :goto_2b
    const-string p3, "/storage/emulated/0/"

    if-eqz p1, :cond_4f

    const-string v0, "primary:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 370
    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_9e

    .line 371
    :cond_4f
    if-eqz p1, :cond_88

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_88

    .line 372
    const/16 p3, 0x3a

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    .line 373
    const/4 v0, 0x0

    invoke-virtual {p1, v0, p3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    add-int/lit8 p3, p3, 0x1

    invoke-virtual {p1, p3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/storage/"

    invoke-virtual {p3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "/"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 374
    goto :goto_9e

    :cond_88
    if-eqz p1, :cond_9c

    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_9e

    .line 377
    :cond_9c
    const-string p1, "/storage/emulated/0/Download/ps2"

    .line 380
    :goto_9e
    invoke-direct {p0, p2, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustomPath(Landroid/content/Context;Ljava/lang/String;)V

    .line 383
    :cond_a1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 25

    .line 53
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 54
    if-nez v1, :cond_e

    if-eqz p1, :cond_e

    .line 55
    invoke-virtual/range {p1 .. p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 58
    :cond_e
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 59
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 60
    const v4, -0xededee

    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->setBackgroundColor(I)V

    .line 62
    new-instance v4, Landroid/widget/LinearLayout;

    invoke-direct {v4, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 63
    invoke-virtual {v4, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 64
    const/16 v5, 0x14

    invoke-direct {v0, v1, v5}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x10

    invoke-direct {v0, v1, v7}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v0, v1, v5}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/16 v10, 0x18

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v4, v6, v8, v9, v10}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 65
    invoke-virtual {v2, v4}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 68
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 69
    const-string v8, "Data Location"

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 70
    const/high16 v8, 0x41d00000    # 26.0f

    const/4 v9, 0x2

    invoke-virtual {v6, v9, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 71
    sget-object v8, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 72
    const/4 v8, -0x1

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 73
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 76
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 77
    const-string v10, "Choose where NetherSX2 stores core data (settings, memory cards, save states, BIOS, and cheats)."

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    const/high16 v10, 0x41600000    # 14.0f

    invoke-virtual {v6, v9, v10}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 79
    const v10, -0x333334

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 80
    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v0, v1, v5}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    const/4 v12, 0x0

    invoke-virtual {v6, v12, v11, v12, v5}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 81
    invoke-virtual {v4, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 84
    const/4 v5, 0x0

    if-eqz v1, :cond_8b

    invoke-virtual {v1, v5}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v6

    goto :goto_8c

    :cond_8b
    move-object v6, v5

    .line 85
    :goto_8c
    if-eqz v6, :cond_93

    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v6

    goto :goto_95

    :cond_93
    const-string v6, "/sdcard/Android/data/xyz.aethersx2.android/files"

    .line 88
    :goto_95
    if-eqz v1, :cond_b3

    .line 89
    invoke-virtual {v1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v5

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v11, "_preferences"

    invoke-virtual {v5, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v1, v5, v12}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v5

    goto :goto_b4

    :cond_b3
    nop

    .line 90
    :goto_b4
    const-string v11, ""

    if-eqz v5, :cond_bf

    const-string v13, "UI/DataDirectory"

    invoke-interface {v5, v13, v11}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    goto :goto_c0

    :cond_bf
    move-object v5, v11

    .line 91
    :goto_c0
    if-nez v5, :cond_c3

    goto :goto_c4

    :cond_c3
    move-object v11, v5

    .line 94
    :goto_c4
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 95
    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 96
    const/16 v13, 0xe

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    const/16 v15, 0xc

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v5, v14, v7, v12, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 97
    new-instance v7, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v7}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 98
    const v12, -0xe1e1e2

    invoke-virtual {v7, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 99
    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    int-to-float v13, v13

    invoke-virtual {v7, v13}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 100
    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const v14, -0xcccccd

    invoke-virtual {v7, v13, v14}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 101
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 103
    new-instance v7, Landroid/widget/RadioButton;

    invoke-direct {v7, v1}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    .line 104
    const-string v13, "Internal Storage (Default)"

    invoke-virtual {v7, v13}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 105
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    const/high16 v13, 0x41800000    # 16.0f

    invoke-virtual {v7, v9, v13}, Landroid/widget/RadioButton;->setTextSize(IF)V

    .line 106
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    sget-object v13, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v7, v13}, Landroid/widget/RadioButton;->setTypeface(Landroid/graphics/Typeface;)V

    .line 107
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    invoke-virtual {v7, v8}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 108
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 110
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 111
    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "Path: "

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    const-string v14, "\nIsolated app storage. No special permissions required, but files will be removed if NetherSX2 is uninstalled."

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v7, v13}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 112
    const/high16 v13, 0x41400000    # 12.0f

    invoke-virtual {v7, v9, v13}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 113
    const v14, -0x666667

    invoke-virtual {v7, v14}, Landroid/widget/TextView;->setTextColor(I)V

    .line 114
    const/16 v14, 0x20

    invoke-direct {v0, v1, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, 0x4

    invoke-direct {v0, v1, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v14, 0x0

    invoke-virtual {v7, v13, v9, v14, v14}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 115
    invoke-virtual {v5, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 117
    invoke-virtual {v4, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 120
    new-instance v7, Landroid/view/View;

    invoke-direct {v7, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 121
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v13, 0x10

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v9, v8, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 125
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 126
    invoke-virtual {v7, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 127
    const/16 v9, 0xe

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v7, v13, v14, v9, v8}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 128
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 129
    invoke-virtual {v8, v12}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 130
    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    int-to-float v9, v9

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 131
    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const v12, -0xcccccd

    invoke-virtual {v8, v9, v12}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 132
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 134
    new-instance v8, Landroid/widget/RadioButton;

    invoke-direct {v8, v1}, Landroid/widget/RadioButton;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    .line 135
    const-string v9, "Custom Directory (Recommended)"

    invoke-virtual {v8, v9}, Landroid/widget/RadioButton;->setText(Ljava/lang/CharSequence;)V

    .line 136
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    const/high16 v9, 0x41800000    # 16.0f

    const/4 v12, 0x2

    invoke-virtual {v8, v12, v9}, Landroid/widget/RadioButton;->setTextSize(IF)V

    .line 137
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    sget-object v9, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v8, v9}, Landroid/widget/RadioButton;->setTypeface(Landroid/graphics/Typeface;)V

    .line 138
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    const/4 v9, -0x1

    invoke-virtual {v8, v9}, Landroid/widget/RadioButton;->setTextColor(I)V

    .line 139
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 141
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 142
    const-string v9, "Choose a custom folder (e.g. /sdcard/download/ps2 or /sdcard/documents/ps2). Accessible to file managers; preserves memory cards and save states across app updates."

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 143
    const/high16 v9, 0x41400000    # 12.0f

    const/4 v12, 0x2

    invoke-virtual {v8, v12, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 144
    const v9, -0x666667

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 145
    const/16 v9, 0x20

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    const/4 v12, 0x4

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    const/4 v14, 0x0

    invoke-virtual {v8, v9, v13, v14, v12}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 146
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 149
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    .line 150
    const/high16 v9, 0x41500000    # 13.0f

    const/4 v12, 0x2

    invoke-virtual {v8, v12, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 151
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    const v12, -0xb03c09

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 152
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    const/16 v12, 0xa

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-virtual {v8, v13, v14, v12, v9}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 153
    new-instance v8, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v8}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 154
    const v9, 0x2200e5ff

    invoke-virtual {v8, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 155
    const/4 v9, 0x6

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    int-to-float v12, v12

    invoke-virtual {v8, v12}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 156
    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    const v13, 0x5500e5ff

    invoke-virtual {v8, v12, v13}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 157
    iget-object v12, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    invoke-virtual {v12, v8}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 158
    iget-object v8, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPathDisplay:Landroid/widget/TextView;

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 161
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 162
    const-string v12, "Quick presets:"

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 163
    const/high16 v12, 0x41400000    # 12.0f

    const/4 v13, 0x2

    invoke-virtual {v8, v13, v12}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 164
    const v12, -0x777778

    invoke-virtual {v8, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 165
    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    const/4 v13, 0x4

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, 0x0

    invoke-virtual {v8, v14, v12, v14, v13}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 166
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 168
    new-instance v8, Landroid/widget/LinearLayout;

    invoke-direct {v8, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 169
    invoke-virtual {v8, v14}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 171
    const/4 v12, 0x3

    new-array v13, v12, [Ljava/lang/String;

    const-string v16, "Download/ps2"

    aput-object v16, v13, v14

    const-string v16, "Documents/ps2"

    aput-object v16, v13, v3

    const-string v16, "NetherSX2"

    const/16 v17, 0x2

    aput-object v16, v13, v17

    .line 172
    new-array v10, v12, [Ljava/lang/String;

    const-string v18, "/storage/emulated/0/Download/ps2"

    aput-object v18, v10, v14

    const-string v14, "/storage/emulated/0/Documents/ps2"

    aput-object v14, v10, v3

    const-string v3, "/storage/emulated/0/NetherSX2"

    aput-object v3, v10, v17

    .line 178
    const/4 v3, 0x0

    :goto_2ac
    if-ge v3, v12, :cond_311

    .line 179
    aget-object v14, v10, v3

    .line 180
    new-instance v12, Landroid/widget/Button;

    invoke-direct {v12, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 181
    aget-object v15, v13, v3

    invoke-virtual {v12, v15}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 182
    const/high16 v15, 0x41300000    # 11.0f

    const/4 v9, 0x2

    invoke-virtual {v12, v9, v15}, Landroid/widget/Button;->setTextSize(IF)V

    .line 183
    const/4 v9, -0x1

    invoke-virtual {v12, v9}, Landroid/widget/Button;->setTextColor(I)V

    .line 184
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x26

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    move-object/from16 v19, v13

    const/high16 v13, 0x3f800000    # 1.0f

    move-object/from16 v20, v2

    const/4 v2, 0x0

    invoke-direct {v9, v2, v15, v13}, Landroid/widget/LinearLayout$LayoutParams;-><init>(IIF)V

    .line 185
    if-lez v3, :cond_2e0

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v9, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMarginStart(I)V

    .line 186
    :cond_2e0
    invoke-virtual {v12, v9}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 187
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 188
    const v9, -0xd5d5d6

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 189
    const/4 v9, 0x6

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    int-to-float v9, v13

    invoke-virtual {v2, v9}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 190
    invoke-virtual {v12, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 191
    nop

    .line 192
    new-instance v2, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;

    invoke-direct {v2, v0, v1, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v12, v2}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 198
    invoke-virtual {v8, v12}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 178
    add-int/lit8 v3, v3, 0x1

    move-object/from16 v13, v19

    move-object/from16 v2, v20

    const/4 v9, 0x6

    const/4 v12, 0x3

    const/16 v15, 0xc

    goto :goto_2ac

    .line 200
    :cond_311
    move-object/from16 v20, v2

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 203
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    .line 204
    const-string v3, "Choose Other Directory..."

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 205
    const/high16 v3, 0x41500000    # 13.0f

    const/4 v8, 0x2

    invoke-virtual {v2, v8, v3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 206
    const/4 v3, -0x1

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 207
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    .line 208
    const/16 v9, 0x2c

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v8, v3, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 210
    const/16 v3, 0xc

    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v9, 0x0

    invoke-virtual {v8, v9, v3, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 211
    invoke-virtual {v2, v8}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 212
    new-instance v3, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v3}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 213
    const v8, -0xff7685

    invoke-virtual {v3, v8}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 214
    const/4 v8, 0x6

    invoke-direct {v0, v1, v8}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    int-to-float v8, v9

    invoke-virtual {v3, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 215
    invoke-virtual {v2, v3}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 216
    new-instance v3, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;

    invoke-direct {v3, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 222
    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 225
    new-instance v2, Landroid/widget/Button;

    invoke-direct {v2, v1}, Landroid/widget/Button;-><init>(Landroid/content/Context;)V

    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    .line 226
    const-string v3, "Grant All Files Permission"

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setText(Ljava/lang/CharSequence;)V

    .line 227
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    const/high16 v3, 0x41400000    # 12.0f

    const/4 v8, 0x2

    invoke-virtual {v2, v8, v3}, Landroid/widget/Button;->setTextSize(IF)V

    .line 228
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    const/16 v3, -0x3380

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setTextColor(I)V

    .line 229
    new-instance v2, Landroid/widget/LinearLayout$LayoutParams;

    .line 230
    const/16 v3, 0x28

    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v8, -0x1

    invoke-direct {v2, v8, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 232
    const/16 v3, 0x8

    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v8, 0x0

    invoke-virtual {v2, v8, v3, v8, v8}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 233
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 234
    new-instance v2, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v2}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 235
    const v3, -0xc1d8dd

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 236
    const/4 v3, 0x6

    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v2, v3}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 237
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    invoke-virtual {v3, v2}, Landroid/widget/Button;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 238
    nop

    .line 239
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    new-instance v3, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;

    invoke-direct {v3, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/widget/Button;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 245
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnGrantPerm:Landroid/widget/Button;

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 247
    invoke-virtual {v4, v7}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 250
    nop

    .line 251
    new-instance v2, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;

    invoke-direct {v2, v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v5, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 257
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbInternal:Landroid/widget/RadioButton;

    new-instance v3, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;

    invoke-direct {v3, v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 264
    new-instance v2, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;

    invoke-direct {v2, v0, v6, v10, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v7, v2}, Landroid/widget/LinearLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 272
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->rbCustom:Landroid/widget/RadioButton;

    new-instance v3, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$7;

    invoke-direct {v3, v0, v6, v10, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$7;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V

    invoke-virtual {v2, v3}, Landroid/widget/RadioButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 282
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_404

    const-string v2, "internal"

    invoke-virtual {v2, v11}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_404

    invoke-virtual {v11, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_400

    goto :goto_404

    .line 285
    :cond_400
    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustomPath(Landroid/content/Context;Ljava/lang/String;)V

    goto :goto_407

    .line 283
    :cond_404
    :goto_404
    invoke-direct {v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectInternal(Landroid/content/Context;Ljava/lang/String;)V

    .line 288
    :goto_407
    invoke-direct/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updatePermissionButton()V

    .line 289
    return-object v20
.end method
