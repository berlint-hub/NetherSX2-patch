.class Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;
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

    .line 270
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->val$context:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 273
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$fgetcustomSavedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_12

    .line 274
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mopenFolderPicker(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)V

    goto :goto_1d

    .line 276
    :cond_12
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$4;->val$context:Landroid/content/Context;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$fgetcustomSavedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mselectCustom(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    .line 278
    :goto_1d
    return-void
.end method
