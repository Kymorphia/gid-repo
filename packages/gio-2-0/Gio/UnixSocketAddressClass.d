module Gio.UnixSocketAddressClass;

import Gid.gid;
import Gio.SocketAddressClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class UnixSocketAddressClass
{
  GUnixSocketAddressClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.UnixSocketAddressClass");

    cInstance = *cast(GUnixSocketAddressClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SocketAddressClass parentClass()
  {
    return new SocketAddressClass(cast(GSocketAddressClass*)&(cast(GUnixSocketAddressClass*)cPtr).parentClass);
  }
}
