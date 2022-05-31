.class public Lapp/todolist/view/AutoFillLinearLayout;
.super Landroid/widget/LinearLayout;


# instance fields
.field public final a:I

.field public final b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    const/16 v0, 0xc

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/AutoFillLinearLayout;->a:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/AutoFillLinearLayout;->b:I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/AutoFillLinearLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 v0, 0xc

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v1

    iput v1, p0, Lapp/todolist/view/AutoFillLinearLayout;->a:I

    invoke-static {v0}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/AutoFillLinearLayout;->b:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/AutoFillLinearLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p3, 0xc

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/AutoFillLinearLayout;->a:I

    invoke-static {p3}, Lf/c/a/k/i;->b(I)I

    move-result p3

    iput p3, p0, Lapp/todolist/view/AutoFillLinearLayout;->b:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/AutoFillLinearLayout;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    return-void
.end method

.method public final b(III)I
    .locals 14

    move-object v6, p0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v7

    const/4 v8, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_0
    if-ge v9, v7, :cond_3

    invoke-virtual {p0, v9}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v13

    if-nez v13, :cond_0

    move v3, p1

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v13

    move/from16 v2, p2

    move/from16 v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/widget/LinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v13}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int v2, v0, v11

    move v3, p1

    if-le v2, v3, :cond_1

    add-int/lit8 v12, v12, 0x1

    iget v2, v6, Lapp/todolist/view/AutoFillLinearLayout;->a:I

    add-int/2addr v2, v1

    add-int/2addr v10, v2

    const/4 v11, 0x0

    :cond_1
    if-nez v10, :cond_2

    move v10, v1

    :cond_2
    iget v1, v6, Lapp/todolist/view/AutoFillLinearLayout;->b:I

    add-int/2addr v0, v1

    add-int/2addr v11, v0

    const v0, 0x7f0a05fe

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v13, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :goto_1
    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    :cond_3
    return v10
.end method

.method public onFinishInflate()V
    .locals 0

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 6

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    const/4 p2, 0x0

    const/4 p3, -0x1

    const/4 p4, 0x0

    const/4 p5, 0x0

    const/4 v0, 0x0

    :goto_0
    if-ge p4, p1, :cond_4

    invoke-virtual {p0, p4}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_3

    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_0

    goto :goto_1

    :cond_0
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    const v4, 0x7f0a05fe

    invoke-virtual {v1, v4}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v4

    instance-of v5, v4, Ljava/lang/Integer;

    if-eqz v5, :cond_3

    check-cast v4, Ljava/lang/Integer;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v4

    if-eq p3, v4, :cond_2

    if-lez v4, :cond_1

    iget p3, p0, Lapp/todolist/view/AutoFillLinearLayout;->a:I

    add-int/2addr p3, v3

    add-int/2addr p5, p3

    :cond_1
    move p3, v4

    const/4 v0, 0x0

    :cond_2
    add-int v4, v0, v2

    add-int/2addr v3, p5

    invoke-virtual {v1, v0, p5, v4, v3}, Landroid/view/View;->layout(IIII)V

    iget v1, p0, Lapp/todolist/view/AutoFillLinearLayout;->b:I

    add-int/2addr v2, v1

    add-int/2addr v0, v2

    :cond_3
    :goto_1
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_4
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingStart()I

    move-result v1

    sub-int v1, v0, v1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingEnd()I

    move-result v2

    sub-int/2addr v1, v2

    invoke-virtual {p0, v1, p1, p2}, Lapp/todolist/view/AutoFillLinearLayout;->b(III)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    return-void
.end method
