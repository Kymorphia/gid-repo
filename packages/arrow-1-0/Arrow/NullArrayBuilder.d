module Arrow.NullArrayBuilder;

import Arrow.ArrayBuilder;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NullArrayBuilder : ArrayBuilder
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_null_array_builder_get_type != &gidSymbolNotFound ? garrow_null_array_builder_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GArrowNullArrayBuilder* _cretval;
    _cretval = garrow_null_array_builder_new();
    this(_cretval, Yes.Take);
  }
}
