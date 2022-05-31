.class public Lapp/todolist/view/MoodPieChartView$b;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/todolist/view/MoodPieChartView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public a:F

.field public b:I


# direct methods
.method public constructor <init>(FI)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput p1, p0, Lapp/todolist/view/MoodPieChartView$b;->a:F

    iput p2, p0, Lapp/todolist/view/MoodPieChartView$b;->b:I

    return-void
.end method


# virtual methods
.method public a()F
    .locals 1

    iget v0, p0, Lapp/todolist/view/MoodPieChartView$b;->a:F

    return v0
.end method
