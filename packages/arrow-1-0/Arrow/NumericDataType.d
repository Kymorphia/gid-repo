module Arrow.NumericDataType;

import Arrow.FixedWidthDataType;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class NumericDataType : FixedWidthDataType
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_numeric_data_type_get_type != &gidSymbolNotFound ? garrow_numeric_data_type_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
