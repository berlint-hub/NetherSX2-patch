.class public Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;
.super Landroidx/fragment/app/o;
.source "SetupWizardDataDirectoryFragment.java"


# static fields
.field private static final REQ_CODE_ALL_FILES:I = 0x3ea

.field private static final REQ_CODE_FOLDER_PICKER:I = 0x3e9


# instance fields
.field private currentSelectedPath:Ljava/lang/String;

.field private customSavedPath:Ljava/lang/String;

.field private defaultInternalPath:Ljava/lang/String;

.field private ivCustomCheck:Landroid/widget/ImageView;

.field private ivDefaultCheck:Landroid/widget/ImageView;

.field private tvCustomSubtitle:Landroid/widget/TextView;

.field private tvGrantPermission:Landroid/widget/TextView;

.field private tvPermissionStatus:Landroid/widget/TextView;


# direct methods
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

.method static bridge synthetic -$$Nest$mselectDefault(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectDefault(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 26
    invoke-direct {p0}, Landroidx/fragment/app/o;-><init>()V

    .line 30
    const-string v0, ""

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 31
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    return-void
.end method

.method public static applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 359
    if-eqz p0, :cond_9b

    if-nez p1, :cond_6

    goto/16 :goto_9b

    .line 361
    :cond_6
    :try_start_6
    invoke-static {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 362
    if-eqz v0, :cond_19

    .line 363
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "UI/DataDirectory"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_19} :catch_1a

    .line 367
    :cond_19
    goto :goto_1e

    .line 365
    :catch_1a
    move-exception v0

    .line 366
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 369
    :goto_1e
    nop

    .line 370
    const-string v0, "internal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 371
    :cond_2d
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 372
    if-nez p1, :cond_38

    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object p1

    .line 373
    :cond_38
    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_41

    :cond_3f
    const-string p0, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_41
    move-object p1, p0

    .line 377
    :cond_42
    :try_start_42
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 378
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 379
    new-instance v0, Ljava/io/File;

    const-string v1, "memcards"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 380
    new-instance v0, Ljava/io/File;

    const-string v1, "bios"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 381
    new-instance v0, Ljava/io/File;

    const-string v1, "cheats"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 382
    new-instance v0, Ljava/io/File;

    const-string v1, "covers"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 383
    new-instance v0, Ljava/io/File;

    const-string v1, "sstates"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 384
    new-instance v0, Ljava/io/File;

    const-string v1, "gamesettings"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 385
    new-instance v0, Ljava/io/File;

    const-string v1, "inputprofiles"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_90} :catch_91

    .line 388
    goto :goto_95

    .line 386
    :catch_91
    move-exception p0

    .line 387
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 391
    :goto_95
    :try_start_95
    invoke-static {p1}, Lxyz/aethersx2/android/NativeLibrary;->setDataDirectory(Ljava/lang/String;)V
    :try_end_98
    .catchall {:try_start_95 .. :try_end_98} :catchall_99

    .line 394
    goto :goto_9a

    .line 392
    :catchall_99
    move-exception p0

    .line 395
    :goto_9a
    return-void

    .line 359
    :cond_9b
    :goto_9b
    return-void
.end method

.method private createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;
    .registers 6

    .line 407
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 408
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 410
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 411
    const/16 v1, 0x10

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 412
    const/16 v2, 0xe

    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 413
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 414
    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 415
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 416
    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setFocusable(Z)V

    .line 417
    return-object v0
.end method

.method private createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .registers 7

    .line 421
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 422
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 424
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 425
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 426
    const/high16 p2, 0x41880000    # 17.0f

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 427
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 428
    const/4 p2, -0x1

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 429
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 431
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 432
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 433
    const/high16 p3, 0x41500000    # 13.0f

    invoke-virtual {p2, v2, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 434
    const-string p3, "#9E9E9E"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 435
    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p3

    int-to-float p3, p3

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p3, v1}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 436
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p3, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 438
    const/4 v1, 0x4

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 439
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 440
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 442
    return-object v0
.end method

.method private dp(Landroid/content/Context;I)I
    .registers 4

    .line 446
    if-nez p1, :cond_5

    mul-int/lit8 p2, p2, 0x2

    return p2

    .line 447
    :cond_5
    int-to-float p2, p2

    .line 448
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 447
    const/4 v0, 0x1

    invoke-static {v0, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method private getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 461
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    .line 462
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 463
    if-eqz p2, :cond_1a

    .line 465
    :try_start_14
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_18} :catch_19

    return-object p1

    .line 466
    :catch_19
    move-exception p1

    .line 468
    :cond_1a
    return-object v0
.end method

.method private static getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 398
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 400
    :cond_4
    :try_start_4
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_9

    return-object p0

    .line 401
    :catchall_9
    move-exception v0

    .line 402
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

    move-result-object p0

    return-object p0
.end method

.method private getSelectableItemBackground(Landroid/content/Context;)I
    .registers 6

    .line 452
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 453
    :cond_4
    new-instance v1, Landroid/util/TypedValue;

    invoke-direct {v1}, Landroid/util/TypedValue;-><init>()V

    .line 454
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const v2, 0x101030e

    const/4 v3, 0x1

    invoke-virtual {p1, v2, v1, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p1

    if-eqz p1, :cond_1a

    .line 455
    iget p1, v1, Landroid/util/TypedValue;->resourceId:I

    return p1

    .line 457
    :cond_1a
    return v0
.end method

.method private openFolderPicker()V
    .registers 3

    .line 289
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 290
    const/16 v1, 0xc3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 294
    const/16 v1, 0x3e9

    invoke-virtual {p0, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    .line 297
    goto :goto_16

    .line 295
    :catch_12
    move-exception v0

    .line 296
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 298
    :goto_16
    return-void
.end method

.method private requestAllFilesPermission(Landroid/content/Context;)V
    .registers 5

    .line 270
    if-nez p1, :cond_3

    return-void

    .line 271
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_3e

    .line 273
    const/16 v0, 0x3ea

    :try_start_b
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

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

    .line 274
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 275
    invoke-virtual {p0, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_30} :catch_31

    .line 283
    goto :goto_3e

    .line 276
    :catch_31
    move-exception p1

    .line 278
    :try_start_32
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 279
    invoke-virtual {p0, p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_3c} :catch_3d

    .line 282
    goto :goto_3e

    .line 280
    :catch_3d
    move-exception p1

    .line 285
    :cond_3e
    :goto_3e
    return-void
.end method

.method private selectCustom(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 346
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 347
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 348
    invoke-static {p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 349
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 350
    return-void
.end method

.method private selectDefault(Landroid/content/Context;)V
    .registers 3

    .line 353
    const-string v0, "internal"

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 354
    invoke-static {p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 355
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 356
    return-void
.end method

.method private updateUiState()V
    .registers 9

    .line 222
    const-string v0, "internal"

    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_17

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    goto :goto_18

    :cond_17
    :goto_17
    const/4 v0, 0x1

    .line 223
    :goto_18
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    const/16 v4, 0x8

    if-eqz v3, :cond_27

    .line 224
    if-eqz v0, :cond_22

    const/4 v5, 0x0

    goto :goto_24

    :cond_22
    const/16 v5, 0x8

    :goto_24
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 226
    :cond_27
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    if-eqz v3, :cond_34

    .line 227
    if-nez v0, :cond_2f

    const/4 v5, 0x0

    goto :goto_31

    :cond_2f
    const/16 v5, 0x8

    :goto_31
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 229
    :cond_34
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    const/4 v5, -0x1

    if-eqz v3, :cond_68

    .line 230
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    const-string v6, "#9E9E9E"

    if-eqz v3, :cond_54

    .line 231
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    const-string v3, "Tap to select custom data directory"

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 232
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v0, v3}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_68

    .line 234
    :cond_54
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    iget-object v7, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v3, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 235
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    if-eqz v0, :cond_64

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    goto :goto_65

    :cond_64
    const/4 v0, -0x1

    :goto_65
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 238
    :cond_68
    :goto_68
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x1e

    if-lt v0, v3, :cond_b4

    .line 239
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    .line 240
    if-eqz v0, :cond_97

    .line 241
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    if-eqz v0, :cond_8d

    .line 242
    const-string v1, "All Files Access Granted"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 243
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    const-string v1, "#81C784"

    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 244
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setClickable(Z)V

    .line 246
    :cond_8d
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_b3

    .line 247
    const-string v1, "Permission active for custom storage"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_b3

    .line 250
    :cond_97
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    if-eqz v0, :cond_aa

    .line 251
    const-string v2, "Grant All Files Permission"

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 252
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 253
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setClickable(Z)V

    .line 255
    :cond_aa
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_b3

    .line 256
    const-string v1, "Required on Android 11+ for custom folder access"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 259
    :cond_b3
    :goto_b3
    goto :goto_c2

    .line 260
    :cond_b4
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    if-eqz v0, :cond_bb

    .line 261
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 263
    :cond_bb
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    if-eqz v0, :cond_c2

    .line 264
    invoke-virtual {v0, v4}, Landroid/widget/TextView;->setVisibility(I)V

    .line 267
    :cond_c2
    :goto_c2
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 302
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/o;->onActivityResult(IILandroid/content/Intent;)V

    .line 303
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_1a

    .line 304
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 305
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1e

    if-lt p1, p2, :cond_19

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result p1

    if-eqz p1, :cond_19

    .line 306
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->openFolderPicker()V

    .line 308
    :cond_19
    return-void

    .line 310
    :cond_1a
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_b0

    const/4 p1, -0x1

    if-ne p2, p1, :cond_b0

    if-eqz p3, :cond_b0

    .line 311
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 312
    if-eqz p1, :cond_b0

    .line 313
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 314
    if-eqz p2, :cond_39

    .line 316
    :try_start_2f
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    const/4 v0, 0x3

    invoke-virtual {p3, p1, v0}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_37} :catch_38

    .line 320
    goto :goto_39

    .line 318
    :catch_38
    move-exception p3

    .line 322
    :cond_39
    :goto_39
    nop

    .line 324
    :try_start_3a
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p3
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3e} :catch_3f

    .line 327
    goto :goto_41

    .line 325
    :catch_3f
    move-exception p3

    const/4 p3, 0x0

    .line 328
    :goto_41
    nop

    .line 329
    if-eqz p3, :cond_68

    const-string v0, "primary:"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_68

    .line 330
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {p3, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "/storage/emulated/0/"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_a5

    .line 331
    :cond_68
    if-eqz p3, :cond_a1

    const-string v0, ":"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 332
    const/4 p1, 0x2

    invoke-virtual {p3, v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    .line 333
    const/4 p3, 0x0

    aget-object p3, p1, p3

    array-length v0, p1

    const/4 v1, 0x1

    if-le v0, v1, :cond_81

    aget-object p1, p1, v1

    goto :goto_83

    :cond_81
    const-string p1, ""

    :goto_83
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "/storage/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    const-string v0, "/"

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 334
    goto :goto_a5

    .line 335
    :cond_a1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 338
    :goto_a5
    if-eqz p1, :cond_b0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_b0

    .line 339
    invoke-direct {p0, p2, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustom(Landroid/content/Context;Ljava/lang/String;)V

    .line 343
    :cond_b0
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 20

    .line 42
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 45
    const/4 v2, 0x0

    if-eqz v1, :cond_d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 46
    :cond_d
    if-nez v2, :cond_15

    if-eqz v1, :cond_15

    .line 47
    invoke-virtual {v1}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object v2

    .line 49
    :cond_15
    if-eqz v2, :cond_1c

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    :cond_1c
    const-string v2, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_1e
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    .line 51
    invoke-static {v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 52
    const-string v3, "internal"

    if-eqz v2, :cond_2f

    const-string v4, "UI/DataDirectory"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_30

    :cond_2f
    move-object v2, v3

    .line 53
    :goto_30
    if-eqz v2, :cond_44

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_44

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3f

    goto :goto_44

    .line 57
    :cond_3f
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 58
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    goto :goto_4a

    .line 54
    :cond_44
    :goto_44
    iput-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 55
    const-string v2, ""

    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 62
    :goto_4a
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 65
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 66
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 68
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 70
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 71
    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 72
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v4, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 74
    const/16 v6, 0x14

    invoke-direct {v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    const/16 v9, 0xa

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v0, v1, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v5, v8, v9, v10, v11}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 77
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 78
    const-string v9, "Data Directory"

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 79
    const/high16 v9, 0x41c00000    # 24.0f

    const/4 v10, 0x2

    invoke-virtual {v8, v10, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 80
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 81
    invoke-virtual {v8, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 82
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 85
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 86
    const-string v9, "NetherSX2 needs a directory to store its data files, including memory cards, save states, BIOS, and covers. You can use the default app-internal storage or select a custom folder."

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 87
    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v8, v10, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 88
    const-string v9, "#B0BEC5"

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 89
    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    int-to-float v9, v9

    const/high16 v11, 0x3f800000    # 1.0f

    invoke-virtual {v8, v9, v11}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 90
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 92
    const/16 v11, 0x8

    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    iput v12, v9, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 93
    const/16 v12, 0x10

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    iput v13, v9, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 94
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 95
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 98
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v8

    .line 99
    const-string v9, "Default Storage"

    iget-object v13, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    invoke-direct {v0, v1, v9, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 100
    new-instance v13, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v13, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 102
    invoke-virtual {v13, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 103
    const/16 v14, 0x65

    invoke-virtual {v13, v12, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 104
    const/16 v15, 0xc

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v13, v11}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 105
    invoke-virtual {v9, v13}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 106
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 108
    new-instance v9, Landroid/widget/ImageView;

    invoke-direct {v9, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    .line 109
    invoke-virtual {v9, v14}, Landroid/widget/ImageView;->setId(I)V

    .line 110
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    const-string v11, "ic_baseline_check_24"

    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v13

    invoke-virtual {v9, v13}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 111
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v9, v4}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 112
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    .line 113
    const/16 v13, 0x18

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v9, v14, v10}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 114
    const/16 v10, 0x15

    invoke-virtual {v9, v10}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 115
    const/16 v14, 0xf

    invoke-virtual {v9, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 116
    iget-object v14, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v14, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 117
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 119
    new-instance v9, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;

    invoke-direct {v9, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 125
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 128
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 129
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 130
    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v9, v4, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 131
    const/4 v14, 0x4

    invoke-direct {v0, v1, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v0, v1, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    const/4 v14, 0x0

    invoke-virtual {v9, v14, v10, v14, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 132
    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 133
    const-string v9, "#1FFFFFFF"

    invoke-static {v9}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 134
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 137
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v8

    .line 138
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_18a

    const-string v9, "Tap to select custom data directory"

    goto :goto_18c

    :cond_18a
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 139
    :goto_18c
    const-string v10, "Custom Folder"

    invoke-direct {v0, v1, v10, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 140
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    iput-object v10, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    .line 141
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v10, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 143
    invoke-virtual {v10, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 144
    const/16 v6, 0x66

    invoke-virtual {v10, v12, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 145
    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-virtual {v10, v12}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 146
    invoke-virtual {v9, v10}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 147
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 149
    new-instance v9, Landroid/widget/ImageView;

    invoke-direct {v9, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    .line 150
    invoke-virtual {v9, v6}, Landroid/widget/ImageView;->setId(I)V

    .line 151
    iget-object v6, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v9

    invoke-virtual {v6, v9}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 152
    iget-object v6, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v6, v4}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 153
    new-instance v6, Landroid/widget/RelativeLayout$LayoutParams;

    .line 154
    const/16 v9, 0x18

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v0, v1, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-direct {v6, v10, v11}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 155
    const/16 v9, 0x15

    invoke-virtual {v6, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 156
    const/16 v9, 0xf

    invoke-virtual {v6, v9}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 157
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v9, v6}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 158
    iget-object v6, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v8, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 162
    new-instance v6, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;

    invoke-direct {v6, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v8, v6}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 179
    new-instance v6, Landroid/widget/LinearLayout;

    invoke-direct {v6, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 180
    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 181
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 183
    const/16 v7, 0x18

    invoke-direct {v0, v1, v7}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    iput v7, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 184
    invoke-virtual {v6, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 186
    new-instance v7, Landroid/widget/TextView;

    invoke-direct {v7, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    .line 187
    const-string v8, "Grant All Files Permission"

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 188
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    const/high16 v8, 0x41700000    # 15.0f

    const/4 v9, 0x2

    invoke-virtual {v7, v9, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 189
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    sget-object v8, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v7, v8}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 190
    iget-object v7, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 191
    iget-object v4, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result v7

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 192
    iget-object v4, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v4, v3}, Landroid/widget/TextView;->setClickable(Z)V

    .line 193
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    const/16 v4, 0x8

    invoke-direct {v0, v1, v4}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x4

    invoke-direct {v0, v1, v8}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v3, v14, v4, v7, v8}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 194
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    new-instance v4, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;

    invoke-direct {v4, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 200
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvGrantPermission:Landroid/widget/TextView;

    invoke-virtual {v6, v3}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 202
    new-instance v3, Landroid/widget/TextView;

    invoke-direct {v3, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    .line 203
    const-string v1, "Required on Android 11+ for custom folder access"

    invoke-virtual {v3, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 204
    iget-object v1, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    const/high16 v3, 0x41500000    # 13.0f

    const/4 v4, 0x2

    invoke-virtual {v1, v4, v3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 205
    iget-object v1, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    const-string v3, "#9E9E9E"

    invoke-static {v3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 206
    iget-object v1, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvPermissionStatus:Landroid/widget/TextView;

    invoke-virtual {v6, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 208
    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 209
    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 211
    invoke-direct/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 212
    return-object v2
.end method

.method public onResume()V
    .registers 1

    .line 217
    invoke-super {p0}, Landroidx/fragment/app/o;->onResume()V

    .line 218
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 219
    return-void
.end method
