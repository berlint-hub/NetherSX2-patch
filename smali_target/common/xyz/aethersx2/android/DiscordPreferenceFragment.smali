.class public Lxyz/aethersx2/android/DiscordPreferenceFragment;
.super Landroidx/preference/b;
.source "DiscordPreferenceFragment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroidx/preference/b;-><init>()V

    return-void
.end method


# virtual methods
.method public final A(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 6

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/o;->getContext()Landroid/content/Context;

    move-result-object p1

    if-eqz p1, :cond_exit

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "discord_preferences"

    const-string v2, "xml"

    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, v1, v2, p1}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result p1

    if-eqz p1, :cond_exit

    invoke-virtual {p0, p1, p2}, Landroidx/preference/b;->C(ILjava/lang/String;)V

    :cond_exit
    return-void
.end method
