.class public Lapp/todolist/view/GradientEntry$a;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/os/Parcelable$Creator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/todolist/view/GradientEntry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Landroid/os/Parcelable$Creator<",
        "Lapp/todolist/view/GradientEntry;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/os/Parcel;)Lapp/todolist/view/GradientEntry;
    .locals 1

    new-instance v0, Lapp/todolist/view/GradientEntry;

    invoke-direct {v0, p1}, Lapp/todolist/view/GradientEntry;-><init>(Landroid/os/Parcel;)V

    return-object v0
.end method

.method public b(I)[Lapp/todolist/view/GradientEntry;
    .locals 0

    new-array p1, p1, [Lapp/todolist/view/GradientEntry;

    return-object p1
.end method

.method public bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lapp/todolist/view/GradientEntry$a;->a(Landroid/os/Parcel;)Lapp/todolist/view/GradientEntry;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    invoke-virtual {p0, p1}, Lapp/todolist/view/GradientEntry$a;->b(I)[Lapp/todolist/view/GradientEntry;

    move-result-object p1

    return-object p1
.end method
