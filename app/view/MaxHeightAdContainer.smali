.class public Lapp/todolist/view/MaxHeightAdContainer;
.super Lapp/todolist/view/AdContainer;


# instance fields
.field public d:I

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Lapp/todolist/view/AdContainer;-><init>(Landroid/content/Context;)V

    const/16 v0, 0xdc

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->d:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/MaxHeightAdContainer;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Lapp/todolist/view/AdContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 v0, 0xdc

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->d:I

    const/4 v0, 0x0

    iput-boolean v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/MaxHeightAdContainer;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Lapp/todolist/view/AdContainer;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p3, 0xdc

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result p3

    iput p3, p0, Lapp/todolist/view/MaxHeightAdContainer;->d:I

    const/4 p3, 0x0

    iput-boolean p3, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/MaxHeightAdContainer;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    return-void
.end method

.method public onInterceptTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Lapp/todolist/view/AdContainer;->onInterceptTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public onMeasure(II)V
    .locals 1

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result p1

    iget p2, p0, Lapp/todolist/view/MaxHeightAdContainer;->d:I

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredHeight()I

    move-result v0

    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 1

    iget-boolean v0, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    if-nez v0, :cond_1

    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    goto :goto_1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    :goto_1
    return p1
.end method

.method public setIntercept(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/MaxHeightAdContainer;->e:Z

    return-void
.end method
