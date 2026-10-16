.class Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;
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

.field final synthetic val$fCtx3:Landroid/content/Context;

.field final synthetic val$internalPath:Ljava/lang/String;

.field final synthetic val$presetPaths:[Ljava/lang/String;


# direct methods
.method constructor <init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Ljava/lang/String;[Ljava/lang/String;Landroid/content/Context;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 264
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$internalPath:Ljava/lang/String;

    iput-object p3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$presetPaths:[Ljava/lang/String;

    iput-object p4, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$fCtx3:Landroid/content/Context;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 267
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$fgetcurrentSelectedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_22

    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$fgetcurrentSelectedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$internalPath:Ljava/lang/String;

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1b

    goto :goto_22

    .line 268
    :cond_1b
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    invoke-static {p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$fgetcurrentSelectedPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;)Ljava/lang/String;

    move-result-object p1

    goto :goto_27

    :cond_22
    :goto_22
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$presetPaths:[Ljava/lang/String;

    const/4 v0, 0x0

    aget-object p1, p1, v0

    .line 269
    :goto_27
    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$6;->val$fCtx3:Landroid/content/Context;

    invoke-static {v0, v1, p1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mselectCustomPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    .line 270
    return-void
.end method
