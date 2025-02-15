module Gtk.MountOperation;

import GObject.ObjectG;
import Gdk.Display;
import Gid.gid;
import Gio.MountOperation : DGioMountOperation = MountOperation;
import Gtk.Types;
import Gtk.Window;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkMountOperation` is an implementation of `GMountOperation`.
 * The functions and objects described here make working with GTK and
 * GIO more convenient.
 * `GtkMountOperation` is needed when mounting volumes:
 * It is an implementation of `GMountOperation` that can be used with
 * GIO functions for mounting volumes such as
 * [Gio.File.mountEnclosingVolume], [Gio.File.mountMountable],
 * [Gio.Volume.mount], [Gio.Mount.unmountWithOperation] and others.
 * When necessary, `GtkMountOperation` shows dialogs to let the user
 * enter passwords, ask questions or show processes blocking unmount.
 */
class MountOperation : DGioMountOperation
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_mount_operation_get_type != &gidSymbolNotFound ? gtk_mount_operation_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkMountOperation`.
   * Params:
   *   parent = transient parent of the window
   * Returns: a new `GtkMountOperation`
   */
  this(Window parent)
  {
    GMountOperation* _cretval;
    _cretval = gtk_mount_operation_new(parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the display on which windows of the `GtkMountOperation`
   * will be shown.
   * Returns: the display on which windows of op are shown
   */
  Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gtk_mount_operation_get_display(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!Display(cast(GdkDisplay*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Gets the transient parent used by the `GtkMountOperation`.
   * Returns: the transient parent for windows shown by op
   */
  Window getParent()
  {
    GtkWindow* _cretval;
    _cretval = gtk_mount_operation_get_parent(cast(GtkMountOperation*)cPtr);
    auto _retval = ObjectG.getDObject!Window(cast(GtkWindow*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns whether the `GtkMountOperation` is currently displaying
   * a window.
   * Returns: %TRUE if op is currently displaying a window
   */
  bool isShowing()
  {
    bool _retval;
    _retval = gtk_mount_operation_is_showing(cast(GtkMountOperation*)cPtr);
    return _retval;
  }

  /**
   * Sets the display to show windows of the `GtkMountOperation` on.
   * Params:
   *   display = a `GdkDisplay`
   */
  void setDisplay(Display display)
  {
    gtk_mount_operation_set_display(cast(GtkMountOperation*)cPtr, display ? cast(GdkDisplay*)display.cPtr(No.Dup) : null);
  }

  /**
   * Sets the transient parent for windows shown by the
   * `GtkMountOperation`.
   * Params:
   *   parent = transient parent of the window
   */
  void setParent(Window parent)
  {
    gtk_mount_operation_set_parent(cast(GtkMountOperation*)cPtr, parent ? cast(GtkWindow*)parent.cPtr(No.Dup) : null);
  }
}
