module HarfBuzz.OtMathGlyphVariant;

import GObject.Boxed;
import Gid.gid;
import HarfBuzz.Types;
import HarfBuzz.c.functions;
import HarfBuzz.c.types;

/**
 * Data type to hold math-variant information for a glyph.
 */
class OtMathGlyphVariant : Boxed
{

  this()
  {
    super(safeMalloc(hb_ot_math_glyph_variant_t.sizeof), Yes.Take);
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
    return cast(void function())hb_gobject_ot_math_glyph_variant_get_type != &gidSymbolNotFound ? hb_gobject_ot_math_glyph_variant_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  @property Codepoint glyph()
  {
    return (cast(hb_ot_math_glyph_variant_t*)cPtr).glyph;
  }

  @property void glyph(Codepoint propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)cPtr).glyph = propval;
  }

  @property Position advance()
  {
    return (cast(hb_ot_math_glyph_variant_t*)cPtr).advance;
  }

  @property void advance(Position propval)
  {
    (cast(hb_ot_math_glyph_variant_t*)cPtr).advance = propval;
  }
}
