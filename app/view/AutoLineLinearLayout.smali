.class public Lapp/todolist/view/AutoLineLinearLayout;
.super Landroid/widget/LinearLayout;


# instance fields
.field public final a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:I

.field public c:I

.field public d:I

.field public e:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/AutoLineLinearLayout;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/AutoLineLinearLayout;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p3, Ljava/util/HashMap;

    invoke-direct {p3}, Ljava/util/HashMap;-><init>()V

    iput-object p3, p0, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    const/4 p3, 0x1

    iput-boolean p3, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/AutoLineLinearLayout;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static d()Z
    .locals 2

    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->getLayoutDirectionFromLocale(Ljava/util/Locale;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    return v1
.end method


# virtual methods
.method public final a(I)I
    .locals 4

    iget v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->b:I

    invoke-virtual {p0}, Lapp/todolist/view/AutoLineLinearLayout;->c()Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x2

    if-eqz v1, :cond_1

    iget v1, p0, Lapp/todolist/view/AutoLineLinearLayout;->b:I

    if-ne v1, v2, :cond_0

    const/4 v0, 0x2

    goto :goto_0

    :cond_0
    if-ne v1, v3, :cond_1

    const/4 v0, 0x1

    :cond_1
    :goto_0
    if-eqz v0, :cond_3

    iget-object v1, p0, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    if-eqz p1, :cond_3

    if-ne v0, v2, :cond_2

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    div-int/2addr p1, v3

    return p1

    :cond_2
    if-ne v0, v3, :cond_3

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    return p1

    :cond_3
    const/4 p1, 0x0

    return p1
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    sget-object v0, Lcom/todo/R$styleable;->AutoLineLinearLayout:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    iget-boolean p2, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    const/4 v0, 0x1

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    const/4 p2, 0x0

    invoke-virtual {p1, p2, p2}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->b:I

    const/4 v0, 0x2

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    iput v0, p0, Lapp/todolist/view/AutoLineLinearLayout;->c:I

    const/4 v0, 0x3

    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result p2

    iput p2, p0, Lapp/todolist/view/AutoLineLinearLayout;->d:I

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public c()Z
    .locals 2

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getLayoutDirection()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    invoke-static {}, Lapp/todolist/view/AutoLineLinearLayout;->d()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :cond_1
    :goto_0
    return v1
.end method

.method public final e(III)I
    .locals 15

    move-object v6, p0

    move/from16 v7, p1

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result v8

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    :goto_0
    if-ge v10, v8, :cond_4

    invoke-virtual {p0, v10}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v14

    if-eqz v14, :cond_3

    invoke-virtual {v14}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-ne v0, v1, :cond_0

    goto :goto_1

    :cond_0
    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, v14

    move/from16 v2, p2

    move/from16 v4, p3

    invoke-virtual/range {v0 .. v5}, Landroid/widget/LinearLayout;->measureChildWithMargins(Landroid/view/View;IIII)V

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredWidth()I

    move-result v0

    invoke-virtual {v14}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int v2, v0, v12

    if-le v2, v7, :cond_1

    iget-object v2, v6, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    sub-int v4, v7, v12

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v11, v11, 0x1

    iget v2, v6, Lapp/todolist/view/AutoLineLinearLayout;->d:I

    add-int/2addr v2, v1

    add-int/2addr v13, v2

    const/4 v12, 0x0

    :cond_1
    if-nez v13, :cond_2

    move v13, v1

    :cond_2
    iget v1, v6, Lapp/todolist/view/AutoLineLinearLayout;->c:I

    add-int/2addr v0, v1

    add-int/2addr v12, v0

    const v0, 0x7f0a050a

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v14, v0, v1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_3
    :goto_1
    add-int/lit8 v10, v10, 0x1

    goto :goto_0

    :cond_4
    iget-object v0, v6, Lapp/todolist/view/AutoLineLinearLayout;->a:Ljava/util/HashMap;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    sub-int v2, v7, v12

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingBottom()I

    move-result v0

    add-int/2addr v13, v0

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingTop()I

    move-result v0

    add-int/2addr v13, v0

    return v13
.end method

.method public onFinishInflate()V
    .locals 0

    invoke-super {p0}, Landroid/widget/LinearLayout;->onFinishInflate()V

    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 10

    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getChildCount()I

    move-result p1

    iget-boolean p2, p0, Lapp/todolist/view/AutoLineLinearLayout;->e:Z

    const/4 p3, 0x1

    const/4 p4, 0x0

    const/4 p5, -0x1

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    if-ge v0, p1, :cond_7

    invoke-virtual {p0, v0}, Landroid/widget/LinearLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_6

    invoke-virtual {v5}, Landroid/view/View;->getVisibility()I

    move-result v6

    const/16 v7, 0x8

    if-ne v6, v7, :cond_0

    goto :goto_2

    :cond_0
    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v7

    const v8, 0x7f0a050a

    invoke-virtual {v5, v8}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object v8

    instance-of v9, v8, Ljava/lang/Integer;

    if-eqz v9, :cond_6

    check-cast v8, Ljava/lang/Integer;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    if-eq p5, v8, :cond_3

    if-lez v8, :cond_1

    iget p5, p0, Lapp/todolist/view/AutoLineLinearLayout;->d:I

    add-int/2addr p5, v7

    add-int/2addr v1, p5

    :cond_1
    invoke-virtual {p0, v8}, Lapp/todolist/view/AutoLineLinearLayout;->a(I)I

    move-result p5

    if-eqz v2, :cond_2

    move v4, p5

    :cond_2
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getPaddingStart()I

    move-result v3

    add-int/2addr v3, p5

    move p5, v8

    :cond_3
    if-eqz v2, :cond_4

    const/4 v2, 0x0

    :cond_4
    if-eqz p2, :cond_5

    add-int v8, v3, v6

    add-int/2addr v7, v1

    invoke-virtual {v5, v3, v1, v8, v7}, Landroid/view/View;->layout(IIII)V

    goto :goto_1

    :cond_5
    sub-int p2, v3, v4

    add-int v8, p2, v6

    add-int/2addr v7, v1

    invoke-virtual {v5, p2, v1, v8, v7}, Landroid/view/View;->layout(IIII)V

    const/4 p2, 0x1

    :goto_1
    iget v5, p0, Lapp/todolist/view/AutoLineLinearLayout;->c:I

    add-int/2addr v6, v5

    add-int/2addr v3, v6

    :cond_6
    :goto_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_7
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

    invoke-virtual {p0, v1, p1, p2}, Lapp/todolist/view/AutoLineLinearLayout;->e(III)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Landroid/widget/LinearLayout;->setMeasuredDimension(II)V

    return-void
.end method
