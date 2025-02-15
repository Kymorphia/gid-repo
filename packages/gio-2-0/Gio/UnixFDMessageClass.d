module Gio.UnixFDMessageClass;

import Gid.gid;
import Gio.SocketControlMessageClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class UnixFDMessageClass
{
  GUnixFDMessageClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.UnixFDMessageClass");

    cInstance = *cast(GUnixFDMessageClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property SocketControlMessageClass parentClass()
  {
    return new SocketControlMessageClass(cast(GSocketControlMessageClass*)&(cast(GUnixFDMessageClass*)cPtr).parentClass);
  }
}
