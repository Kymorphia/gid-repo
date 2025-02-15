module Gio.NativeSocketAddressClass;

import Gid.gid;
import Gio.SocketAddressClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class NativeSocketAddressClass
{
  GNativeSocketAddressClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.NativeSocketAddressClass");

    cInstance = *cast(GNativeSocketAddressClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SocketAddressClass parentClass()
  {
    return new SocketAddressClass(cast(GSocketAddressClass*)&(cast(GNativeSocketAddressClass*)cPtr).parentClass);
  }
}
