module Arrow.StringArray;

import Arrow.BinaryArray;
import Arrow.Buffer;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class StringArray : BinaryArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_string_array_get_type != &gidSymbolNotFound ? garrow_string_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer valueOffsets, Buffer valueData, Buffer nullBitmap, long nNulls)
  {
    GArrowStringArray* _cretval;
    _cretval = garrow_string_array_new(length, valueOffsets ? cast(GArrowBuffer*)valueOffsets.cPtr(No.Dup) : null, valueData ? cast(GArrowBuffer*)valueData.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  string getString(long i)
  {
    char* _cretval;
    _cretval = garrow_string_array_get_string(cast(GArrowStringArray*)cPtr, i);
    string _retval = _cretval.fromCString(Yes.Free);
    return _retval;
  }
}
