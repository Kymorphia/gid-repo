module Gio.ConverterOutputStreamClass;

import Gid.gid;
import Gio.FilterOutputStreamClass;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

class ConverterOutputStreamClass
{
  GConverterOutputStreamClass cInstance;

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gio.ConverterOutputStreamClass");

    cInstance = *cast(GConverterOutputStreamClass*)ptr;

    if (take)
      safeFree(ptr);
  }

  void* cPtr()
  {
    return cast(void*)&cInstance;
  }

  @property FilterOutputStreamClass parentClass()
  {
    return new FilterOutputStreamClass(cast(GFilterOutputStreamClass*)&(cast(GConverterOutputStreamClass*)cPtr).parentClass);
  }
}
