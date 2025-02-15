module Gtk.MultiSorter;

import Gid.gid;
import Gio.ListModel;
import Gio.ListModelT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.Sorter;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkMultiSorter` combines multiple sorters by trying them
 * in turn.
 * If the first sorter compares two items as equal,
 * the second is tried next, and so on.
 */
class MultiSorter : Sorter, ListModel, Buildable
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_multi_sorter_get_type != &gidSymbolNotFound ? gtk_multi_sorter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ListModelT!();
  mixin BuildableT!();

  /**
   * Creates a new multi sorter.
   * This sorter compares items by trying each of the sorters
   * in turn, until one returns non-zero. In particular, if
   * no sorter has been added to it, it will always compare
   * items as equal.
   * Returns: a new `GtkMultiSorter`
   */
  this()
  {
    GtkMultiSorter* _cretval;
    _cretval = gtk_multi_sorter_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Add sorter to self to use for sorting at the end.
   * self will consult all existing sorters before it will
   * sort with the given sorter.
   * Params:
   *   sorter = a sorter to add
   */
  void append(Sorter sorter)
  {
    gtk_multi_sorter_append(cast(GtkMultiSorter*)cPtr, sorter ? cast(GtkSorter*)sorter.cPtr(Yes.Dup) : null);
  }

  /**
   * Removes the sorter at the given position from the list of sorter
   * used by self.
   * If position is larger than the number of sorters, nothing happens.
   * Params:
   *   position = position of sorter to remove
   */
  void remove(uint position)
  {
    gtk_multi_sorter_remove(cast(GtkMultiSorter*)cPtr, position);
  }
}
