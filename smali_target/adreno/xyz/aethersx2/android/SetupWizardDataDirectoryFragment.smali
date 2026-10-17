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

    .line 27
    invoke-direct {p0}, Landroidx/fragment/app/o;-><init>()V

    .line 31
    const-string v0, ""

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 32
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 33
    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    return-void
.end method

.method public static applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V
    .registers 4

    .line 300
    if-eqz p0, :cond_9b

    if-nez p1, :cond_6

    goto/16 :goto_9b

    .line 302
    :cond_6
    :try_start_6
    invoke-static {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v0

    .line 303
    if-eqz v0, :cond_19

    .line 304
    invoke-interface {v0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    const-string v1, "UI/DataDirectory"

    invoke-interface {v0, v1, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v0

    invoke-interface {v0}, Landroid/content/SharedPreferences$Editor;->commit()Z
    :try_end_19
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_19} :catch_1a

    .line 308
    :cond_19
    goto :goto_1e

    .line 306
    :catch_1a
    move-exception v0

    .line 307
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 310
    :goto_1e
    nop

    .line 311
    const-string v0, "internal"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_42

    .line 312
    :cond_2d
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object p1

    .line 313
    if-nez p1, :cond_38

    invoke-virtual {p0}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object p1

    .line 314
    :cond_38
    if-eqz p1, :cond_3f

    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    goto :goto_41

    :cond_3f
    const-string p0, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_41
    move-object p1, p0

    .line 318
    :cond_42
    :try_start_42
    new-instance p0, Ljava/io/File;

    invoke-direct {p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 319
    invoke-virtual {p0}, Ljava/io/File;->mkdirs()Z

    .line 320
    new-instance v0, Ljava/io/File;

    const-string v1, "memcards"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 321
    new-instance v0, Ljava/io/File;

    const-string v1, "bios"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 322
    new-instance v0, Ljava/io/File;

    const-string v1, "cheats"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 323
    new-instance v0, Ljava/io/File;

    const-string v1, "covers"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 324
    new-instance v0, Ljava/io/File;

    const-string v1, "sstates"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 325
    new-instance v0, Ljava/io/File;

    const-string v1, "gamesettings"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    .line 326
    new-instance v0, Ljava/io/File;

    const-string v1, "inputprofiles"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z
    :try_end_90
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_90} :catch_91

    .line 329
    goto :goto_95

    .line 327
    :catch_91
    move-exception p0

    .line 328
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 332
    :goto_95
    :try_start_95
    invoke-static {p1}, Lxyz/aethersx2/android/NativeLibrary;->setDataDirectory(Ljava/lang/String;)V
    :try_end_98
    .catchall {:try_start_95 .. :try_end_98} :catchall_99

    .line 335
    goto :goto_9a

    .line 333
    :catchall_99
    move-exception p0

    .line 336
    :goto_9a
    return-void

    .line 300
    :cond_9b
    :goto_9b
    return-void
.end method

.method private createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;
    .registers 6

    .line 348
    new-instance v0, Landroid/widget/RelativeLayout;

    invoke-direct {v0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    .line 349
    new-instance v1, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x1

    const/4 v3, -0x2

    invoke-direct {v1, v2, v3}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 351
    invoke-virtual {v0, v1}, Landroid/widget/RelativeLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 352
    const/16 v1, 0x10

    invoke-direct {p0, p1, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v1

    .line 353
    const/16 v2, 0xe

    invoke-direct {p0, p1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v2

    .line 354
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/RelativeLayout;->setPadding(IIII)V

    .line 355
    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSelectableItemBackground(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setBackgroundResource(I)V

    .line 356
    const/4 p1, 0x1

    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setClickable(Z)V

    .line 357
    invoke-virtual {v0, p1}, Landroid/widget/RelativeLayout;->setFocusable(Z)V

    .line 358
    return-object v0
.end method

.method private createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;
    .registers 7

    .line 362
    new-instance v0, Landroid/widget/LinearLayout;

    invoke-direct {v0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 363
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 365
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 366
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 367
    const/high16 p2, 0x41880000    # 17.0f

    const/4 v2, 0x2

    invoke-virtual {v1, v2, p2}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 368
    sget-object p2, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 369
    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrimaryTextColor(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 370
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 372
    new-instance v1, Landroid/widget/TextView;

    invoke-direct {v1, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 373
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 374
    const/high16 p3, 0x41500000    # 13.0f

    invoke-virtual {v1, v2, p3}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 375
    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSecondaryTextColor(Landroid/content/Context;)I

    move-result p2

    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setTextColor(I)V

    .line 376
    new-instance p3, Landroid/widget/LinearLayout$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {p3, p2, v2}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 378
    const/4 p2, 0x4

    invoke-direct {p0, p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result p1

    iput p1, p3, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 379
    invoke-virtual {v1, p3}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 380
    invoke-virtual {v0, v1}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 382
    return-object v0
.end method

.method private dp(Landroid/content/Context;I)I
    .registers 4

    .line 402
    if-nez p1, :cond_3

    return p2

    .line 403
    :cond_3
    int-to-float p2, p2

    .line 404
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    .line 403
    const/4 v0, 0x1

    invoke-static {v0, p2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method private getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;
    .registers 7

    .line 393
    const/4 v0, 0x0

    if-nez p1, :cond_4

    return-object v0

    .line 394
    :cond_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const-string v2, "drawable"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    if-nez p2, :cond_id_found

    const-string p2, "ic_baseline_check_green_24"

    invoke-virtual {v1, p2, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p2

    :cond_id_found
    .line 395
    if-eqz p2, :cond_19

    .line 396
    invoke-virtual {p1, p2}, Landroid/content/Context;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1

    .line 398
    :cond_19
    return-object v0
.end method

.method private getThemeColor(Landroid/content/Context;II)I
    .registers 7

    if-nez p1, :cond_3

    return p3

    :cond_3
    :try_start_3
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const/4 v2, 0x1

    invoke-virtual {v1, p2, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    move-result p2

    if-eqz p2, :cond_2b

    iget p2, v0, Landroid/util/TypedValue;->type:I

    const/16 v1, 0x1c

    if-lt p2, v1, :cond_20

    const/16 v1, 0x1f

    if-gt p2, v1, :cond_20

    iget p1, v0, Landroid/util/TypedValue;->data:I

    return p1

    :cond_20
    iget p2, v0, Landroid/util/TypedValue;->resourceId:I

    if-eqz p2, :cond_2b

    invoke-virtual {p1, p2}, Landroid/content/Context;->getColor(I)I

    move-result p1
    :try_end_28
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_28} :catch_29

    return p1

    :catch_29
    move-exception p1

    :cond_2b
    return p3
.end method

.method private isNightMode(Landroid/content/Context;)Z
    .registers 4

    if-nez p1, :cond_4

    const/4 p1, 0x1

    return p1

    :cond_4
    :try_start_4
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p1

    iget p1, p1, Landroid/content/res/Configuration;->uiMode:I

    and-int/lit8 p1, p1, 0x30

    const/16 v0, 0x20

    if-ne p1, v0, :cond_16

    const/4 p1, 0x1

    return p1

    :cond_16
    const/4 p1, 0x0

    return p1
    :try_end_18
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_18} :catch_19

    :catch_19
    move-exception p1

    const/4 p1, 0x1

    return p1
.end method

.method private getPrimaryTextColor(Landroid/content/Context;)I
    .registers 5

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_9

    const/4 v0, -0x1

    goto :goto_c

    :cond_9
    const v0, -0xdededf

    :goto_c
    const v1, 0x1010036

    invoke-direct {p0, p1, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getThemeColor(Landroid/content/Context;II)I

    move-result p1

    return p1
.end method

.method private getSecondaryTextColor(Landroid/content/Context;)I
    .registers 5

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->isNightMode(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    const v0, -0x4f413b

    goto :goto_d

    :cond_a
    const v0, -0x8a8a8b

    :goto_d
    const v1, 0x1010038

    invoke-direct {p0, p1, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getThemeColor(Landroid/content/Context;II)I

    move-result p1

    return p1
.end method

.method private getDividerColor(Landroid/content/Context;)I
    .registers 3

    invoke-direct {p0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->isNightMode(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_9

    const p1, 0x1fffffff

    return p1

    :cond_9
    const p1, 0x1f000000

    return p1
.end method

.method private getAccentColor(Landroid/content/Context;)I
    .registers 5

    const v0, 0x101042b

    const v1, -0x16e19d

    invoke-direct {p0, p1, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getThemeColor(Landroid/content/Context;II)I

    move-result p1

    return p1
.end method

.method private static getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;
    .registers 3

    .line 339
    if-nez p0, :cond_4

    const/4 p0, 0x0

    return-object p0

    .line 341
    :cond_4
    :try_start_4
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0
    :try_end_8
    .catchall {:try_start_4 .. :try_end_8} :catchall_9

    return-object p0

    .line 342
    :catchall_9
    move-exception v0

    .line 343
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
    .registers 5

    .line 386
    if-nez p1, :cond_4

    const/4 p1, 0x0

    return p1

    .line 387
    :cond_4
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 388
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const v1, 0x101030e

    const/4 v2, 0x1

    invoke-virtual {p1, v1, v0, v2}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 389
    iget p1, v0, Landroid/util/TypedValue;->resourceId:I

    return p1
.end method

.method private openFolderPicker()V
    .registers 3

    .line 225
    :try_start_0
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.intent.action.OPEN_DOCUMENT_TREE"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 226
    const/16 v1, 0xc3

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 230
    const/16 v1, 0x3e9

    invoke-virtual {p0, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    .line 233
    goto :goto_16

    .line 231
    :catch_12
    move-exception v0

    .line 232
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    .line 234
    :goto_16
    return-void
.end method

.method private requestAllFilesPermission(Landroid/content/Context;)V
    .registers 5

    .line 206
    if-nez p1, :cond_3

    return-void

    .line 207
    :cond_3
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_3e

    .line 209
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

    .line 210
    new-instance v1, Landroid/content/Intent;

    const-string v2, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v1, v2, p1}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    .line 211
    invoke-virtual {p0, v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_30
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_30} :catch_31

    .line 219
    goto :goto_3e

    .line 212
    :catch_31
    move-exception p1

    .line 214
    :try_start_32
    new-instance p1, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {p1, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 215
    invoke-virtual {p0, p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->startActivityForResult(Landroid/content/Intent;I)V
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_3c} :catch_3d

    .line 218
    goto :goto_3e

    .line 216
    :catch_3d
    move-exception p1

    .line 221
    :cond_3e
    :goto_3e
    return-void
.end method

.method private selectCustom(Landroid/content/Context;Ljava/lang/String;)V
    .registers 3

    .line 287
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 288
    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 289
    invoke-static {p1, p2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 290
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 291
    return-void
.end method

.method private selectDefault(Landroid/content/Context;)V
    .registers 3

    .line 294
    const-string v0, "internal"

    iput-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 295
    invoke-static {p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 296
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 297
    return-void
.end method

.method private updateUiState()V
    .registers 6

    .line 187
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
    const/4 v0, 0x0

    goto :goto_17

    :cond_16
    :goto_16
    const/4 v0, 0x1

    .line 188
    :goto_17
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    const/16 v3, 0x8

    if-eqz v2, :cond_26

    .line 189
    if-eqz v0, :cond_21

    const/4 v4, 0x0

    goto :goto_23

    :cond_21
    const/16 v4, 0x8

    :goto_23
    invoke-virtual {v2, v4}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 191
    :cond_26
    iget-object v2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    if-eqz v2, :cond_32

    .line 192
    if-nez v0, :cond_2d

    goto :goto_2f

    :cond_2d
    const/16 v1, 0x8

    :goto_2f
    invoke-virtual {v2, v1}, Landroid/widget/ImageView;->setVisibility(I)V

    .line 194
    :cond_32
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    if-eqz v1, :cond_66

    .line 195
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {p0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSecondaryTextColor(Landroid/content/Context;)I

    move-result v2

    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_52

    .line 196
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    const-string v1, "Tap to select custom data directory"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 197
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setTextColor(I)V

    goto :goto_66

    .line 199
    :cond_52
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    iget-object v4, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 200
    iget-object v3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    if-eqz v0, :cond_60

    move v0, v2

    goto :goto_64

    :cond_60
    invoke-direct {p0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrimaryTextColor(Landroid/content/Context;)I

    move-result v0

    :goto_64
    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setTextColor(I)V

    .line 203
    :cond_66
    :goto_66
    return-void
.end method


# virtual methods
.method public onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    .line 238
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/o;->onActivityResult(IILandroid/content/Intent;)V

    .line 239
    const/16 v0, 0x3ea

    if-ne p1, v0, :cond_1a

    .line 240
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 241
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x1e

    if-lt p1, p2, :cond_19

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result p1

    if-eqz p1, :cond_19

    .line 242
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->openFolderPicker()V

    .line 244
    :cond_19
    return-void

    .line 246
    :cond_1a
    const/16 v0, 0x3e9

    if-ne p1, v0, :cond_b8

    const/4 p1, -0x1

    if-ne p2, p1, :cond_b8

    if-eqz p3, :cond_b8

    .line 247
    invoke-virtual {p3}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object p1

    .line 248
    if-eqz p1, :cond_b8

    .line 249
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object p2

    .line 250
    if-eqz p2, :cond_39

    .line 252
    :try_start_2f
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p3

    const/4 v0, 0x3

    invoke-virtual {p3, p1, v0}, Landroid/content/ContentResolver;->takePersistableUriPermission(Landroid/net/Uri;I)V
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_37} :catch_38

    .line 256
    goto :goto_39

    .line 254
    :catch_38
    move-exception p3

    .line 258
    :cond_39
    :goto_39
    nop

    .line 260
    :try_start_3a
    invoke-static {p1}, Landroid/provider/DocumentsContract;->getTreeDocumentId(Landroid/net/Uri;)Ljava/lang/String;

    move-result-object p3
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3e} :catch_3f

    .line 263
    goto :goto_41

    .line 261
    :catch_3f
    move-exception p3

    const/4 p3, 0x0

    .line 264
    :goto_41
    nop

    .line 265
    if-eqz p3, :cond_68

    const-string v0, "primary:"

    invoke-virtual {p3, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_68

    .line 266
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

    .line 267
    :cond_68
    if-eqz p3, :cond_a1

    const-string v0, ":"

    invoke-virtual {p3, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_a1

    .line 268
    const/4 p1, 0x2

    invoke-virtual {p3, v0, p1}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object p1

    .line 269
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

    .line 270
    goto :goto_a5

    .line 271
    :cond_a1
    invoke-virtual {p1}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 274
    :goto_a5
    if-eqz p1, :cond_b8

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p3

    if-nez p3, :cond_b8

    .line 276
    :try_start_ad
    const-string p3, "UTF-8"

    invoke-static {p1, p3}, Ljava/net/URLDecoder;->decode(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1
    :try_end_b3
    .catch Ljava/lang/Exception; {:try_start_ad .. :try_end_b3} :catch_b4

    .line 279
    goto :goto_b5

    .line 277
    :catch_b4
    move-exception p3

    .line 280
    :goto_b5
    invoke-direct {p0, p2, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->selectCustom(Landroid/content/Context;Ljava/lang/String;)V

    .line 284
    :cond_b8
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 20

    .line 41
    move-object/from16 v0, p0

    invoke-virtual/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v1

    .line 44
    const/4 v2, 0x0

    if-eqz v1, :cond_d

    invoke-virtual {v1, v2}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v2

    .line 45
    :cond_d
    if-nez v2, :cond_15

    if-eqz v1, :cond_15

    .line 46
    invoke-virtual {v1}, Landroid/content/Context;->getDataDir()Ljava/io/File;

    move-result-object v2

    .line 48
    :cond_15
    if-eqz v2, :cond_1c

    invoke-virtual {v2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v2

    goto :goto_1e

    :cond_1c
    const-string v2, "/sdcard/Android/data/xyz.aethersx2.android/files"

    :goto_1e
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    .line 50
    invoke-static {v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrefs(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v2

    .line 51
    const-string v3, "internal"

    if-eqz v2, :cond_2f

    const-string v4, "UI/DataDirectory"

    invoke-interface {v2, v4, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_30

    :cond_2f
    move-object v2, v3

    .line 52
    :goto_30
    if-eqz v2, :cond_44

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_44

    invoke-virtual {v3, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3f

    goto :goto_44

    .line 56
    :cond_3f
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 57
    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    goto :goto_4a

    .line 53
    :cond_44
    :goto_44
    iput-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    .line 54
    const-string v2, ""

    iput-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 61
    :goto_4a
    iget-object v2, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->currentSelectedPath:Ljava/lang/String;

    invoke-static {v1, v2}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->applyDataLocation(Landroid/content/Context;Ljava/lang/String;)V

    .line 64
    new-instance v2, Landroid/widget/ScrollView;

    invoke-direct {v2, v1}, Landroid/widget/ScrollView;-><init>(Landroid/content/Context;)V

    .line 65
    new-instance v3, Landroid/view/ViewGroup$LayoutParams;

    const/4 v4, -0x1

    invoke-direct {v3, v4, v4}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 67
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ScrollView;->setFillViewport(Z)V

    .line 69
    new-instance v5, Landroid/widget/LinearLayout;

    invoke-direct {v5, v1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 70
    invoke-virtual {v5, v3}, Landroid/widget/LinearLayout;->setOrientation(I)V

    .line 71
    new-instance v6, Landroid/view/ViewGroup$LayoutParams;

    const/4 v7, -0x2

    invoke-direct {v6, v4, v7}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v5, v6}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 73
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

    .line 76
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 77
    const-string v9, "Data Directory"

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 78
    const/high16 v9, 0x41c00000    # 24.0f

    const/4 v10, 0x2

    invoke-virtual {v8, v10, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 79
    sget-object v9, Landroid/graphics/Typeface;->DEFAULT_BOLD:Landroid/graphics/Typeface;

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTypeface(Landroid/graphics/Typeface;)V

    .line 80
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getPrimaryTextColor(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 81
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 84
    new-instance v8, Landroid/widget/TextView;

    invoke-direct {v8, v1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    .line 85
    const-string v9, "NetherSX2 needs a directory to store its data files, including memory cards, save states, BIOS, and covers. You can use the default app-internal storage or select a custom folder."

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 86
    const/high16 v9, 0x41600000    # 14.0f

    invoke-virtual {v8, v10, v9}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 87
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getSecondaryTextColor(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setTextColor(I)V

    .line 88
    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v9

    int-to-float v9, v9

    const/high16 v10, 0x3f800000    # 1.0f

    invoke-virtual {v8, v9, v10}, Landroid/widget/TextView;->setLineSpacing(FF)V

    .line 89
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    invoke-direct {v9, v4, v7}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 91
    const/16 v10, 0x8

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v10

    iput v10, v9, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 92
    const/16 v10, 0x10

    invoke-direct {v0, v1, v10}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v11

    iput v11, v9, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 93
    invoke-virtual {v8, v9}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 94
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 97
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v8

    .line 98
    const-string v9, "Default Storage"

    iget-object v11, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->defaultInternalPath:Ljava/lang/String;

    invoke-direct {v0, v1, v9, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 99
    new-instance v11, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v11, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 101
    invoke-virtual {v11, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 102
    const/16 v12, 0x65

    invoke-virtual {v11, v10, v12}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 103
    const/16 v13, 0xc

    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-virtual {v11, v14}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 104
    invoke-virtual {v9, v11}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 105
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 107
    new-instance v9, Landroid/widget/ImageView;

    invoke-direct {v9, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    .line 108
    invoke-virtual {v9, v12}, Landroid/widget/ImageView;->setId(I)V

    .line 109
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    const-string v11, "ic_baseline_check_24"

    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v12

    invoke-virtual {v9, v12}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 110
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAccentColor(Landroid/content/Context;)I

    move-result v11

    invoke-virtual {v9, v11}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 111
    new-instance v9, Landroid/widget/RelativeLayout$LayoutParams;

    .line 112
    const/16 v12, 0x18

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v12}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v9, v14, v15}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 113
    const/16 v14, 0x15

    invoke-virtual {v9, v14}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 114
    const/16 v15, 0xf

    invoke-virtual {v9, v15}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 115
    iget-object v15, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v15, v9}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 116
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivDefaultCheck:Landroid/widget/ImageView;

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 118
    new-instance v9, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;

    invoke-direct {v9, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 124
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 127
    new-instance v8, Landroid/view/View;

    invoke-direct {v8, v1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 128
    new-instance v9, Landroid/widget/LinearLayout$LayoutParams;

    .line 129
    invoke-direct {v0, v1, v3}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    invoke-direct {v9, v4, v15}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 130
    const/4 v15, 0x4

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v14

    invoke-direct {v0, v1, v15}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v15

    const/4 v12, 0x0

    invoke-virtual {v9, v12, v14, v12, v15}, Landroid/widget/LinearLayout$LayoutParams;->setMargins(IIII)V

    .line 131
    invoke-virtual {v8, v9}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 132
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getDividerColor(Landroid/content/Context;)I

    move-result v9

    invoke-virtual {v8, v9}, Landroid/view/View;->setBackgroundColor(I)V

    .line 133
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 136
    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createOptionRow(Landroid/content/Context;)Landroid/widget/RelativeLayout;

    move-result-object v8

    .line 137
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-eqz v9, :cond_18a

    const-string v9, "Tap to select custom data directory"

    goto :goto_18c

    :cond_18a
    iget-object v9, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->customSavedPath:Ljava/lang/String;

    .line 138
    :goto_18c
    const-string v12, "Custom Folder"

    invoke-direct {v0, v1, v12, v9}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->createTextColumn(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/widget/LinearLayout;

    move-result-object v9

    .line 139
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    iput-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->tvCustomSubtitle:Landroid/widget/TextView;

    .line 140
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    invoke-direct {v3, v4, v7}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 142
    invoke-virtual {v3, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 143
    const/16 v6, 0x66

    invoke-virtual {v3, v10, v6}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(II)V

    .line 144
    invoke-direct {v0, v1, v13}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v7

    invoke-virtual {v3, v7}, Landroid/widget/RelativeLayout$LayoutParams;->setMarginEnd(I)V

    .line 145
    invoke-virtual {v9, v3}, Landroid/widget/LinearLayout;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 146
    invoke-virtual {v8, v9}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 148
    new-instance v3, Landroid/widget/ImageView;

    invoke-direct {v3, v1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    iput-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    .line 149
    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setId(I)V

    .line 150
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-direct {v0, v1, v11}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAppDrawable(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/drawable/Drawable;

    move-result-object v6

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 151
    iget-object v3, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-direct {v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getAccentColor(Landroid/content/Context;)I

    move-result v6

    invoke-virtual {v3, v6}, Landroid/widget/ImageView;->setColorFilter(I)V

    .line 152
    new-instance v3, Landroid/widget/RelativeLayout$LayoutParams;

    .line 153
    const/16 v4, 0x18

    invoke-direct {v0, v1, v4}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v6

    invoke-direct {v0, v1, v4}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->dp(Landroid/content/Context;I)I

    move-result v1

    invoke-direct {v3, v6, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 154
    const/16 v1, 0x15

    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 155
    const/16 v1, 0xf

    invoke-virtual {v3, v1}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 156
    iget-object v1, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v1, v3}, Landroid/widget/ImageView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 157
    iget-object v1, v0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->ivCustomCheck:Landroid/widget/ImageView;

    invoke-virtual {v8, v1}, Landroid/widget/RelativeLayout;->addView(Landroid/view/View;)V

    .line 161
    new-instance v1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;

    invoke-direct {v1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;-><init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    invoke-virtual {v8, v1}, Landroid/widget/RelativeLayout;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 173
    invoke-virtual {v5, v8}, Landroid/widget/LinearLayout;->addView(Landroid/view/View;)V

    .line 175
    invoke-virtual {v2, v5}, Landroid/widget/ScrollView;->addView(Landroid/view/View;)V

    .line 176
    invoke-direct/range {p0 .. p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 177
    return-object v2
.end method

.method public onResume()V
    .registers 1

    .line 182
    invoke-super {p0}, Landroidx/fragment/app/o;->onResume()V

    .line 183
    invoke-direct {p0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->updateUiState()V

    .line 184
    return-void
.end method
