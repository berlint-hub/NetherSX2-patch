.class Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;
.super Ljava/lang/Object;
.source "SetupWizardDataDirectoryFragment.java"

# interfaces
.implements Landroid/view/View$OnClickListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;


# direct methods
.method constructor <init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V
    .registers 2

    .line 118
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 121
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-virtual {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mselectDefault(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    .line 122
    return-void
.end method
