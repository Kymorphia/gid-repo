module HarfBuzz.Feature;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * The #hb_feature_t is the structure that holds information about requested
 * feature application. The feature will be applied with the given value to all
 * glyphs which are in clusters between @start $(LPAREN)inclusive$(RPAREN) and @end $(LPAREN)exclusive$(RPAREN).
 * Setting start to #HB_FEATURE_GLOBAL_START and end to #HB_FEATURE_GLOBAL_END
 * specifies that the feature always applies to the entire buffer.
 */
class Feature : Boxed
{

  this()
  {
    super(safeMalloc(hb_feature_t.sizeof), Yes.Take);
  }

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  void* cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())hb_gobject_feature_get_type != &gidSymbolNotFound ? hb_gobject_feature_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property Tag tag()
  {
    return (cast(hb_feature_t*)cPtr).tag;
  }

  @property void tag(Tag propval)
  {
    (cast(hb_feature_t*)cPtr).tag = propval;
  }

  @property uint value()
  {
    return (cast(hb_feature_t*)cPtr).value;
  }

  @property void value(uint propval)
  {
    (cast(hb_feature_t*)cPtr).value = propval;
  }

  @property uint start()
  {
    return (cast(hb_feature_t*)cPtr).start;
  }

  @property void start(uint propval)
  {
    (cast(hb_feature_t*)cPtr).start = propval;
  }

  @property uint end()
  {
    return (cast(hb_feature_t*)cPtr).end;
  }

  @property void end(uint propval)
  {
    (cast(hb_feature_t*)cPtr).end = propval;
  }
}
