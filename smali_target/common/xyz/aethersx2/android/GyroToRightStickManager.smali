.class public Lxyz/aethersx2/android/GyroToRightStickManager;
.super Ljava/lang/Object;
.source "GyroToRightStickManager.java"

# interfaces
.implements Landroid/hardware/SensorEventListener;


# static fields
.field private static final AXIS_RZ:I = 0xe

.field private static final AXIS_Z:I = 0xb

.field private static final TAG:Ljava/lang/String; = "GyroAiming"

.field private static sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;


# instance fields
.field private mDeadzone:F

.field private mEnabled:Z

.field private mGyroSensor:Landroid/hardware/Sensor;

.field private mLastX:F

.field private mLastY:F

.field private mSensitivity:F

.field private mSensorManager:Landroid/hardware/SensorManager;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 20
    const/4 v0, 0x0

    iput-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 21
    const v0, 0x3f19999a    # 0.6f

    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    .line 22
    const v0, 0x3d23d70a    # 0.04f

    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    .line 23
    const/4 v0, 0x0

    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 24
    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    return-void
.end method

.method private register(Landroid/content/Context;)V
    .registers 4

    .line 50
    iget-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    if-eqz v0, :cond_5

    return-void

    .line 51
    :cond_5
    const-string v0, "sensor"

    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/hardware/SensorManager;

    iput-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    .line 52
    if-eqz p1, :cond_29

    .line 53
    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Landroid/hardware/SensorManager;->getDefaultSensor(I)Landroid/hardware/Sensor;

    move-result-object p1

    iput-object p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mGyroSensor:Landroid/hardware/Sensor;

    .line 54
    if-eqz p1, :cond_29

    .line 55
    iget-object v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    const/4 v1, 0x1

    invoke-virtual {v0, p0, p1, v1}, Landroid/hardware/SensorManager;->registerListener(Landroid/hardware/SensorEventListener;Landroid/hardware/Sensor;I)Z

    .line 56
    iput-boolean v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 57
    const-string p1, "GyroAiming"

    const-string v0, "Gyroscope to Right Stick enabled"

    invoke-static {p1, v0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 60
    :cond_29
    return-void
.end method

.method public static declared-synchronized start(Landroid/content/Context;)V
    .registers 5

    const-class v0, Lxyz/aethersx2/android/GyroToRightStickManager;

    monitor-enter v0

    .line 27
    if-nez p0, :cond_7

    monitor-exit v0

    return-void

    .line 29
    :cond_7
    :try_start_7
    invoke-static {p0}, Landroidx/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    .line 30
    const-string v2, "Pad/GyroToRightStick"

    const/4 v3, 0x0

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1
    :try_end_12
    .catchall {:try_start_7 .. :try_end_12} :catchall_27

    .line 31
    if-nez v1, :cond_16

    .line 32
    monitor-exit v0

    return-void

    .line 34
    :cond_16
    :try_start_16
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    if-nez v1, :cond_21

    .line 35
    new-instance v1, Lxyz/aethersx2/android/GyroToRightStickManager;

    invoke-direct {v1}, Lxyz/aethersx2/android/GyroToRightStickManager;-><init>()V

    sput-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    .line 37
    :cond_21
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    invoke-direct {v1, p0}, Lxyz/aethersx2/android/GyroToRightStickManager;->register(Landroid/content/Context;)V
    :try_end_26
    .catchall {:try_start_16 .. :try_end_26} :catchall_27

    .line 40
    goto :goto_2f

    .line 38
    :catchall_27
    move-exception p0

    .line 39
    :try_start_28
    const-string v1, "GyroAiming"

    const-string v2, "Failed to start gyro aiming"

    invoke-static {v1, v2, p0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I
    :try_end_2f
    .catchall {:try_start_28 .. :try_end_2f} :catchall_31

    .line 41
    :goto_2f
    monitor-exit v0

    return-void

    .line 26
    :catchall_31
    move-exception p0

    monitor-exit v0

    throw p0
.end method

.method public static declared-synchronized stop()V
    .registers 2

    const-class v0, Lxyz/aethersx2/android/GyroToRightStickManager;

    monitor-enter v0

    .line 44
    :try_start_3
    sget-object v1, Lxyz/aethersx2/android/GyroToRightStickManager;->sInstance:Lxyz/aethersx2/android/GyroToRightStickManager;

    if-eqz v1, :cond_a

    .line 45
    invoke-direct {v1}, Lxyz/aethersx2/android/GyroToRightStickManager;->unregister()V
    :try_end_a
    .catchall {:try_start_3 .. :try_end_a} :catchall_c

    .line 47
    :cond_a
    monitor-exit v0

    return-void

    .line 43
    :catchall_c
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method private unregister()V
    .registers 4

    .line 63
    iget-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    if-eqz v0, :cond_30

    iget-object v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensorManager:Landroid/hardware/SensorManager;

    if-eqz v0, :cond_30

    .line 64
    invoke-virtual {v0, p0}, Landroid/hardware/SensorManager;->unregisterListener(Landroid/hardware/SensorEventListener;)V

    .line 65
    const/4 v0, 0x0

    iput-boolean v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mEnabled:Z

    .line 66
    iget v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_1b

    iget v1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    cmpl-float v1, v1, v2

    if-eqz v1, :cond_29

    .line 67
    :cond_1b
    const/16 v1, 0xb

    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 68
    const/16 v1, 0xe

    invoke-static {v0, v1, v2}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 69
    iput v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 70
    iput v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    .line 72
    :cond_29
    const-string v0, "GyroAiming"

    const-string v1, "Gyroscope to Right Stick disabled"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 74
    :cond_30
    return-void
.end method


# virtual methods
.method public onAccuracyChanged(Landroid/hardware/Sensor;I)V
    .registers 3

    .line 106
    return-void
.end method

.method public onSensorChanged(Landroid/hardware/SensorEvent;)V
    .registers 7

    .line 78
    if-eqz p1, :cond_69

    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    if-nez v0, :cond_7

    goto :goto_69

    .line 79
    :cond_7
    iget-object v0, p1, Landroid/hardware/SensorEvent;->sensor:Landroid/hardware/Sensor;

    invoke-virtual {v0}, Landroid/hardware/Sensor;->getType()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_11

    return-void

    .line 85
    :cond_11
    iget-object v0, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v1, 0x0

    aget v0, v0, v1

    .line 86
    iget-object p1, p1, Landroid/hardware/SensorEvent;->values:[F

    const/4 v2, 0x2

    aget p1, p1, v2

    .line 88
    neg-float v0, v0

    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mSensitivity:F

    mul-float v0, v0, v2

    .line 89
    neg-float p1, p1

    mul-float p1, p1, v2

    .line 91
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    const/4 v4, 0x0

    cmpg-float v2, v2, v3

    if-gez v2, :cond_2f

    const/4 p1, 0x0

    .line 92
    :cond_2f
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v2

    iget v3, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mDeadzone:F

    cmpg-float v2, v2, v3

    if-gez v2, :cond_3a

    const/4 v0, 0x0

    .line 94
    :cond_3a
    const/high16 v2, 0x3f800000    # 1.0f

    invoke-static {v2, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    const/high16 v3, -0x40800000    # -1.0f

    invoke-static {v3, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 95
    invoke-static {v2, v0}, Ljava/lang/Math;->min(FF)F

    move-result v0

    invoke-static {v3, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 97
    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    cmpl-float v2, p1, v2

    if-nez v2, :cond_5a

    iget v2, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    cmpl-float v2, v0, v2

    if-eqz v2, :cond_68

    .line 98
    :cond_5a
    iput p1, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastX:F

    .line 99
    iput v0, p0, Lxyz/aethersx2/android/GyroToRightStickManager;->mLastY:F

    .line 100
    const/16 v2, 0xb

    invoke-static {v1, v2, p1}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 101
    const/16 p1, 0xe

    invoke-static {v1, p1, v0}, Lxyz/aethersx2/android/NativeLibrary;->handleControllerAxisEvent(IIF)V

    .line 103
    :cond_68
    return-void

    .line 78
    :cond_69
    :goto_69
    return-void
.end method
