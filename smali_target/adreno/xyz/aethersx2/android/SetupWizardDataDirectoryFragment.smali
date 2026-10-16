.class public Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;
.super Landroidx/fragment/app/o;
.source "SetupWizardDataDirectoryFragment.java"


# static fields
.field private static final REQ_CODE_FOLDER_PICKER:I = 0x3e9


# instance fields
.field private btnClearCustom:Landroid/widget/ImageButton;

.field private currentSelectedPath:Ljava/lang/String;

.field private customSavedPath:Ljava/lang/String;

.field private defaultInternalPath:Ljava/lang/String;

.field private ivCustomCheck:Landroid/widget/ImageView;

.field private ivDefaultCheck:Landroid/widget/ImageView;

.field private permissionBanner:Landroid/widget/LinearLayout;

.field private tvCustomSubtitle:Landroid/widget/TextView;


# direct methods
.method static bridge synthetic -$$Nest$fgetcustomSavedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    return-object p0
.end method

.method static bridge synthetic -$$Nest$fputcustomSavedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    return-void
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

.method static bridge synthetic -$$Nest$mselectCustom(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    invoke-direct {p0, p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustom(Landroid/content/Context;Ljava/lang/String;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mselectDefault(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V
    .registers 2

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectDefault(Landroid/content/Context;)V

    return-void
.end method

.method static bridge synthetic -$$Nest$mupdateUiState(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V
    .registers 1

    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    return-void
.end method

.method public constructor <init>()V
    .registers 2

    .line 35
    invoke-direct {p0}, Landroidx/fragment/app/o;-><init>()V

    .line 39
    const-string v0, ""

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 40
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 41
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    return-void
.end method

.method public static applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 533
    if-eqz p0, :cond_b6

    if-nez p1, :cond_6

    goto/16 :goto_b6

    .line 535
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

    .line 536
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "UI/DataDirectory"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_2f
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_2f} :catch_30

    .line 539
    goto :goto_34

    .line 537
    :catch_30
    move-exception v0

    .line 538
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 542
    :goto_34
    const-string v0, "internal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_44

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_43

    goto :goto_44

    .line 547
    :cond_43
    goto :goto_5a

    .line 543
    :cond_44
    :goto_44
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 544
    if-nez p1, :cond_4f

    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object p1

    .line 545
    :cond_4f
    if-eqz p1, :cond_56

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_58

    :cond_56
    const-string p0, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_58
    move-object p1, p0

    .line 546
    nop

    .line 551
    :goto_5a
    :try_start_5a
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 552
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 553
    new-instance v0, Ljava/io/File;

    const-string v1, "memcards"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 554
    new-instance v0, Ljava/io/File;

    const-string v1, "bios"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 555
    new-instance v0, Ljava/io/File;

    const-string v1, "cheats"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 556
    new-instance v0, Ljava/io/File;

    const-string v1, "covers"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 557
    new-instance v0, Ljava/io/File;

    const-string v1, "sstates"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 558
    new-instance v0, Ljava/io/File;

    const-string v1, "gamesettings"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 559
    new-instance v0, Ljava/io/File;

    const-string v1, "inputprofiles"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_a8
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_a8} :catch_a9

    .line 562
    goto :goto_ad

    .line 560
    :catch_a9
    move-exception p0

    .line 561
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 565
    :goto_ad
    :try_start_ad
    invoke-static {p1}, Lxyz/aethersx2/android/NativeLibrary;->setDataDirectory(Ljava/lang/String;)V
    :try_end_b0
    .catchall {:try_start_ad .. :try_end_b0} :catchall_b1

    .line 568
    goto :goto_b5

    .line 566
    :catchall_b1
    move-exception p0

    .line 567
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 569
    :goto_b5
    return-void

    .line 533
    :cond_b6
    :goto_b6
    return-void
.end method

.method private createDivider(Landroid/content/Context;)Landroid/view/View;
    .registers 7

    .line 411
    new-instance v0, Landroid/view/View;

    invoke-direct {v0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 412
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    .line 414
    const/4 v2, 0x1

    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v2

    const/4 v3, -0x1

    invoke-direct {v1, v3, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 416
    const/16 v2, 0x14

    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    const/4 v4, 0x0

    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p1

    invoke-virtual {v1, v3, v4, p1, v4}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 417
    invoke-virtual {v0, v1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 418
    const-string p1, "#20FFFFFF"

    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 419
    return-object v0
.end method

.method private createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;
    .registers 7

    .line 370
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 371
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 375
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 376
    const/16 v1, 0x14

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v2

    const/16 v3, 0xe

    invoke-direct {p0, p1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v4

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {p0, p1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-virtual {v0, v2, v4, v1, v3}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 377
    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 378
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 379
    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setFocusable(Z)V

    .line 380
    return-object v0
.end method

.method private createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .registers 7

    .line 384
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 385
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 387
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 388
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 389
    const/high16 p2, 0x41900000    # 18.0f

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 390
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 391
    const/4 p2, -0x1

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 392
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 394
    new-instance p2, Landroid/widget/TextView;

    invoke-direct {p2, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 395
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 396
    const/high16 p3, 0x41500000    # 13.0f

    invoke-virtual {p2, v2, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 397
    const-string p3, "#9E9E9E"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setTextColor(I)V

    .line 398
    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p3

    int-to-float p3, p3

    const/high16 v1, 0x3f800000    # 1.0f

    invoke-virtual {p2, p3, v1}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 399
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v1, -0x2

    invoke-direct {p3, v1, v1}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 403
    const/4 v1, 0x4

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 404
    invoke-virtual {p2, p3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 405
    invoke-virtual {v0, p2}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 407
    return-object v0
.end method

.method private dp(Landroid/content/Context;I)I
    .registers 4

    .line 600
    if-nez p1, :cond_5

    mul-int/lit8 p2, p2, 0x2

    return p2

    .line 601
    :cond_5
    int-to-float p2, p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    invoke-static {v0, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method private getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 572
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    .line 573
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 574
    if-eqz p2, :cond_1a

    .line 576
    :try_start_14
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_18} :catch_19

    return-object p1

    .line 577
    :catch_19
    move-exception p1

    .line 579
    :cond_1a
    return-object v0
.end method

.method private getAppMipmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 583
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    .line 584
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "mipmap"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    .line 585
    if-eqz p2, :cond_1a

    .line 587
    :try_start_14
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_18} :catch_19

    return-object p1

    .line 588
    :catch_19
    move-exception p1

    .line 590
    :cond_1a
    return-object v0
.end method

.method private getSelectableItemBackground(Landroid/content/Context;)I
    .registers 5

    .line 594
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 595
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const v1, 0x101030e

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 596
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    return p1
.end method

.method private openFolderPicker()V
    .registers 4

    .line 466
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 467
    const-string v1, "android.intent.extra.LOCAL_ONLY"

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 468
    const/16 v1, 0x43

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 470
    const/16 v1, 0x3e9

    :try_start_14
    invoke-virtual {p0, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_17
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_17} :catch_18

    .line 476
    goto :goto_29

    .line 471
    :catch_18
    move-exception v0

    .line 472
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 473
    if-eqz v0, :cond_29

    .line 474
    const-string v1, "Failed to launch folder picker"

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/widget/Toast;->makeText(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;

    move-result-object v0

    invoke-virtual {v0}, Landroid/widget/Toast;->show()V

    .line 477
    :cond_29
    :goto_29
    return-void
.end method

.method private requestAllFilesPermission(Landroid/content/Context;)V
    .registers 5

    .line 480
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_42

    .line 482
    :try_start_6
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 483
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

    .line 484
    invoke-virtual {p0, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_33
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_33} :catch_34

    .line 490
    goto :goto_42

    .line 485
    :catch_34
    move-exception p1

    .line 487
    :try_start_35
    new-instance p1, Landroid/content/Intent;

    const-string v0, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p1, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 488
    invoke-virtual {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivity(Landroid/content/Intent;)V
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_3f} :catch_40

    goto :goto_41

    .line 489
    :catch_40
    move-exception p1

    :goto_41
    nop

    .line 492
    :cond_42
    :goto_42
    return-void
.end method

.method private selectCustom(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 429
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 430
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 431
    invoke-static {p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 432
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 433
    return-void
.end method

.method private selectDefault(Landroid/content/Context;)V
    .registers 3

    .line 423
    const-string v0, "internal"

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 424
    invoke-static {p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 425
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 426
    return-void
.end method

.method private updateUiState()V
    .registers 7

    .line 436
    const-string v0, "internal"

    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_16

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_14

    goto :goto_16

    :cond_14
    move v0, v1

    goto :goto_17

    :cond_16
    :goto_16
    const/4 v0, 0x1

    .line 437
    :goto_17
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    const/16 v3, 0x8

    if-eqz v2, :cond_25

    .line 438
    if-eqz v0, :cond_21

    move v4, v1

    goto :goto_22

    :cond_21
    move v4, v3

    :goto_22
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 440
    :cond_25
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    if-eqz v2, :cond_31

    .line 441
    if-nez v0, :cond_2d

    move v4, v1

    goto :goto_2e

    :cond_2d
    move v4, v3

    :goto_2e
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 443
    :cond_31
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    if-eqz v2, :cond_43

    .line 444
    iget-object v4, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_3f

    move v4, v1

    goto :goto_40

    :cond_3f
    move v4, v3

    :goto_40
    invoke-virtual {v2, v4}, Landroid/widget/ImageButton;->setVisibility(I)V

    .line 446
    :cond_43
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    if-eqz v2, :cond_77

    .line 447
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    const-string v4, "#9E9E9E"

    if-eqz v2, :cond_62

    .line 448
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    const-string v5, "Tap to choose a custom data directory..."

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 449
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_77

    .line 451
    :cond_62
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    iget-object v5, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v2, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 452
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    if-eqz v0, :cond_6e

    goto :goto_70

    :cond_6e
    const-string v4, "#64B5F6"

    :goto_70
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v4

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setTextColor(I)V

    .line 455
    :cond_77
    :goto_77
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    if-eqz v2, :cond_95

    .line 456
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x1e

    if-lt v2, v4, :cond_90

    if-nez v0, :cond_90

    .line 457
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    .line 458
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    if-eqz v0, :cond_8c

    move v1, v3

    :cond_8c
    invoke-virtual {v2, v1}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 459
    goto :goto_95

    .line 460
    :cond_90
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v0, v3}, Landroid/widget/LinearLayout;->setVisibility(I)V

    .line 463
    :cond_95
    :goto_95
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 496
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/o;->onActivityResult(IILandroid/content/Intent;)V

    .line 497
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_a1

    const/4 p1, -0x1

    if-ne p2, p1, :cond_a1

    if-eqz p3, :cond_a1

    .line 498
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 499
    if-eqz p1, :cond_a1

    .line 500
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 501
    if-eqz p2, :cond_23

    .line 503
    :try_start_18
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    const/4 v0, 0x3

    invoke-virtual {p3, p1, v0}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_20
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_20} :catch_21

    goto :goto_22

    .line 507
    :catch_21
    move-exception p3

    :goto_22
    nop

    .line 510
    :cond_23
    nop

    .line 512
    :try_start_24
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p1
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_28} :catch_29

    .line 513
    goto :goto_2b

    :catch_29
    move-exception p1

    const/4 p1, 0x0

    .line 516
    :goto_2b
    const-string p3, "/storage/emulated/0/"

    if-eqz p1, :cond_4f

    const-string v0, "primary:"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4f

    .line 517
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

    .line 518
    :cond_4f
    if-eqz p1, :cond_88

    const-string v0, ":"

    invoke-virtual {p1, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_88

    .line 519
    const/16 p3, 0x3a

    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(I)I

    move-result p3

    .line 520
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

    .line 521
    goto :goto_9e

    :cond_88
    if-eqz p1, :cond_9c

    .line 522
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    goto :goto_9e

    .line 524
    :cond_9c
    const-string p1, "/storage/emulated/0/Download/ps2"

    .line 527
    :goto_9e
    invoke-direct {p0, p2, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustom(Landroid/content/Context;Ljava/lang/String;)V

    .line 530
    :cond_a1
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 21

    .line 51
    move-object/from16 v1, p0

    invoke-virtual/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 52
    const/4 v2, 0x0

    if-nez v0, :cond_15

    new-instance v0, Landroid/view/View;

    if-eqz p2, :cond_11

    invoke-virtual/range {p2 .. p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v2

    :cond_11
    invoke-direct {v0, v2}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    return-object v0

    .line 55
    :cond_15
    invoke-virtual {v0, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 56
    if-nez v2, :cond_1f

    invoke-virtual {v0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object v2

    .line 57
    :cond_1f
    if-eqz v2, :cond_26

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_28

    :cond_26
    const-string v2, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_28
    iput-object v2, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    .line 60
    invoke-virtual {v0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, "_preferences"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v0, v2, v3}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 61
    const-string v4, "UI/DataDirectory"

    const-string v5, "internal"

    invoke-interface {v2, v4, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 62
    if-eqz v2, :cond_6a

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_6a

    invoke-virtual {v5, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_6a

    iget-object v4, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_65

    goto :goto_6a

    .line 66
    :cond_65
    iput-object v2, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 67
    iput-object v2, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    goto :goto_70

    .line 63
    :cond_6a
    :goto_6a
    iput-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 64
    const-string v2, ""

    iput-object v2, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 71
    :goto_70
    new-instance v2, Landroid/widget/FrameLayout;

    invoke-direct {v2, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 72
    new-instance v4, Landroid/view/ViewGroup$LayoutParams;

    const/4 v5, -0x1

    invoke-direct {v4, v5, v5}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 78
    new-instance v4, Landroid/widget/ScrollView;

    invoke-direct {v4, v0}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 79
    new-instance v6, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v6, v5, v5}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 83
    invoke-virtual {v4, v6}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 84
    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 86
    new-instance v7, Landroid/widget/LinearLayout;

    invoke-direct {v7, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 87
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 88
    new-instance v8, Landroid/view/ViewGroup$LayoutParams;

    const/4 v9, -0x2

    invoke-direct {v8, v5, v9}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    new-instance v8, Landroid/widget/RelativeLayout;

    invoke-direct {v8, v0}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 95
    new-instance v10, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v10, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 99
    const/16 v11, 0x14

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    const/16 v13, 0xa

    invoke-direct {v1, v0, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v1, v0, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v10, v12, v14, v15, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 100
    invoke-virtual {v8, v10}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 103
    new-instance v6, Landroid/widget/ImageView;

    invoke-direct {v6, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 104
    invoke-static {}, Landroid/view/View;->generateViewId()I

    move-result v10

    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setId(I)V

    .line 105
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v12, 0x2d

    invoke-direct {v1, v0, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v1, v0, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v10, v14, v12}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 106
    const/16 v12, 0x15

    invoke-virtual {v10, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 107
    invoke-virtual {v10, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 108
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 109
    const-string v10, "logo"

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppMipmap(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    .line 110
    if-eqz v10, :cond_f5

    .line 111
    invoke-virtual {v6, v10}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 113
    :cond_f5
    invoke-virtual {v8, v6}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 116
    new-instance v10, Landroid/widget/TextView;

    invoke-direct {v10, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 117
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v14, v5, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 121
    invoke-virtual {v14, v11}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 122
    invoke-virtual {v14, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 123
    invoke-virtual {v6}, Landroid/widget/ImageView;->getId()I

    move-result v6

    const/16 v15, 0x10

    invoke-virtual {v14, v15, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 124
    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v14, v6}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 125
    invoke-virtual {v10, v14}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 126
    const-string v6, "Data\nDirectory"

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 127
    const/high16 v6, 0x41f00000    # 30.0f

    const/4 v14, 0x2

    invoke-virtual {v10, v14, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 128
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v10, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 129
    invoke-virtual {v10, v5}, Landroid/widget/TextView;->setTextColor(I)V

    .line 130
    invoke-direct {v1, v0, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    int-to-float v6, v6

    const/high16 v13, 0x3f800000    # 1.0f

    invoke-virtual {v10, v6, v13}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 131
    invoke-virtual {v8, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 133
    invoke-virtual {v7, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 136
    new-instance v6, Landroid/widget/TextView;

    invoke-direct {v6, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 137
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v5, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 141
    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    const/16 v12, 0xe

    invoke-direct {v1, v0, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    invoke-virtual {v8, v10, v3, v15, v11}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 142
    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 143
    const-string v8, "NetherSX2 stores core data (BIOS, memory cards, savestates, cheats, covers, game settings) in this directory. Choose Default for internal storage or Custom to use your own folder."

    invoke-virtual {v6, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 144
    const/high16 v8, 0x41600000    # 14.0f

    invoke-virtual {v6, v14, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 145
    const-string v10, "#CCCCCC"

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v6, v10}, Landroid/widget/TextView;->setTextColor(I)V

    .line 146
    const/4 v10, 0x3

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    int-to-float v10, v10

    invoke-virtual {v6, v10, v13}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 147
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 150
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v6

    .line 151
    iget-object v10, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "Internal app storage ("

    invoke-virtual {v11, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    const-string v11, ")"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v10

    const-string v11, "Default"

    invoke-direct {v1, v0, v11, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v10

    .line 152
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v11, v5, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 156
    const/16 v13, 0x14

    invoke-virtual {v11, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 157
    const/16 v13, 0xf

    invoke-virtual {v11, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 158
    const/16 v15, 0x32

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v11, v15}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 159
    invoke-virtual {v10, v11}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 160
    invoke-virtual {v6, v10}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 162
    new-instance v10, Landroid/widget/ImageView;

    invoke-direct {v10, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v10, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    .line 163
    new-instance v10, Landroid/widget/RelativeLayout$LayoutParams;

    const/16 v11, 0x1c

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v10, v15, v8}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 164
    const/16 v8, 0x15

    invoke-virtual {v10, v8}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 165
    invoke-virtual {v10, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 166
    invoke-direct {v1, v0, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-virtual {v10, v8}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 167
    iget-object v8, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v8, v10}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 168
    const-string v8, "ic_baseline_check_green_24"

    invoke-direct {v1, v0, v8}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v8

    .line 169
    const-string v10, "#4CAF50"

    if-eqz v8, :cond_1f8

    .line 170
    iget-object v15, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v15, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_201

    .line 172
    :cond_1f8
    iget-object v15, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v14

    invoke-virtual {v15, v14}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 174
    :goto_201
    iget-object v14, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v6, v14}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 176
    new-instance v14, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;

    invoke-direct {v14, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    invoke-virtual {v6, v14}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 182
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 185
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createDivider(Landroid/content/Context;)Landroid/view/View;

    move-result-object v6

    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 188
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v6

    .line 189
    iget-object v14, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v14}, Ljava/lang/String;->isEmpty()Z

    move-result v14

    if-eqz v14, :cond_227

    const-string v14, "Tap to choose a custom data directory..."

    goto :goto_229

    :cond_227
    iget-object v14, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 190
    :goto_229
    const-string v15, "Custom Folder"

    invoke-direct {v1, v0, v15, v14}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v14

    .line 191
    const/4 v15, 0x1

    invoke-virtual {v14, v15}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v16

    move-object/from16 v15, v16

    check-cast v15, Landroid/widget/TextView;

    iput-object v15, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    .line 192
    iget-object v15, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v15

    if-nez v15, :cond_24d

    .line 193
    iget-object v15, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    const-string v16, "#64B5F6"

    invoke-static/range {v16 .. v16}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v15, v12}, Landroid/widget/TextView;->setTextColor(I)V

    .line 196
    :cond_24d
    new-instance v12, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v12, v5, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 200
    const/16 v15, 0x14

    invoke-virtual {v12, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 201
    invoke-virtual {v12, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 202
    const/16 v15, 0x6e

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v12, v15}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 203
    invoke-virtual {v14, v12}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 204
    invoke-virtual {v6, v14}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 207
    new-instance v12, Landroid/widget/LinearLayout;

    invoke-direct {v12, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 208
    invoke-virtual {v12, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 209
    const/16 v14, 0x10

    invoke-virtual {v12, v14}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 210
    new-instance v14, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v14, v9, v9}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 214
    const/16 v15, 0x15

    invoke-virtual {v14, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 215
    invoke-virtual {v14, v13}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 216
    const/16 v13, 0xa

    invoke-direct {v1, v0, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-virtual {v14, v15}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 217
    invoke-virtual {v12, v14}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 220
    new-instance v13, Landroid/widget/ImageButton;

    invoke-direct {v13, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    .line 221
    new-instance v14, Landroid/widget/LinearLayout$LayoutParams;

    const/16 v15, 0x22

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-direct {v14, v3, v5}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 222
    const/4 v3, 0x6

    invoke-direct {v1, v0, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v5

    invoke-virtual {v14, v5}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 223
    invoke-virtual {v13, v14}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 224
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v13, v5}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 225
    const-string v5, "ic_baseline_folder_24"

    invoke-direct {v1, v0, v5}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 226
    if-eqz v5, :cond_2c0

    .line 227
    invoke-virtual {v13, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 229
    :cond_2c0
    new-instance v5, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;

    invoke-direct {v5, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v13, v5}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 235
    invoke-virtual {v12, v13}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 238
    new-instance v5, Landroid/widget/ImageButton;

    invoke-direct {v5, v0}, Landroid/widget/ImageButton;-><init>(Landroid/content/Context;)V

    iput-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    .line 239
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v1, v0, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v5, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 240
    invoke-direct {v1, v0, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v5, v13}, Landroid/widget/LinearLayout$LayoutParams;->setMarginEnd(I)V

    .line 241
    iget-object v13, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    invoke-virtual {v13, v5}, Landroid/widget/ImageButton;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 242
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result v13

    invoke-virtual {v5, v13}, Landroid/widget/ImageButton;->setBackgroundResource(I)V

    .line 243
    const-string v5, "ic_baseline_delete_24"

    invoke-direct {v1, v0, v5}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v5

    .line 244
    if-eqz v5, :cond_301

    .line 245
    iget-object v13, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    invoke-virtual {v13, v5}, Landroid/widget/ImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 247
    :cond_301
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    new-instance v13, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;

    invoke-direct {v13, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$3;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    invoke-virtual {v5, v13}, Landroid/widget/ImageButton;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 255
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->btnClearCustom:Landroid/widget/ImageButton;

    invoke-virtual {v12, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 258
    new-instance v5, Landroid/widget/ImageView;

    invoke-direct {v5, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    .line 259
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v5, v13, v14}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 260
    iget-object v13, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v13, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 261
    if-eqz v8, :cond_331

    .line 262
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    goto :goto_33a

    .line 264
    :cond_331
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-static {v10}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 266
    :goto_33a
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v12, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 268
    invoke-virtual {v6, v12}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 270
    new-instance v5, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;

    invoke-direct {v5, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    invoke-virtual {v6, v5}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 280
    invoke-virtual {v7, v6}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 283
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createDivider(Landroid/content/Context;)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 286
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v0}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    iput-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    .line 287
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 288
    new-instance v5, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v6, -0x1

    invoke-direct {v5, v6, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 292
    const/16 v6, 0x14

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    const/16 v10, 0x10

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    const/16 v6, 0xa

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-virtual {v5, v8, v12, v10, v6}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 293
    iget-object v6, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 294
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    const/16 v6, 0xe

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    const/16 v10, 0xc

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v13

    invoke-virtual {v5, v8, v12, v6, v13}, Landroid/widget/LinearLayout;->setPadding(IIII)V

    .line 296
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 297
    const-string v6, "#1E2A38"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 298
    const/16 v6, 0x8

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v5, v8}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    .line 299
    const/4 v8, 0x1

    invoke-direct {v1, v0, v8}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v12

    const-string v8, "#375A7F"

    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v12, v8}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V

    .line 300
    iget-object v8, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v5}, Landroid/widget/LinearLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 302
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 303
    const-string v8, "Notice: Custom directories outside app storage require All Files Access on Android 11+."

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 304
    const/high16 v8, 0x41500000    # 13.0f

    const/4 v12, 0x2

    invoke-virtual {v5, v12, v8}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 305
    const-string v8, "#90CAF9"

    invoke-static {v8}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v8

    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setTextColor(I)V

    .line 306
    iget-object v8, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v8, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 308
    new-instance v5, Landroid/widget/TextView;

    invoke-direct {v5, v0}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 309
    new-instance v8, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v8, v9, v9}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 313
    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    iput v6, v8, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 314
    invoke-virtual {v5, v8}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 315
    const-string v6, "Grant Permission"

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 316
    const/high16 v6, 0x41600000    # 14.0f

    const/4 v8, 0x2

    invoke-virtual {v5, v8, v6}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 317
    sget-object v6, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 318
    const-string v6, "#448AFF"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setTextColor(I)V

    .line 319
    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v1, v0, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v8

    invoke-direct {v1, v0, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    invoke-direct {v1, v0, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    invoke-virtual {v5, v6, v8, v9, v10}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 320
    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setBackgroundResource(I)V

    .line 321
    new-instance v6, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;

    invoke-direct {v6, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    invoke-virtual {v5, v6}, Landroid/widget/TextView;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 327
    iget-object v6, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v6, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 328
    iget-object v5, v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->permissionBanner:Landroid/widget/LinearLayout;

    invoke-virtual {v7, v5}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 330
    invoke-virtual {v4, v7}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 331
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 334
    new-instance v4, Landroid/widget/FrameLayout;

    invoke-direct {v4, v0}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 335
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    const/16 v6, 0x38

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x38

    invoke-direct {v1, v0, v7}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 336
    const v6, 0x800055

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 337
    const/16 v6, 0x14

    invoke-direct {v1, v0, v6}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    const/16 v7, 0x10

    invoke-direct {v1, v0, v7}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    const/4 v8, 0x0

    invoke-virtual {v5, v8, v8, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;->setMargins(IIII)V

    .line 338
    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 340
    new-instance v5, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v5}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 341
    const/4 v6, 0x1

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setShape(I)V

    .line 342
    const-string v6, "#303030"

    invoke-static {v6}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v6

    invoke-virtual {v5, v6}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 343
    invoke-virtual {v4, v5}, Landroid/widget/FrameLayout;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 344
    invoke-direct {v1, v0, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v4, v3}, Landroid/widget/FrameLayout;->setElevation(F)V

    .line 346
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v0}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    .line 347
    new-instance v5, Landroid/widget/FrameLayout$LayoutParams;

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v1, v0, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-direct {v5, v6, v7}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    .line 348
    const/16 v6, 0x11

    iput v6, v5, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 349
    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 351
    const v5, 0x108002b

    :try_start_4aa
    invoke-virtual {v0, v5}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    :try_end_4b1
    .catch Ljava/lang/Exception; {:try_start_4aa .. :try_end_4b1} :catch_4b2

    goto :goto_4b3

    .line 352
    :catch_4b2
    move-exception v0

    :goto_4b3
    nop

    .line 353
    const/4 v5, -0x1

    invoke-virtual {v3, v5}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 354
    invoke-virtual {v4, v3}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 356
    new-instance v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;

    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v4, v0}, Landroid/widget/FrameLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 362
    invoke-virtual {v2, v4}, Landroid/widget/FrameLayout;->addView(Landroid/view/View;)V

    .line 365
    invoke-direct/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 366
    return-object v2
.end method
