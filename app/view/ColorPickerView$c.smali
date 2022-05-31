.class public Lapp/todolist/view/ColorPickerView$c;
.super Landroidx/recyclerview/widget/RecyclerView$ViewHolder;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/todolist/view/ColorPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Lapp/todolist/view/CircleView;

.field public b:Landroid/view/View;

.field public c:Landroid/view/View;


# direct methods
.method public constructor <init>(Landroid/view/View;I)V
    .locals 1
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;-><init>(Landroid/view/View;)V

    const v0, 0x7f0a02bd

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/ColorPickerView$c;->b:Landroid/view/View;

    const v0, 0x7f0a02be

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    iput-object v0, p0, Lapp/todolist/view/ColorPickerView$c;->c:Landroid/view/View;

    const v0, 0x7f0a00fc

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lapp/todolist/view/CircleView;

    iput-object v0, p0, Lapp/todolist/view/ColorPickerView$c;->a:Lapp/todolist/view/CircleView;

    if-lez p2, :cond_1

    if-eqz v0, :cond_0

    move-object p1, v0

    :cond_0
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    iput p2, v0, Landroid/view/ViewGroup$LayoutParams;->width:I

    invoke-virtual {p1}, Landroid/view/View;->requestLayout()V

    :cond_1
    return-void
.end method

.method public static synthetic a(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lapp/todolist/view/ColorPickerView$c;->c:Landroid/view/View;

    return-object p0
.end method

.method public static synthetic b(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;
    .locals 0

    iget-object p0, p0, Lapp/todolist/view/ColorPickerView$c;->b:Landroid/view/View;

    return-object p0
.end method

.method public static synthetic c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;
    .locals 0

    iget-object p0, p0, Lapp/todolist/view/ColorPickerView$c;->a:Lapp/todolist/view/CircleView;

    return-object p0
.end method
