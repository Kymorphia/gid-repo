module Gio.ConverterOutputStream;

import GObject.ObjectG;
import Gid.gid;
import Gio.Converter;
import Gio.ConverterT;
import Gio.FilterOutputStream;
import Gio.OutputStream;
import Gio.PollableOutputStream;
import Gio.PollableOutputStreamT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * Converter output stream implements [Gio.OutputStream] and allows
 * conversion of data of various types during reading.
 * As of GLib 2.34, `GConverterOutputStream` implements
 * [Gio.PollableOutputStream].
 */
class ConverterOutputStream : FilterOutputStream, PollableOutputStream
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_converter_output_stream_get_type != &gidSymbolNotFound ? g_converter_output_stream_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin PollableOutputStreamT!();

  /**
   * Creates a new converter output stream for the base_stream.
   * Params:
   *   baseStream = a #GOutputStream
   *   converter = a #GConverter
   * Returns: a new #GOutputStream.
   */
  this(OutputStream baseStream, Converter converter)
  {
    GOutputStream* _cretval;
    _cretval = g_converter_output_stream_new(baseStream ? cast(GOutputStream*)baseStream.cPtr(No.Dup) : null, converter ? cast(GConverter*)(cast(ObjectG)converter).cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the #GConverter that is used by converter_stream.
   * Returns: the converter of the converter output stream
   */
  Converter getConverter()
  {
    GConverter* _cretval;
    _cretval = g_converter_output_stream_get_converter(cast(GConverterOutputStream*)cPtr);
    auto _retval = ObjectG.getDObject!Converter(cast(GConverter*)_cretval, No.Take);
    return _retval;
  }
}
