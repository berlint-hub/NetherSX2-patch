.class public Lxyz/aethersx2/android/ExternalControllerHelper;
.super Ljava/lang/Object;
.source "ExternalControllerHelper.java"


# static fields
.field private static final TAG:Ljava/lang/String; = "ExternalController"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static checkAndAutoMapPlayer1(Landroid/content/Context;Landroid/view/InputDevice;)V
    .registers 7

    .line 14
    const-string v0, "ExternalController"

    if-eqz p0, :cond_52

    if-nez p1, :cond_7

    goto :goto_52

    .line 16
    :cond_7
    :try_start_7
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 17
    const-string v2, "Pad1/Cross"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 18
    if-eqz v1, :cond_1e

    invoke-virtual {v1}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4a

    .line 19
    :cond_1e
    invoke-virtual {p1}, Landroid/view/InputDevice;->getName()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "External controller detected with unmapped Player 1 - auto-mapping: "

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 20
    new-instance v1, Lxyz/aethersx2/android/a;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2, v3}, Lxyz/aethersx2/android/a;-><init>(Landroid/content/Context;ILxyz/aethersx2/android/a$a_listener;)V

    .line 21
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 22
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 23
    const/4 p1, 0x0

    invoke-static {v1, p0, p1}, Lxyz/aethersx2/android/a;->a(Lxyz/aethersx2/android/a;Ljava/util/ArrayList;I)V
    :try_end_4a
    .catchall {:try_start_7 .. :try_end_4a} :catchall_4b

    .line 27
    :cond_4a
    goto :goto_51

    .line 25
    :catchall_4b
    move-exception p0

    .line 26
    const-string p1, "Failed to auto-map controller"

    invoke-static {v0, p1, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 28
    :goto_51
    return-void

    .line 14
    :cond_52
    :goto_52
    return-void
.end method
