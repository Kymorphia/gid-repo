module Gio.DtlsClientConnectionIfaceProxy;

import GObject.ObjectG;
import Gio.DtlsClientConnection;
import Gio.DtlsClientConnectionT;

/// Proxy object for Gio.DtlsClientConnection interface when a GObject has no applicable D binding
class DtlsClientConnectionIfaceProxy : IfaceProxy, DtlsClientConnection
{
  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  override TypeInfo_Interface getIface()
  {
    return typeid(DtlsClientConnection);
  }

  mixin DtlsClientConnectionT!();
}
