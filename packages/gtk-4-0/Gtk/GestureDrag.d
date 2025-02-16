module Gtk.GestureDrag;

import GObject.DClosure;
import Gid.gid;
import Gtk.GestureSingle;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkGestureDrag` is a `GtkGesture` implementation for drags.
 * The drag operation itself can be tracked throughout the
 * signal@Gtk.GestureDrag::drag-begin,
 * signal@Gtk.GestureDrag::drag-update and
 * signal@Gtk.GestureDrag::drag-end signals, and the relevant
 * coordinates can be extracted through
 * [Gtk.GestureDrag.getOffset] and
 * [Gtk.GestureDrag.getStartPoint].
 */
class GestureDrag : GestureSingle
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_gesture_drag_get_type != &gidSymbolNotFound ? gtk_gesture_drag_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Returns a newly created `GtkGesture` that recognizes drags.
   * Returns: a newly created `GtkGestureDrag`
   */
  this()
  {
    GtkGesture* _cretval;
    _cretval = gtk_gesture_drag_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Gets the offset from the start point.
   * If the gesture is active, this function returns %TRUE and
   * fills in x and y with the coordinates of the current point,
   * as an offset to the starting drag point.
   * Params:
   *   x = X offset for the current point
   *   y = Y offset for the current point
   * Returns: %TRUE if the gesture is active
   */
  bool getOffset(out double x, out double y)
  {
    bool _retval;
    _retval = gtk_gesture_drag_get_offset(cast(GtkGestureDrag*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
   * Gets the point where the drag started.
   * If the gesture is active, this function returns %TRUE
   * and fills in x and y with the drag start coordinates,
   * in widget-relative coordinates.
   * Params:
   *   x = X coordinate for the drag start point
   *   y = Y coordinate for the drag start point
   * Returns: %TRUE if the gesture is active
   */
  bool getStartPoint(out double x, out double y)
  {
    bool _retval;
    _retval = gtk_gesture_drag_get_start_point(cast(GtkGestureDrag*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
   * Emitted whenever dragging starts.
   * Params
   *   startX = X coordinate, relative to the widget allocation
   *   startY = Y coordinate, relative to the widget allocation
   *   gestureDrag = the instance the signal is connected to
   */
  alias DragBeginCallbackDlg = void delegate(double startX, double startY, GestureDrag gestureDrag);
  alias DragBeginCallbackFunc = void function(double startX, double startY, GestureDrag gestureDrag);

  /**
   * Connect to DragBegin signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragBegin(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragBeginCallbackDlg) || is(T : DragBeginCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!GestureDrag(_paramVals);
      auto startX = getVal!double(&_paramVals[1]);
      auto startY = getVal!double(&_paramVals[2]);
      _dClosure.dlg(startX, startY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-begin", closure, after);
  }

  /**
   * Emitted whenever the dragging is finished.
   * Params
   *   offsetX = X offset, relative to the start point
   *   offsetY = Y offset, relative to the start point
   *   gestureDrag = the instance the signal is connected to
   */
  alias DragEndCallbackDlg = void delegate(double offsetX, double offsetY, GestureDrag gestureDrag);
  alias DragEndCallbackFunc = void function(double offsetX, double offsetY, GestureDrag gestureDrag);

  /**
   * Connect to DragEnd signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragEnd(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragEndCallbackDlg) || is(T : DragEndCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!GestureDrag(_paramVals);
      auto offsetX = getVal!double(&_paramVals[1]);
      auto offsetY = getVal!double(&_paramVals[2]);
      _dClosure.dlg(offsetX, offsetY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-end", closure, after);
  }

  /**
   * Emitted whenever the dragging point moves.
   * Params
   *   offsetX = X offset, relative to the start point
   *   offsetY = Y offset, relative to the start point
   *   gestureDrag = the instance the signal is connected to
   */
  alias DragUpdateCallbackDlg = void delegate(double offsetX, double offsetY, GestureDrag gestureDrag);
  alias DragUpdateCallbackFunc = void function(double offsetX, double offsetY, GestureDrag gestureDrag);

  /**
   * Connect to DragUpdate signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectDragUpdate(T)(T callback, Flag!"After" after = No.After)
  if (is(T : DragUpdateCallbackDlg) || is(T : DragUpdateCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto gestureDrag = getVal!GestureDrag(_paramVals);
      auto offsetX = getVal!double(&_paramVals[1]);
      auto offsetY = getVal!double(&_paramVals[2]);
      _dClosure.dlg(offsetX, offsetY, gestureDrag);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("drag-update", closure, after);
  }
}
