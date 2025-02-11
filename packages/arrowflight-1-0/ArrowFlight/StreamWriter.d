module ArrowFlight.StreamWriter;

import ArrowFlight.RecordBatchWriter;
import ArrowFlight.Types;
import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import GLib.ErrorG;
import Gid.gid;

class StreamWriter : RecordBatchWriter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    return gaflight_stream_writer_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  bool doneWriting()
  {
    bool _retval;
    GError *_err;
    _retval = gaflight_stream_writer_done_writing(cast(GAFlightStreamWriter*)cPtr, &_err);
    if (_err)
      throw new ErrorG(_err);
    return _retval;
  }
}
