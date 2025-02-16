module ArrowFlight.ServerAuthReader;

import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.Bytes;
import GLib.ErrorG;
import GObject.ObjectG;
import Gid.gid;

class ServerAuthReader : ObjectG
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gaflight_server_auth_reader_get_type != &gidSymbolNotFound ? gaflight_server_auth_reader_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Reads a message from the client.
   * Returns: Read data as #GBytes on
   *   success, %NULL on error.
   */
  Bytes read()
  {
    GBytes* _cretval;
    GError *_err;
    _cretval = gaflight_server_auth_reader_read(cast(GAFlightServerAuthReader*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    auto _retval = _cretval ? new Bytes(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }
}
