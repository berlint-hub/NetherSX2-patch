.class public final Lxyz/aethersx2/android/SetupWizardActivity$d;
.super Landroidx/viewpager2/adapter/FragmentStateAdapter;
.source "SourceFile"

# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lxyz/aethersx2/android/SetupWizardActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "d"
.end annotation

# direct methods
.method public constructor <init>(Landroidx/fragment/app/o;)V
    .registers 3
    invoke-virtual {p1}, Landroidx/fragment/app/o;->v()Landroidx/fragment/app/y;
    move-result-object v0
    iget-object p1, p1, Landroidx/activity/ComponentActivity;->f:Landroidx/lifecycle/n;
    invoke-direct {p0, v0, p1}, Landroidx/viewpager2/adapter/FragmentStateAdapter;-><init>(Landroidx/fragment/app/y;Landroidx/lifecycle/h;)V
    return-void
.end method

# virtual methods
.method public final c()I
    .registers 2
    const/4 v0, 0x7
    return v0
.end method

.method public final s(I)Landroidx/fragment/app/n;
    .registers 3
    if-nez p1, :cond_not_0
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$f;
    const v0, 0x7f0c0046
    invoke-direct {p1, v0}, Lxyz/aethersx2/android/SetupWizardActivity$f;-><init>(I)V
    return-object p1
    :cond_not_0
    const/4 v0, 0x1
    if-ne p1, v0, :cond_not_1
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$a;
    invoke-direct {p1}, Lxyz/aethersx2/android/SetupWizardActivity$a;-><init>()V
    return-object p1
    :cond_not_1
    const/4 v0, 0x2
    if-ne p1, v0, :cond_not_2
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$e;
    invoke-direct {p1}, Lxyz/aethersx2/android/SetupWizardActivity$e;-><init>()V
    return-object p1
    :cond_not_2
    const/4 v0, 0x3
    if-ne p1, v0, :cond_not_3
    new-instance p1, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;
    invoke-direct {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;-><init>()V
    return-object p1
    :cond_not_3
    const/4 v0, 0x4
    if-ne p1, v0, :cond_not_4
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$c;
    invoke-direct {p1}, Lxyz/aethersx2/android/SetupWizardActivity$c;-><init>()V
    return-object p1
    :cond_not_4
    const/4 v0, 0x5
    if-ne p1, v0, :cond_not_5
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$b;
    invoke-direct {p1}, Lxyz/aethersx2/android/SetupWizardActivity$b;-><init>()V
    return-object p1
    :cond_not_5
    const/4 v0, 0x6
    if-ne p1, v0, :cond_default
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$f;
    const v0, 0x7f0c0042
    invoke-direct {p1, v0}, Lxyz/aethersx2/android/SetupWizardActivity$f;-><init>(I)V
    return-object p1
    :cond_default
    new-instance p1, Landroidx/fragment/app/n;
    invoke-direct {p1}, Landroidx/fragment/app/n;-><init>()V
    return-object p1
.end method
