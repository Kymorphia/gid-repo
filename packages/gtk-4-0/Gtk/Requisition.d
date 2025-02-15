module Gtk.Requisition;

import GObject.Boxed;
import Gid.gid;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A `GtkRequisition` represents the desired size of a widget. See
 * [GtkWidget’s geometry management section](class.Widget.html#height-for-width-geometry-management) for
 * more information.
 */
class Requisition : Boxed
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_requisition_get_type != &gidSymbolNotFound ? gtk_requisition_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property int width()
  {
    return (cast(GtkRequisition*)cPtr).width;
  }

  @property void width(int propval)
  {
    (cast(GtkRequisition*)cPtr).width = propval;
  }

  @property int height()
  {
    return (cast(GtkRequisition*)cPtr).height;
  }

  @property void height(int propval)
  {
    (cast(GtkRequisition*)cPtr).height = propval;
  }

  /**
   * Allocates a new `GtkRequisition`.
   * The struct is initialized to zero.
   * Returns: a new empty `GtkRequisition`. The newly
   *   allocated `GtkRequisition` should be freed with
   *   [Gtk.Requisition.free]
   */
  this()
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Copies a `GtkRequisition`.
   * Returns: a copy of requisition
   */
  Requisition copy()
  {
    GtkRequisition* _cretval;
    _cretval = gtk_requisition_copy(cast(GtkRequisition*)cPtr);
    auto _retval = _cretval ? new Requisition(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
