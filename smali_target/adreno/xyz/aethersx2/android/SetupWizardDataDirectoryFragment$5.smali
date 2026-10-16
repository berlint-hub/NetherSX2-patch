.class Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;
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

.field final synthetic val$context:Landroid/content/Context;


# direct methods
.method constructor <init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 321
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 3

    .line 324
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$5;->val$context:Landroid/content/Context;

    invoke-static {p1, v0}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mrequestAllFilesPermission(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    .line 325
    return-void
.end method
