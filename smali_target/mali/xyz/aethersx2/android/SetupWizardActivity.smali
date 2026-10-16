.class public Lxyz/aethersx2/android/SetupWizardActivity;
.super Lq3/p;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;

# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lxyz/aethersx2/android/SetupWizardActivity$d;,
        Lxyz/aethersx2/android/SetupWizardActivity$b;,
        Lxyz/aethersx2/android/SetupWizardActivity$e;,
        Lxyz/aethersx2/android/SetupWizardActivity$c;,
        Lxyz/aethersx2/android/SetupWizardActivity$a;,
        Lxyz/aethersx2/android/SetupWizardActivity$f;
    }
.end annotation

# instance fields
.field public A:Lxyz/aethersx2/android/SetupWizardActivity$d;
.field public z:Landroidx/viewpager2/widget/ViewPager2;

# direct methods
.method public constructor <init>()V
    .registers 1
    invoke-direct {p0}, Lq3/p;-><init>()V
    return-void
.end method

# virtual methods
.method public final A()V
    .registers 6
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I
    move-result v0
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->A:Lxyz/aethersx2/android/SetupWizardActivity$d;
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$e;->c()I
    move-result v1
    add-int/lit8 v1, v1, -0x1
    const v2, 0x7f0901e0
    invoke-virtual {p0, v2}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/ProgressBar;
    if-eqz v2, :cond_skip_prog
    invoke-virtual {v2, v1}, Landroid/widget/ProgressBar;->setMax(I)V
    invoke-virtual {v2, v0}, Landroid/widget/ProgressBar;->setProgress(I)V
    :cond_skip_prog
    const v2, 0x7f09006d
    invoke-virtual {p0, v2}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object v2
    if-eqz v2, :cond_skip_back
    const/4 v3, 0x0
    const/4 v4, 0x1
    if-lez v0, :cond_back_dis
    move v3, v4
    :cond_back_dis
    invoke-virtual {v2, v3}, Landroid/view/View;->setEnabled(Z)V
    :cond_skip_back
    const v2, 0x7f0901bc
    invoke-virtual {p0, v2}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object v2
    check-cast v2, Landroid/widget/Button;
    if-eqz v2, :cond_ret
    if-ne v0, v1, :cond_next_lbl
    const v3, 0x7f1002d2
    goto :set_lbl
    :cond_next_lbl
    const v3, 0x7f1002d5
    :set_lbl
    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V
    :cond_ret
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .registers 5
    invoke-virtual {p1}, Landroid/view/View;->getId()I
    move-result v0
    const v1, 0x7f09006d
    if-ne v0, v1, :check_next
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I
    move-result v0
    if-lez v0, :cond_ret
    add-int/lit8 v0, v0, -0x1
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    invoke-virtual {v1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardActivity;->A()V
    return-void
    :check_next
    const v1, 0x7f0901bc
    if-ne v0, v1, :cond_ret
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    invoke-virtual {v0}, Landroidx/viewpager2/widget/ViewPager2;->getCurrentItem()I
    move-result v0
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->A:Lxyz/aethersx2/android/SetupWizardActivity$d;
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$e;->c()I
    move-result v1
    add-int/lit8 v1, v1, -0x1
    if-ge v0, v1, :do_finish
    add-int/lit8 v0, v0, 0x1
    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    invoke-virtual {v1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setCurrentItem(I)V
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardActivity;->A()V
    return-void
    :do_finish
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V
    :cond_ret
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 4
    const/4 p1, 0x0
    invoke-super {p0, p1}, Landroidx/fragment/app/o;->onCreate(Landroid/os/Bundle;)V
    const p1, 0x7f0c0021
    invoke-virtual {p0, p1}, Le/e;->setContentView(I)V
    const p1, 0x7f09028a
    invoke-virtual {p0, p1}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object p1
    check-cast p1, Landroidx/viewpager2/widget/ViewPager2;
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    new-instance p1, Lxyz/aethersx2/android/SetupWizardActivity$d;
    invoke-direct {p1, p0}, Lxyz/aethersx2/android/SetupWizardActivity$d;-><init>(Landroidx/fragment/app/o;)V
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->A:Lxyz/aethersx2/android/SetupWizardActivity$d;
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    const/4 v0, 0x0
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setUserInputEnabled(Z)V
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardActivity;->z:Landroidx/viewpager2/widget/ViewPager2;
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardActivity;->A:Lxyz/aethersx2/android/SetupWizardActivity$d;
    invoke-virtual {p1, v0}, Landroidx/viewpager2/widget/ViewPager2;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$e;)V
    const p1, 0x7f09006d
    invoke-virtual {p0, p1}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object p1
    if-eqz p1, :cond_next_btn
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :cond_next_btn
    const p1, 0x7f0901bc
    invoke-virtual {p0, p1}, Le/e;->findViewById(I)Landroid/view/View;
    move-result-object p1
    if-eqz p1, :cond_call_a
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V
    :cond_call_a
    invoke-virtual {p0}, Lxyz/aethersx2/android/SetupWizardActivity;->A()V
    return-void
.end method
