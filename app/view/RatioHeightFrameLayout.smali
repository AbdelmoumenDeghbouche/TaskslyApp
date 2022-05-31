.class public Lapp/todolist/view/RatioHeightFrameLayout;
.super Landroid/widget/FrameLayout;


# instance fields
.field public a:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    const v0, 0x3faaaaab

    iput v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/RatioHeightFrameLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const v0, 0x3faaaaab

    iput v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/RatioHeightFrameLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const p3, 0x3faaaaab

    iput p3, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/RatioHeightFrameLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    if-eqz p2, :cond_1

    sget-object v0, Lcom/todo/R$styleable;->RatioHeightFrameLayout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-static {p2}, Lf/c/a/k/j;->w(Ljava/lang/String;)Landroid/util/SizeF;

    move-result-object p2

    if-eqz p2, :cond_0

    invoke-virtual {p2}, Landroid/util/SizeF;->getWidth()F

    move-result v0

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p2}, Landroid/util/SizeF;->getHeight()F

    move-result v0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    invoke-virtual {p2}, Landroid/util/SizeF;->getWidth()F

    move-result v0

    invoke-virtual {p2}, Landroid/util/SizeF;->getHeight()F

    move-result p2

    div-float/2addr v0, p2

    iput v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    :cond_0
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 5

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v1

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v2

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v3

    const/high16 v4, 0x40000000    # 2.0f

    if-ne v1, v4, :cond_0

    if-lez v0, :cond_0

    int-to-float p2, v0

    iget v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    div-float/2addr p2, v0

    float-to-int p2, p2

    invoke-static {p2, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void

    :cond_0
    if-ne v3, v4, :cond_1

    if-lez v2, :cond_1

    int-to-float p1, v2

    iget v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    mul-float p1, p1, v0

    float-to-int p1, p1

    invoke-static {p1, v4}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void

    :cond_1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getMeasuredWidth()I

    move-result p1

    int-to-float p2, p1

    iget v0, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    div-float/2addr p2, v0

    float-to-int p2, p2

    invoke-virtual {p0, p1, p2}, Landroid/widget/FrameLayout;->setMeasuredDimension(II)V

    return-void
.end method

.method public setWHRatio(F)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/RatioHeightFrameLayout;->a:F

    invoke-virtual {p0}, Landroid/widget/FrameLayout;->requestLayout()V

    return-void
.end method
