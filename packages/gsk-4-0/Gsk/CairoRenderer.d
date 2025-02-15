module Gsk.CairoRenderer;

import Gid.gid;
import Gsk.Renderer;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

/**
 * A GSK renderer that is using cairo.
 * Since it is using cairo, this renderer cannot support
 * 3D transformations.
 */
class CairoRenderer : Renderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_cairo_renderer_get_type != &gidSymbolNotFound ? gsk_cairo_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new Cairo renderer.
   * The Cairo renderer is the fallback renderer drawing in ways similar
   * to how GTK 3 drew its content. Its primary use is as comparison tool.
   * The Cairo renderer is incomplete. It cannot render 3D transformed
   * content and will instead render an error marker. Its usage should be
   * avoided.
   * Returns: a new Cairo renderer.
   */
  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_cairo_renderer_new();
    this(_cretval, Yes.Take);
  }
}
