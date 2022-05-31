.class public Lapp/todolist/view/ProtectEyesContainer;
.super Landroid/widget/RelativeLayout;


# instance fields
.field public a:I

.field public b:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    invoke-direct {p0, p1}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    invoke-direct {p0, p1, p2, p3}, Landroid/widget/RelativeLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    const v0, 0x7f0a0402

    invoke-virtual {p0, v0}, Landroid/widget/RelativeLayout;->findViewById(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_5

    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_0
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_2

    invoke-virtual {p0, v2}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1

    if-eq v5, v0, :cond_1

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredWidth()I

    move-result v6

    iput v6, p0, Lapp/todolist/view/ProtectEyesContainer;->a:I

    invoke-virtual {v5}, Landroid/view/View;->getMeasuredHeight()I

    move-result v5

    iput v5, p0, Lapp/todolist/view/ProtectEyesContainer;->b:I

    iget v6, p0, Lapp/todolist/view/ProtectEyesContainer;->a:I

    if-ge v3, v6, :cond_0

    move v3, v6

    :cond_0
    if-ge v4, v5, :cond_1

    move v4, v5

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    const/4 v2, 0x0

    :goto_1
    invoke-virtual {p0}, Landroid/widget/RelativeLayout;->getChildCount()I

    move-result v5

    if-ge v2, v5, :cond_5

    invoke-virtual {p0, v2}, Landroid/widget/RelativeLayout;->getChildAt(I)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_4

    if-ne v5, v0, :cond_3

    invoke-static {v5, v3, v1}, Le/a/x/m;->E(Landroid/view/View;IZ)V

    goto :goto_2

    :cond_3
    invoke-static {v5, v3, v4, v1}, Le/a/x/m;->F(Landroid/view/View;IIZ)V

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_5
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    :try_start_0
    invoke-virtual {p0}, Lapp/todolist/view/ProtectEyesContainer;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    invoke-super {p0, p1, p2}, Landroid/widget/RelativeLayout;->onMeasure(II)V

    return-void
.end method
