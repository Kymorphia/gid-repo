module Gtk.ListBoxRowClass;

import Gid.gid;
import Gtk.Types;
import Gtk.WidgetClass;
import Gtk.c.functions;
import Gtk.c.types;

class ListBoxRowClass
{
  GtkListBoxRowClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gtk.ListBoxRowClass");

    cInstance = *cast(GtkListBoxRowClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property WidgetClass parentClass()
  {
    return new WidgetClass(cast(GtkWidgetClass*)&(cast(GtkListBoxRowClass*)cPtr).parentClass);
  }

  alias ActivateFuncType = extern(C) void function(GtkListBoxRow* row);

  @property ActivateFuncType activate()
  {
    return (cast(GtkListBoxRowClass*)cPtr).activate;
  }
}
