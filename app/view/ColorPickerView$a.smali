.class public Lapp/todolist/view/ColorPickerView$a;
.super Landroidx/recyclerview/widget/RecyclerView$Adapter;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lapp/todolist/view/ColorPickerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "a"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/recyclerview/widget/RecyclerView$Adapter<",
        "Lapp/todolist/view/ColorPickerView$c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public b:Ljava/lang/Integer;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:Z

.field public h:I

.field public i:Z

.field public final synthetic j:Lapp/todolist/view/ColorPickerView;


# direct methods
.method public constructor <init>(Lapp/todolist/view/ColorPickerView;Landroid/content/Context;Ljava/util/List;)V
    .locals 0
    .param p1    # Lapp/todolist/view/ColorPickerView;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->j:Lapp/todolist/view/ColorPickerView;

    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    const/4 p1, 0x0

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    const/4 p1, 0x0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->c:I

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->d:I

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->e:I

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->f:I

    iput-boolean p1, p0, Lapp/todolist/view/ColorPickerView$a;->g:Z

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    invoke-virtual {p0, p3}, Lapp/todolist/view/ColorPickerView$a;->i(Ljava/util/List;)V

    return-void
.end method

.method private synthetic d(Ljava/lang/Integer;Landroid/view/View;)V
    .locals 0

    iget-object p2, p0, Lapp/todolist/view/ColorPickerView$a;->j:Lapp/todolist/view/ColorPickerView;

    invoke-static {p2}, Lapp/todolist/view/ColorPickerView;->a(Lapp/todolist/view/ColorPickerView;)Lapp/todolist/view/ColorPickerView$b;

    move-result-object p2

    if-eqz p2, :cond_0

    iget-object p2, p0, Lapp/todolist/view/ColorPickerView$a;->j:Lapp/todolist/view/ColorPickerView;

    invoke-static {p2}, Lapp/todolist/view/ColorPickerView;->a(Lapp/todolist/view/ColorPickerView;)Lapp/todolist/view/ColorPickerView$b;

    move-result-object p2

    invoke-interface {p2, p1}, Lapp/todolist/view/ColorPickerView$b;->a(Ljava/lang/Integer;)Z

    move-result p2

    goto :goto_0

    :cond_0
    const/4 p2, 0x1

    :goto_0
    if-eqz p2, :cond_1

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_1
    return-void
.end method


# virtual methods
.method public c()Ljava/lang/Integer;
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    return-object v0
.end method

.method public synthetic e(Ljava/lang/Integer;Landroid/view/View;)V
    .locals 0

    invoke-direct {p0, p1, p2}, Lapp/todolist/view/ColorPickerView$a;->d(Ljava/lang/Integer;Landroid/view/View;)V

    return-void
.end method

.method public f(Lapp/todolist/view/ColorPickerView$c;I)V
    .locals 2
    .param p1    # Lapp/todolist/view/ColorPickerView$c;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    invoke-virtual {p0, p2}, Lapp/todolist/view/ColorPickerView$a;->getItemViewType(I)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object p2, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    const/4 v0, 0x0

    const/16 v1, 0x8

    if-nez p2, :cond_0

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->a(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;

    move-result-object p2

    invoke-static {p2, v1}, Le/a/x/m;->B(Landroid/view/View;I)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->b(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;

    move-result-object p2

    invoke-static {p2, v0}, Le/a/x/m;->B(Landroid/view/View;I)V

    goto :goto_0

    :cond_0
    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->b(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;

    move-result-object p2

    invoke-static {p2, v1}, Le/a/x/m;->B(Landroid/view/View;I)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->a(Lapp/todolist/view/ColorPickerView$c;)Landroid/view/View;

    move-result-object p2

    invoke-static {p2, v0}, Le/a/x/m;->B(Landroid/view/View;I)V

    :goto_0
    const/4 p2, 0x0

    goto :goto_1

    :cond_1
    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget v1, p0, Lapp/todolist/view/ColorPickerView$a;->e:I

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setViewPadding(I)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget-boolean v1, p0, Lapp/todolist/view/ColorPickerView$a;->i:Z

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setDrawCircle(Z)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget v1, p0, Lapp/todolist/view/ColorPickerView$a;->f:I

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setSelectGap(I)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget v1, p0, Lapp/todolist/view/ColorPickerView$a;->d:I

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setCorner(I)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget-boolean v1, p0, Lapp/todolist/view/ColorPickerView$a;->g:Z

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setUseDone(Z)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget v1, p0, Lapp/todolist/view/ColorPickerView$a;->c:I

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setBgColor(Ljava/lang/Integer;)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    iget-object v1, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    invoke-virtual {p2, v1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setPicked(Z)V

    invoke-static {p1}, Lapp/todolist/view/ColorPickerView$c;->c(Lapp/todolist/view/ColorPickerView$c;)Lapp/todolist/view/CircleView;

    move-result-object v0

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {v0, v1}, Lapp/todolist/view/CircleView;->setColor(I)V

    :goto_1
    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView$ViewHolder;->itemView:Landroid/view/View;

    new-instance v0, Le/a/y/a;

    invoke-direct {v0, p0, p2}, Le/a/y/a;-><init>(Lapp/todolist/view/ColorPickerView$a;Ljava/lang/Integer;)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public g(Landroid/view/ViewGroup;I)Lapp/todolist/view/ColorPickerView$c;
    .locals 2
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-ne p2, v1, :cond_0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0d0055

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lapp/todolist/view/ColorPickerView$c;

    iget v0, p0, Lapp/todolist/view/ColorPickerView$a;->h:I

    invoke-direct {p2, p1, v0}, Lapp/todolist/view/ColorPickerView$c;-><init>(Landroid/view/View;I)V

    return-object p2

    :cond_0
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const v1, 0x7f0d0054

    invoke-virtual {p2, v1, p1, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    new-instance p2, Lapp/todolist/view/ColorPickerView$c;

    iget v0, p0, Lapp/todolist/view/ColorPickerView$a;->h:I

    invoke-direct {p2, p1, v0}, Lapp/todolist/view/ColorPickerView$c;-><init>(Landroid/view/View;I)V

    return-object p2
.end method

.method public getItemCount()I
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method

.method public getItemViewType(I)I
    .locals 1

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public h(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->c:I

    return-void
.end method

.method public i(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Integer;",
            ">;)V"
        }
    .end annotation

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    return-void
.end method

.method public j(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->h:I

    return-void
.end method

.method public k(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->d:I

    return-void
.end method

.method public l(Ljava/lang/Integer;)I
    .locals 2

    if-nez p1, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    const/4 p1, -0x1

    return p1

    :cond_0
    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1, p1}, Ljava/lang/Integer;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_1

    iput-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$Adapter;->notifyDataSetChanged()V

    :cond_2
    iget-object p1, p0, Lapp/todolist/view/ColorPickerView$a;->a:Ljava/util/List;

    iget-object v0, p0, Lapp/todolist/view/ColorPickerView$a;->b:Ljava/lang/Integer;

    invoke-interface {p1, v0}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public m(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/ColorPickerView$a;->i:Z

    return-void
.end method

.method public n(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->e:I

    return-void
.end method

.method public o(I)V
    .locals 0

    iput p1, p0, Lapp/todolist/view/ColorPickerView$a;->f:I

    return-void
.end method

.method public bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/RecyclerView$ViewHolder;I)V
    .locals 0
    .param p1    # Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    check-cast p1, Lapp/todolist/view/ColorPickerView$c;

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/ColorPickerView$a;->f(Lapp/todolist/view/ColorPickerView$c;I)V

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/RecyclerView$ViewHolder;
    .locals 0
    .param p1    # Landroid/view/ViewGroup;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    invoke-virtual {p0, p1, p2}, Lapp/todolist/view/ColorPickerView$a;->g(Landroid/view/ViewGroup;I)Lapp/todolist/view/ColorPickerView$c;

    move-result-object p1

    return-object p1
.end method

.method public p(Z)V
    .locals 0

    iput-boolean p1, p0, Lapp/todolist/view/ColorPickerView$a;->g:Z

    return-void
.end method
