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

.field final synthetic val$fCtx:Landroid/content/Context;

.field final synthetic val$pPath:Ljava/lang/String;


# direct methods
.method constructor <init>(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 192
    iput-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iput-object p2, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->val$fCtx:Landroid/content/Context;

    iput-object p3, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->val$pPath:Ljava/lang/String;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onClick(Landroid/view/View;)V
    .registers 4

    .line 195
    iget-object p1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->this$0:Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;

    iget-object v0, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->val$fCtx:Landroid/content/Context;

    iget-object v1, p0, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment$1;->val$pPath:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;->-$$Nest$mselectCustomPath(Lxyz/aethersx2/android/SetupWizardDataDirectoryFragment;Landroid/content/Context;Ljava/lang/String;)V

    .line 196
    return-void
.end method
