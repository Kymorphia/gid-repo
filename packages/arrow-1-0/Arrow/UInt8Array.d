module Arrow.UInt8Array;

import Arrow.Buffer;
import Arrow.NumericArray;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import GLib.ErrorG;
import Gid.gid;

class UInt8Array : NumericArray
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_uint8_array_get_type != &gidSymbolNotFound ? garrow_uint8_array_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this(long length, Buffer data, Buffer nullBitmap, long nNulls)
  {
    GArrowUInt8Array* _cretval;
    _cretval = garrow_uint8_array_new(length, data ? cast(GArrowBuffer*)data.cPtr(No.Dup) : null, nullBitmap ? cast(GArrowBuffer*)nullBitmap.cPtr(No.Dup) : null, nNulls);
    this(_cretval, Yes.Take);
  }

  ubyte getValue(long i)
  {
    ubyte _retval;
    _retval = garrow_uint8_array_get_value(cast(GArrowUInt8Array*)cPtr, i);
    return _retval;
  }

  ubyte[] getValues()
  {
    const(ubyte)* _cretval;
    long _cretlength;
    _cretval = garrow_uint8_array_get_values(cast(GArrowUInt8Array*)cPtr, &_cretlength);
    ubyte[] _retval;

    if (_cretval)
    {
      _retval = cast(ubyte[] )_cretval[0 .. _cretlength];
    }
    return _retval;
  }

  ulong sum()
  {
    ulong _retval;
    GError *_err;
    _retval = garrow_uint8_array_sum(cast(GArrowUInt8Array*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
