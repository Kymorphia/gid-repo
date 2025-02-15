module Gsk.BroadwayRenderer;

import Gid.gid;
import Gsk.Renderer;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

class BroadwayRenderer : Renderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_broadway_renderer_get_type != &gidSymbolNotFound ? gsk_broadway_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new Broadway renderer.
   * The Broadway renderer is the default renderer for the broadway backend.
   * It will only work with broadway surfaces, otherwise it will fail the
   * call to [Gsk.Renderer.realize].
   * This function is only available when GTK was compiled with Broadway
   * support.
   * Returns: a new Broadway renderer.
   */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_broadway_renderer_new();
    this(_cretval, Yes.Take);
  }
}
