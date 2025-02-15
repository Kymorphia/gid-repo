module Gio.DBusErrorEntry;

import Gid.gid;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Struct used in [Gio.Global.dbusErrorRegisterErrorDomain].
 */
class DBusErrorEntry
{
  GDBusErrorEntry cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.DBusErrorEntry");

    cInstance = *cast(GDBusErrorEntry*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property int errorCode()
  {
    return (cast(GDBusErrorEntry*)cPtr).errorCode;
  }

  @property void errorCode(int propval)
  {
    (cast(GDBusErrorEntry*)cPtr).errorCode = propval;
  }

  @property string dbusErrorName()
  {
    return (cast(GDBusErrorEntry*)cPtr).dbusErrorName.fromCString(No.Free);
  }

  @property void dbusErrorName(string propval)
  {
    safeFree(cast(void*)(cast(GDBusErrorEntry*)cPtr).dbusErrorName);
    (cast(GDBusErrorEntry*)cPtr).dbusErrorName = propval.toCString(Yes.Alloc);
  }
}
