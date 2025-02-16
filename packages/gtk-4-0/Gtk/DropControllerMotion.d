module Gtk.DropControllerMotion;

import GObject.DClosure;
import GObject.ObjectG;
import Gdk.Drop;
import Gid.gid;
import Gtk.EventController;
import Gtk.Types;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkDropControllerMotion` is an event controller tracking
 * the pointer during Drag-and-Drop operations.
 * It is modeled after [Gtk.EventControllerMotion] so if you
 * have used that, this should feel really familiar.
 * This controller is not able to accept drops, use [Gtk.DropTarget]
 * for that purpose.
 */
class DropControllerMotion : EventController
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_drop_controller_motion_get_type != &gidSymbolNotFound ? gtk_drop_controller_motion_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new event controller that will handle pointer motion
   * events during drag and drop.
   * Returns: a new `GtkDropControllerMotion`
   */
  this()
  {
    GtkEventController* _cretval;
    _cretval = gtk_drop_controller_motion_new();
    this(_cretval, Yes.Take);
  }

  /**
   * Returns if a Drag-and-Drop operation is within the widget
   * self or one of its children.
   * Returns: %TRUE if a dragging pointer is within self or one of its children.
   */
  bool containsPointer()
  {
    bool _retval;
    _retval = gtk_drop_controller_motion_contains_pointer(cast(GtkDropControllerMotion*)cPtr);
    return _retval;
  }

  /**
   * Returns the `GdkDrop` of a current Drag-and-Drop operation
   * over the widget of self.
   * Returns: The `GdkDrop` currently
   *   happening within self
   */
  Drop getDrop()
  {
    GdkDrop* _cretval;
    _cretval = gtk_drop_controller_motion_get_drop(cast(GtkDropControllerMotion*)cPtr);
    auto _retval = ObjectG.getDObject!Drop(cast(GdkDrop*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Returns if a Drag-and-Drop operation is within the widget
   * self, not one of its children.
   * Returns: %TRUE if a dragging pointer is within self but
   *   not one of its children
   */
  bool isPointer()
  {
    bool _retval;
    _retval = gtk_drop_controller_motion_is_pointer(cast(GtkDropControllerMotion*)cPtr);
    return _retval;
  }

  /**
   * Signals that the pointer has entered the widget.
   * Params
   *   x = coordinates of pointer location
   *   y = coordinates of pointer location
   *   dropControllerMotion = the instance the signal is connected to
   */
  alias EnterCallbackDlg = void delegate(double x, double y, DropControllerMotion dropControllerMotion);
  alias EnterCallbackFunc = void function(double x, double y, DropControllerMotion dropControllerMotion);

  /**
   * Connect to Enter signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectEnter(T)(T callback, Flag!"After" after = No.After)
  if (is(T : EnterCallbackDlg) || is(T : EnterCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropControllerMotion = getVal!DropControllerMotion(_paramVals);
      auto x = getVal!double(&_paramVals[1]);
      auto y = getVal!double(&_paramVals[2]);
      _dClosure.dlg(x, y, dropControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("enter", closure, after);
  }

  /**
   * Signals that the pointer has left the widget.
   *   dropControllerMotion = the instance the signal is connected to
   */
  alias LeaveCallbackDlg = void delegate(DropControllerMotion dropControllerMotion);
  alias LeaveCallbackFunc = void function(DropControllerMotion dropControllerMotion);

  /**
   * Connect to Leave signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectLeave(T)(T callback, Flag!"After" after = No.After)
  if (is(T : LeaveCallbackDlg) || is(T : LeaveCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 1, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropControllerMotion = getVal!DropControllerMotion(_paramVals);
      _dClosure.dlg(dropControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("leave", closure, after);
  }

  /**
   * Emitted when the pointer moves inside the widget.
   * Params
   *   x = the x coordinate
   *   y = the y coordinate
   *   dropControllerMotion = the instance the signal is connected to
   */
  alias MotionCallbackDlg = void delegate(double x, double y, DropControllerMotion dropControllerMotion);
  alias MotionCallbackFunc = void function(double x, double y, DropControllerMotion dropControllerMotion);

  /**
   * Connect to Motion signal.
   * Params:
   *   callback = signal callback delegate or function to connect
   *   after = Yes.After to execute callback after default handler, No.After to execute before (default)
   * Returns: Signal ID
   */
  ulong connectMotion(T)(T callback, Flag!"After" after = No.After)
  if (is(T : MotionCallbackDlg) || is(T : MotionCallbackFunc))
  {
    extern(C) void _cmarshal(GClosure* _closure, GValue* _returnValue, uint _nParams, const(GValue)* _paramVals, void* _invocHint, void* _marshalData)
    {
      assert(_nParams == 3, "Unexpected number of signal parameters");
      auto _dClosure = cast(DGClosure!T*)_closure;
      auto dropControllerMotion = getVal!DropControllerMotion(_paramVals);
      auto x = getVal!double(&_paramVals[1]);
      auto y = getVal!double(&_paramVals[2]);
      _dClosure.dlg(x, y, dropControllerMotion);
    }

    auto closure = new DClosure(callback, &_cmarshal);
    return connectSignalClosure("motion", closure, after);
  }
}
