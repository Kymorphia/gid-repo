module Gtk.StringFilter;

import Gid.gid;
import Gtk.Expression;
import Gtk.Filter;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkStringFilter` determines whether to include items by comparing
 * strings to a fixed search term.
 * The strings are obtained from the items by evaluating a `GtkExpression`
 * set with [Gtk.StringFilter.setExpression], and they are
 * compared against a search term set with [Gtk.StringFilter.setSearch].
 * `GtkStringFilter` has several different modes of comparison - it
 * can match the whole string, just a prefix, or any substring. Use
 * [Gtk.StringFilter.setMatchMode] choose a mode.
 * It is also possible to make case-insensitive comparisons, with
 * [Gtk.StringFilter.setIgnoreCase].
 */
class StringFilter : Filter
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_string_filter_get_type != &gidSymbolNotFound ? gtk_string_filter_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new string filter.
   * You will want to set up the filter by providing a string to search for
   * and by providing a property to look up on the item.
   * Params:
   *   expression = The expression to evaluate
   * Returns: a new `GtkStringFilter`
   */
  this(Expression expression)
  {
    GtkStringFilter* _cretval;
    _cretval = gtk_string_filter_new(expression ? cast(GtkExpression*)expression.cPtr(Yes.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the expression that the string filter uses to
   * obtain strings from items.
   * Returns: a `GtkExpression`
   */
  Expression getExpression()
  {
    GtkExpression* _cretval;
    _cretval = gtk_string_filter_get_expression(cast(GtkStringFilter*)cPtr);
    auto _retval = _cretval ? new Expression(cast(GtkExpression*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
   * Returns whether the filter ignores case differences.
   * Returns: %TRUE if the filter ignores case
   */
  bool getIgnoreCase()
  {
    bool _retval;
    _retval = gtk_string_filter_get_ignore_case(cast(GtkStringFilter*)cPtr);
    return _retval;
  }

  /**
   * Returns the match mode that the filter is using.
   * Returns: the match mode of the filter
   */
  StringFilterMatchMode getMatchMode()
  {
    GtkStringFilterMatchMode _cretval;
    _cretval = gtk_string_filter_get_match_mode(cast(GtkStringFilter*)cPtr);
    StringFilterMatchMode _retval = cast(StringFilterMatchMode)_cretval;
    return _retval;
  }

  /**
   * Gets the search term.
   * Returns: The search term
   */
  string getSearch()
  {
    const(char)* _cretval;
    _cretval = gtk_string_filter_get_search(cast(GtkStringFilter*)cPtr);
    string _retval = _cretval.fromCString(No.Free);
    return _retval;
  }

  /**
   * Sets the expression that the string filter uses to
   * obtain strings from items.
   * The expression must have a value type of %G_TYPE_STRING.
   * Params:
   *   expression = a `GtkExpression`
   */
  void setExpression(Expression expression)
  {
    gtk_string_filter_set_expression(cast(GtkStringFilter*)cPtr, expression ? cast(GtkExpression*)expression.cPtr(No.Dup) : null);
  }

  /**
   * Sets whether the filter ignores case differences.
   * Params:
   *   ignoreCase = %TRUE to ignore case
   */
  void setIgnoreCase(bool ignoreCase)
  {
    gtk_string_filter_set_ignore_case(cast(GtkStringFilter*)cPtr, ignoreCase);
  }

  /**
   * Sets the match mode for the filter.
   * Params:
   *   mode = the new match mode
   */
  void setMatchMode(StringFilterMatchMode mode)
  {
    gtk_string_filter_set_match_mode(cast(GtkStringFilter*)cPtr, mode);
  }

  /**
   * Sets the string to search for.
   * Params:
   *   search = The string to search for
   *     or %NULL to clear the search
   */
  void setSearch(string search)
  {
    const(char)* _search = search.toCString(No.Alloc);
    gtk_string_filter_set_search(cast(GtkStringFilter*)cPtr, _search);
  }
}
