module Gio.ZlibCompressor;

import GObject.ObjectG;
import Gid.gid;
import Gio.Converter;
import Gio.ConverterT;
import Gio.FileInfo;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GZlibCompressor` is an implementation of [Gio.Converter] that
 * compresses data using zlib.
 */
class ZlibCompressor : ObjectG, Converter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_zlib_compressor_get_type != &gidSymbolNotFound ? g_zlib_compressor_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ConverterT!();

  /**
   * Creates a new #GZlibCompressor.
   * Params:
   *   format = The format to use for the compressed data
   *   level = compression level $(LPAREN)0-9$(RPAREN), -1 for default
   * Returns: a new #GZlibCompressor
   */
  this(ZlibCompressorFormat format, int level)
  {
    GZlibCompressor* _cretval;
    _cretval = g_zlib_compressor_new(format, level);
    this(_cretval, Yes.Take);
  }

  /**
   * Returns the #GZlibCompressor:file-info property.
   * Returns: a #GFileInfo, or %NULL
   */
  FileInfo getFileInfo()
  {
    GFileInfo* _cretval;
    _cretval = g_zlib_compressor_get_file_info(cast(GZlibCompressor*)cPtr);
    auto _retval = ObjectG.getDObject!FileInfo(cast(GFileInfo*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets file_info in compressor. If non-%NULL, and compressor's
   * #GZlibCompressor:format property is %G_ZLIB_COMPRESSOR_FORMAT_GZIP,
   * it will be used to set the file name and modification time in
   * the GZIP header of the compressed data.
   * Note: it is an error to call this function while a compression is in
   * progress; it may only be called immediately after creation of compressor,
   * or after resetting it with [Gio.Converter.reset].
   * Params:
   *   fileInfo = a #GFileInfo
   */
  void setFileInfo(FileInfo fileInfo)
  {
    g_zlib_compressor_set_file_info(cast(GZlibCompressor*)cPtr, fileInfo ? cast(GFileInfo*)fileInfo.cPtr(No.Dup) : null);
  }
}
