module Gtk.Orientable;

public import Gtk.OrientableIfaceProxy;
import Gid.gid;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * The `GtkOrientable` interface is implemented by all widgets that can be
 * oriented horizontally or vertically.
 * `GtkOrientable` is more flexible in that it allows the orientation to be
 * changed at runtime, allowing the widgets to “flip”.
 * ## CSS nodes
 * `GtkWidget` types implementing the `GtkOrientable` interface will
 * automatically acquire the `horizontal` or `vertical` CSS class depending on
 * the value of the [Gtk.Orientable.orientation] property.
 */
interface Orientable
{

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_orientable_get_type != &gidSymbolNotFound ? gtk_orientable_get_type() : cast(GType)0;
  }

  /**
   * Retrieves the orientation of the orientable.
   * Returns: the orientation of the orientable
   */
  Orientation getOrientation();

  /**
   * Sets the orientation of the orientable.
   * Params:
   *   orientation = the orientable’s new orientation
   */
  void setOrientation(Orientation orientation);
}
