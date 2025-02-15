module Gio.ConverterInputStream;

import GObject.ObjectG;
import Gid.gid;
import Gio.Converter;
import Gio.ConverterT;
import Gio.FilterInputStream;
import Gio.InputStream;
import Gio.PollableInputStream;
import Gio.PollableInputStreamT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Converter input stream implements [Gio.InputStream] and allows
 * conversion of data of various types during reading.
 * As of GLib 2.34, `GConverterInputStream` implements
 * [Gio.PollableInputStream].
 */
class ConverterInputStream : FilterInputStream, PollableInputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_converter_input_stream_get_type != &gidSymbolNotFound ? g_converter_input_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableInputStreamT!();

  /**
   * Creates a new converter input stream for the base_stream.
   * Params:
   *   baseStream = a #GInputStream
   *   converter = a #GConverter
   * Returns: a new #GInputStream.
   */
  this(InputStream baseStream, Converter converter)
  {
    GInputStream* _cretval;
    _cretval = g_converter_input_stream_new(baseStream ? cast(GInputStream*)baseStream.cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(ObjectG)converter).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the #GConverter that is used by converter_stream.
   * Returns: the converter of the converter input stream
   */
  Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_input_stream_get_converter(cast(GConverterInputStream*)cPtr);
    auto _retval = ObjectG.getDObject!Converter(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}
