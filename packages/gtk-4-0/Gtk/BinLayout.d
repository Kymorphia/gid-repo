module Gtk.BinLayout;

import Gid.gid;
import Gtk.LayoutManager;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkBinLayout` is a `GtkLayoutManager` subclass useful for create "bins" of
 * widgets.
 * `GtkBinLayout` will stack each child of a widget on top of each other,
 * using the [Gtk.Widget.hexpand], [Gtk.Widget.vexpand],
 * [Gtk.Widget.halign], and [Gtk.Widget.valign] properties
 * of each child to determine where they should be positioned.
 */
class BinLayout : LayoutManager
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_bin_layout_get_type != &gidSymbolNotFound ? gtk_bin_layout_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkBinLayout` instance.
   * Returns: the newly created `GtkBinLayout`
   */
  this()
  {
    GtkLayoutManager* _cretval;
    _cretval = gtk_bin_layout_new();
    this(_cretval, Yes.Take);
  }
}
