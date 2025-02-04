module GLib.VariantDict;

import GLib.Types;
import GLib.VariantG;
import GLib.VariantType;
import GLib.c.functions;
import GLib.c.types;
import GObject.Boxed;
import Gid.gid;

/**
 * #GVariantDict is a mutable interface to #GVariant dictionaries.
 * It can be used for doing a sequence of dictionary lookups in an
 * efficient way on an existing #GVariant dictionary or it can be used
 * to construct new dictionaries with a hashtable-like interface.  It
 * can also be used for taking existing dictionaries and modifying them
 * in order to create new ones.
 * #GVariantDict can only be used with %G_VARIANT_TYPE_VARDICT
 * dictionaries.
 * It is possible to use #GVariantDict allocated on the stack or on the
 * heap.  When using a stack-allocated #GVariantDict, you begin with a
 * call to [GLib.VariantDict.init_] and free the resources with a call to
 * [GLib.VariantDict.clear].
 * Heap-allocated #GVariantDict follows normal refcounting rules: you
 * allocate it with [GLib.VariantDict.new_] and use [GLib.VariantDict.ref_]
 * and [GLib.VariantDict.unref].
 * [GLib.VariantDict.end] is used to convert the #GVariantDict back into a
 * dictionary-type #GVariant.  When used with stack-allocated instances,
 * this also implicitly frees all associated memory, but for
 * heap-allocated instances, you must still call [GLib.VariantDict.unref]
 * afterwards.
 * You will typically want to use a heap-allocated #GVariantDict when
 * you expose it as part of an API.  For most other uses, the
 * stack-allocated form will be more convenient.
 * Consider the following two examples that do the same thing in each
 * style: take an existing dictionary and look up the "count" uint32
 * key, adding 1 to it if it is found, or returning an error if the
 * key is not found.  Each returns the new dictionary as a floating
 * #GVariant.
 * ## Using a stack-allocated GVariantDict
 * |[<!-- language\="C" -->
 * GVariant *
 * add_to_count $(LPAREN)GVariant  *orig,
 * GError   **error$(RPAREN)
 * {
 * GVariantDict dict;
 * guint32 count;
 * g_variant_dict_init $(LPAREN)&dict, orig$(RPAREN);
 * if $(LPAREN)!g_variant_dict_lookup $(LPAREN)&dict, "count", "u", &count$(RPAREN)$(RPAREN)
 * {
 * g_set_error $(LPAREN)...$(RPAREN);
 * g_variant_dict_clear $(LPAREN)&dict$(RPAREN);
 * return NULL;
 * }
 * g_variant_dict_insert $(LPAREN)&dict, "count", "u", count + 1$(RPAREN);
 * return g_variant_dict_end $(LPAREN)&dict$(RPAREN);
 * }
 * ]|
 * ## Using heap-allocated GVariantDict
 * |[<!-- language\="C" -->
 * GVariant *
 * add_to_count $(LPAREN)GVariant  *orig,
 * GError   **error$(RPAREN)
 * {
 * GVariantDict *dict;
 * GVariant *result;
 * guint32 count;
 * dict \= g_variant_dict_new $(LPAREN)orig$(RPAREN);
 * if $(LPAREN)g_variant_dict_lookup $(LPAREN)dict, "count", "u", &count$(RPAREN)$(RPAREN)
 * {
 * g_variant_dict_insert $(LPAREN)dict, "count", "u", count + 1$(RPAREN);
 * result \= g_variant_dict_end $(LPAREN)dict$(RPAREN);
 * }
 * else
 * {
 * g_set_error $(LPAREN)...$(RPAREN);
 * result \= NULL;
 * }
 * g_variant_dict_unref $(LPAREN)dict$(RPAREN);
 * return result;
 * }
 * ]|
 */
class VariantDict : Boxed
{

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
    return g_variant_dict_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Allocates and initialises a new #GVariantDict.
   * You should call [GLib.VariantDict.unref] on the return value when it
   * is no longer needed.  The memory will not be automatically freed by
   * any other call.
   * In some cases it may be easier to place a #GVariantDict directly on
   * the stack of the calling function and initialise it with
   * [GLib.VariantDict.init_].  This is particularly useful when you are
   * using #GVariantDict to construct a #GVariant.
   * Params:
   *   fromAsv = the #GVariant with which to initialise the
   *     dictionary
   * Returns: a #GVariantDict
   */
  this(VariantG fromAsv)
  {
    GVariantDict* _cretval;
    _cretval = g_variant_dict_new(fromAsv ? cast(VariantC*)fromAsv.cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Releases all memory associated with a #GVariantDict without freeing
   * the #GVariantDict structure itself.
   * It typically only makes sense to do this on a stack-allocated
   * #GVariantDict if you want to abort building the value part-way
   * through.  This function need not be called if you call
   * [GLib.VariantDict.end] and it also doesn't need to be called on dicts
   * allocated with g_variant_dict_new $(LPAREN)see [GLib.VariantDict.unref] for
   * that$(RPAREN).
   * It is valid to call this function on either an initialised
   * #GVariantDict or one that was previously cleared by an earlier call
   * to [GLib.VariantDict.clear] but it is not valid to call this function
   * on uninitialised memory.
   */
  void clear()
  {
    g_variant_dict_clear(cast(GVariantDict*)cPtr);
  }

  /**
   * Checks if key exists in dict.
   * Params:
   *   key = the key to look up in the dictionary
   * Returns: %TRUE if key is in dict
   */
  bool contains(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_variant_dict_contains(cast(GVariantDict*)cPtr, _key);
    return _retval;
  }

  /**
   * Returns the current value of dict as a #GVariant of type
   * %G_VARIANT_TYPE_VARDICT, clearing it in the process.
   * It is not permissible to use dict in any way after this call except
   * for reference counting operations $(LPAREN)in the case of a heap-allocated
   * #GVariantDict$(RPAREN) or by reinitialising it with [GLib.VariantDict.init_] $(LPAREN)in
   * the case of stack-allocated$(RPAREN).
   * Returns: a new, floating, #GVariant
   */
  VariantG end()
  {
    VariantC* _cretval;
    _cretval = g_variant_dict_end(cast(GVariantDict*)cPtr);
    auto _retval = _cretval ? new VariantG(cast(VariantC*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Inserts $(LPAREN)or replaces$(RPAREN) a key in a #GVariantDict.
   * value is consumed if it is floating.
   * Params:
   *   key = the key to insert a value for
   *   value = the value to insert
   */
  void insertValue(string key, VariantG value)
  {
    const(char)* _key = key.toCString(No.Alloc);
    g_variant_dict_insert_value(cast(GVariantDict*)cPtr, _key, value ? cast(VariantC*)value.cPtr(No.Dup) : null);
  }

  /**
   * Looks up a value in a #GVariantDict.
   * If key is not found in dictionary, %NULL is returned.
   * The expected_type string specifies what type of value is expected.
   * If the value associated with key has a different type then %NULL is
   * returned.
   * If the key is found and the value has the correct type, it is
   * returned.  If expected_type was specified then any non-%NULL return
   * value will have this type.
   * Params:
   *   key = the key to look up in the dictionary
   *   expectedType = a #GVariantType, or %NULL
   * Returns: the value of the dictionary key, or %NULL
   */
  VariantG lookupValue(string key, VariantType expectedType)
  {
    VariantC* _cretval;
    const(char)* _key = key.toCString(No.Alloc);
    _cretval = g_variant_dict_lookup_value(cast(GVariantDict*)cPtr, _key, expectedType ? cast(GVariantType*)expectedType.cPtr(No.Dup) : null);
    auto _retval = _cretval ? new VariantG(cast(VariantC*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Removes a key and its associated value from a #GVariantDict.
   * Params:
   *   key = the key to remove
   * Returns: %TRUE if the key was found and removed
   */
  bool remove(string key)
  {
    bool _retval;
    const(char)* _key = key.toCString(No.Alloc);
    _retval = g_variant_dict_remove(cast(GVariantDict*)cPtr, _key);
    return _retval;
  }
}
