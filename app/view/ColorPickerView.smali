.class public Lapp/todolist/view/ColorPickerView;
.super Landroidx/recyclerview/widget/RecyclerView;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lapp/todolist/view/ColorPickerView$b;,
        Lapp/todolist/view/ColorPickerView$c;,
        Lapp/todolist/view/ColorPickerView$a;
    }
.end annotation


# instance fields
.field public a:Lapp/todolist/view/ColorPickerView$b;

.field public b:Lapp/todolist/view/ColorPickerView$a;

.field public c:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;)V

    const/4 v0, 0x0

    iput v0, p0, Lapp/todolist/view/ColorPickerView;->c:I

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lapp/todolist/view/ColorPickerView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    iput v0, p0, Lapp/todolist/view/ColorPickerView;->c:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/ColorPickerView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

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

    invoke-direct {p0, p1, p2, p3}, Landroidx/recyclerview/widget/RecyclerView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    iput p3, p0, Lapp/todolist/view/ColorPickerView;->c:I

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/ColorPickerView;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Lapp/todolist/view/ColorPickerView;)Lapp/todolist/view/ColorPickerView$b;
    .locals 0

    iget-object p0, p0, Lapp/todolist/view/ColorPickerView;->a:Lapp/todolist/view/ColorPickerView$b;

    return-object p0
.end method

.method public static d(Landroid/content/Context;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    sget-object p0, Lapp/todolist/bean/TaskCategory;->COLOR_LIST:Ljava/util/List;

    return-object p0
.end method

.method public static e(Landroid/content/Context;)Ljava/util/List;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const v1, 0x7f06012e

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601b9

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601ba

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601bf

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601c1

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f06017b

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f06016b

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060148

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060131

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0600f8

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0600d1

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0600ba

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060063

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060064

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060066

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060067

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060068

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060069

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f06006b

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0600f7

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f060130

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f06013d

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601d4

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601d2

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601cd

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601c8

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601c6

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601c2

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601bc

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f0601b4

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const v1, 0x7f06018b

    invoke-static {p0, v1}, Landroidx/core/content/ContextCompat;->getColor(Landroid/content/Context;I)I

    move-result p0

    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-object v0
.end method


# virtual methods
.method public b(Landroid/content/Context;Ljava/util/List;)Lapp/todolist/view/ColorPickerView$a;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)",
            "Lapp/todolist/view/ColorPickerView$a;"
        }
    .end annotation

    new-instance v0, Lapp/todolist/view/ColorPickerView$a;

    invoke-direct {v0, p0, p1, p2}, Lapp/todolist/view/ColorPickerView$a;-><init>(Lapp/todolist/view/ColorPickerView;Landroid/content/Context;Ljava/util/List;)V

    return-object v0
.end method

.method public c(Landroid/content/Context;I)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "I)",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p2, v0, :cond_0

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView;->e(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1

    :cond_0
    invoke-static {p1}, Lapp/todolist/view/ColorPickerView;->d(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final f(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 9

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a9

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v0

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    const v2, 0x7f0700ae

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v1

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    const v3, 0x7f0700ad

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimensionPixelOffset(I)I

    move-result v2

    const/4 v3, 0x0

    if-eqz p2, :cond_0

    sget-object v4, Lcom/todo/R$styleable;->ColorPickerView:[I

    invoke-virtual {p1, p2, v4}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    const/4 v4, 0x4

    invoke-virtual {p2, v4, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v4

    const/16 v5, 0x8

    invoke-virtual {p2, v5, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v6

    invoke-virtual {p2, v5, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    const/4 v5, 0x7

    invoke-virtual {p2, v5, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v5

    const/4 v7, 0x2

    invoke-virtual {p2, v7, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v7

    const/4 v8, 0x5

    invoke-virtual {p2, v8, v1}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v1

    const/4 v8, 0x6

    invoke-virtual {p2, v8, v0}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v0

    const/4 v8, 0x1

    invoke-virtual {p2, v8, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    move-result v2

    invoke-virtual {p2, v3, v3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v8

    iput v8, p0, Lapp/todolist/view/ColorPickerView;->c:I

    const/4 v8, 0x3

    invoke-virtual {p2, v8, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v8

    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    move p2, v0

    move v0, v7

    goto :goto_0

    :cond_0
    move p2, v0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v8, 0x0

    :goto_0
    iget v7, p0, Lapp/todolist/view/ColorPickerView;->c:I

    invoke-virtual {p0, p1, v7}, Lapp/todolist/view/ColorPickerView;->c(Landroid/content/Context;I)Ljava/util/List;

    move-result-object v7

    if-eqz v4, :cond_1

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-interface {v7, v3, v4}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_1
    if-nez v5, :cond_2

    new-instance v4, Lapp/todolist/view/layoutmanager/InnerLayoutManager;

    invoke-direct {v4, p1, v3, v3}, Lapp/todolist/view/layoutmanager/InnerLayoutManager;-><init>(Landroid/content/Context;IZ)V

    goto :goto_1

    :cond_2
    new-instance v4, Lapp/todolist/view/layoutmanager/CenterLayoutManager;

    invoke-direct {v4, p1, v3, v3}, Lapp/todolist/view/layoutmanager/CenterLayoutManager;-><init>(Landroid/content/Context;IZ)V

    :goto_1
    invoke-virtual {p0, v4}, Landroidx/recyclerview/widget/RecyclerView;->setLayoutManager(Landroidx/recyclerview/widget/RecyclerView$LayoutManager;)V

    const/4 v3, 0x0

    invoke-virtual {p0, v3}, Landroidx/recyclerview/widget/RecyclerView;->setItemAnimator(Landroidx/recyclerview/widget/RecyclerView$ItemAnimator;)V

    invoke-virtual {p0, p1, v7}, Lapp/todolist/view/ColorPickerView;->b(Landroid/content/Context;Ljava/util/List;)Lapp/todolist/view/ColorPickerView$a;

    move-result-object p1

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, v0}, Lapp/todolist/view/ColorPickerView$a;->k(I)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, v1}, Lapp/todolist/view/ColorPickerView$a;->n(I)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, p2}, Lapp/todolist/view/ColorPickerView$a;->o(I)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, v6}, Lapp/todolist/view/ColorPickerView$a;->p(Z)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, v2}, Lapp/todolist/view/ColorPickerView$a;->j(I)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p1, v8}, Lapp/todolist/view/ColorPickerView$a;->m(Z)V

    iget-object p1, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->setAdapter(Landroidx/recyclerview/widget/RecyclerView$Adapter;)V

    return-void
.end method

.method public getSelectColor()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lapp/todolist/view/ColorPickerView$a;->c()Ljava/lang/Integer;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public setBgColor(I)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lapp/todolist/view/ColorPickerView$a;->h(I)V

    :cond_0
    return-void
.end method

.method public setCorner(I)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lapp/todolist/view/ColorPickerView$a;->k(I)V

    :cond_0
    return-void
.end method

.method public setDefaultColor(Ljava/lang/Integer;)V
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    if-eqz v0, :cond_0

    invoke-virtual {v0, p1}, Lapp/todolist/view/ColorPickerView$a;->l(Ljava/lang/Integer;)I

    move-result p1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView;->b:Lapp/todolist/view/ColorPickerView$a;

    invoke-virtual {v0}, Lapp/todolist/view/ColorPickerView$a;->getItemCount()I

    move-result v0

    if-ge p1, v0, :cond_0

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->smoothScrollToPosition(I)V

    :cond_0
    return-void
.end method

.method public setOnColorSelectListener(Lapp/todolist/view/ColorPickerView$b;)V
    .locals 0

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView;->a:Lapp/todolist/view/ColorPickerView$b;

    return-void
.end method
