.class Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;
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

    .line 161
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 164
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-virtual {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->getContext()Landroid/content/Context;

    move-result-object p1

    .line 165
    if-nez p1, :cond_9

    return-void

    .line 166
    :cond_9
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_1b

    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result v0

    if-nez v0, :cond_1b

    .line 167
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {v0, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mrequestAllFilesPermission(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;)V

    .line 168
    return-void

    .line 170
    :cond_1b
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$2;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mopenFolderPicker(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    .line 171
    return-void
.end method
