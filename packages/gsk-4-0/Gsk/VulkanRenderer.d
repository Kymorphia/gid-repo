module Gsk.VulkanRenderer;

import Gid.gid;
import Gsk.Renderer;
import Gsk.Types;
import Gsk.c.functions;
import Gsk.c.types;

/**
 * A GSK renderer that is using Vulkan.
 * This renderer will fail to realize if Vulkan is not supported.
 */
class VulkanRenderer : Renderer
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gsk_vulkan_renderer_get_type != &gidSymbolNotFound ? gsk_vulkan_renderer_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  this()
  {
    GskRenderer* _cretval;
    _cretval = gsk_vulkan_renderer_new();
    this(_cretval, Yes.Take);
  }
}
