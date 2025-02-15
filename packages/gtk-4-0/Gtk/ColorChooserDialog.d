module Gtk.ColorChooserDialog;

import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ColorChooser;
import Gtk.ColorChooserT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.Dialog;
import Gtk.Native;
import Gtk.NativeT;
import Gtk.Root;
import Gtk.RootT;
import Gtk.ShortcutManager;
import Gtk.ShortcutManagerT;
import Gtk.Types;
import Gtk.Window;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * A dialog for choosing a color.
 * ![An example GtkColorChooserDialog](colorchooser.png)
 * `GtkColorChooserDialog` implements the [Gtk.ColorChooser] interface
 * and does not provide much API of its own.
 * To create a `GtkColorChooserDialog`, use [Gtk.ColorChooserDialog.new_].
 * To change the initially selected color, use
 * [Gtk.ColorChooser.setRgba]. To get the selected color use
 * [Gtk.ColorChooser.getRgba].
 * `GtkColorChooserDialog` has been deprecated in favor of [Gtk.ColorDialog].
 * ## CSS nodes
 * `GtkColorChooserDialog` has a single CSS node with the name `window` and style
 * class `.colorchooser`.

 * Deprecated: Use [Gtk.ColorDialog] instead
 */
class ColorChooserDialog : Dialog, ColorChooser
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_color_chooser_dialog_get_type != &gidSymbolNotFound ? gtk_color_chooser_dialog_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ColorChooserT!();

  /**
   * Creates a new `GtkColorChooserDialog`.
   * Params:
   *   title = Title of the dialog
   *   parent = Transient parent of the dialog
   * Returns: a new `GtkColorChooserDialog`

   * Deprecated: Use [Gtk.ColorDialog] instead
   */
  this(string title, Window parent)
  {
    GtkWidget* _cretval;
    const(char)* _title = title.toCString(No.Alloc);
    _cretval = gtk_color_chooser_dialog_new(_title, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }
}
