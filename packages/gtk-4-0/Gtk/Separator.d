module Gtk.Separator;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Orientable;
import Gtk.OrientableT;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkSeparator` is a horizontal or vertical separator widget.
 * ![An example GtkSeparator](separator.png)
 * A `GtkSeparator` can be used to group the widgets within a window.
 * It displays a line with a shadow to make it appear sunken into the
 * interface.
 * # CSS nodes
 * `GtkSeparator` has a single CSS node with name separator. The node
 * gets one of the .horizontal or .vertical style classes.
 * # Accessibility
 * `GtkSeparator` uses the %GTK_ACCESSIBLE_ROLE_SEPARATOR role.
 */
class Separator : Widget, Orientable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_separator_get_type != &gidSymbolNotFound ? gtk_separator_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin OrientableT!();

  /**
   * Creates a new `GtkSeparator` with the given orientation.
   * Params:
   *   orientation = the separator’s orientation.
   * Returns: a new `GtkSeparator`.
   */
  this(Orientation orientation)
  {
    GtkWidget* _cretval;
    _cretval = gtk_separator_new(orientation);
    this(_cretval, No.Take);
  }
}
