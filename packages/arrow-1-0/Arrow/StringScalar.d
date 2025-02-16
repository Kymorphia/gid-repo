module Arrow.StringScalar;

import Arrow.BaseBinaryScalar;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringScalar : BaseBinaryScalar
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_scalar_get_type != &gidSymbolNotFound ? garrow_string_scalar_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(Buffer value)
  {
    GArrowStringScalar* _cretval;
    _cretval = garrow_string_scalar_new(value ? cast(GArrowBuffer*)value.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }
}
