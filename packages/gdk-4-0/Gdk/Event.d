module Gdk.Event;

import GObject.ObjectG;
import Gdk.Device;
import Gdk.DeviceTool;
import Gdk.Display;
import Gdk.EventSequence;
import Gdk.Seat;
import Gdk.Surface;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;

/**
 * `GdkEvent`s are immutable data structures, created by GDK to
 * represent windowing system events.
 * In GTK applications the events are handled automatically by toplevel
 * widgets and passed on to the event controllers of appropriate widgets,
 * so using `GdkEvent` and its related API is rarely needed.
 */
class Event
{
  GdkEvent* cInstancePtr;

  this(void* ptr, bool ownedRef = false)
  {
    if (!ptr)
      throw new GidConstructException("Null instance pointer for Gdk.Event");

    cInstancePtr = cast(GdkEvent*)ptr;

    if (!ownedRef)
      gdk_event_ref(cInstancePtr);
  }

  ~this()
  {
    gdk_event_unref(cInstancePtr);
  }


  void* cPtr(bool addRef = false)
  {
    if (addRef)
      gdk_event_ref(cInstancePtr);

    return cInstancePtr;
  }

  /**
   * Extracts all axis values from an event.
   * To find out which axes are used, use [Gdk.DeviceTool.getAxes]
   * on the device tool returned by [Gdk.Event.getDeviceTool].
   * Params:
   *   axes = the array of values for all axes
   * Returns: %TRUE on success, otherwise %FALSE
   */
  bool getAxes(out double[] axes)
  {
    bool _retval;
    uint _nAxes;
    double* _axes;
    _retval = gdk_event_get_axes(cast(GdkEvent*)cPtr, &_axes, &_nAxes);
    axes.length = _nAxes;
    axes[0 .. $] = _axes[0 .. _nAxes];
    return _retval;
  }

  /**
   * Extract the axis value for a particular axis use from
   * an event structure.
   * To find out which axes are used, use [Gdk.DeviceTool.getAxes]
   * on the device tool returned by [Gdk.Event.getDeviceTool].
   * Params:
   *   axisUse = the axis use to look for
   *   value = location to store the value found
   * Returns: %TRUE if the specified axis was found, otherwise %FALSE
   */
  bool getAxis(AxisUse axisUse, out double value)
  {
    bool _retval;
    _retval = gdk_event_get_axis(cast(GdkEvent*)cPtr, axisUse, cast(double*)&value);
    return _retval;
  }

  /**
   * Returns the device of an event.
   * Returns: a `GdkDevice`
   */
  Device getDevice()
  {
    GdkDevice* _cretval;
    _cretval = gdk_event_get_device(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? ObjectG.getDObject!Device(cast(GdkDevice*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Returns a `GdkDeviceTool` representing the tool that
   * caused the event.
   * If the was not generated by a device that supports
   * different tools $(LPAREN)such as a tablet$(RPAREN), this function will
   * return %NULL.
   * Note: the `GdkDeviceTool` will be constant during
   * the application lifetime, if settings must be stored
   * persistently across runs, see [Gdk.DeviceTool.getSerial].
   * Returns: The current device tool
   */
  DeviceTool getDeviceTool()
  {
    GdkDeviceTool* _cretval;
    _cretval = gdk_event_get_device_tool(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? ObjectG.getDObject!DeviceTool(cast(GdkDeviceTool*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Retrieves the display associated to the event.
   * Returns: a `GdkDisplay`
   */
  Display getDisplay()
  {
    GdkDisplay* _cretval;
    _cretval = gdk_event_get_display(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? ObjectG.getDObject!Display(cast(GdkDisplay*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Returns the event sequence to which the event belongs.
   * Related touch events are connected in a sequence. Other
   * events typically don't have event sequence information.
   * Returns: the event sequence that the event belongs to
   */
  EventSequence getEventSequence()
  {
    GdkEventSequence* _cretval;
    _cretval = gdk_event_get_event_sequence(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? new EventSequence(cast(void*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Retrieves the type of the event.
   * Returns: a `GdkEvent`Type
   */
  EventType getEventType()
  {
    GdkEventType _cretval;
    _cretval = gdk_event_get_event_type(cast(GdkEvent*)cPtr);
    EventType _retval = cast(EventType)_cretval;
    return _retval;
  }

  /**
   * Retrieves the history of the device that event is for, as a list of
   * time and coordinates.
   * The history includes positions that are not delivered as separate events
   * to the application because they occurred in the same frame as event.
   * Note that only motion and scroll events record history, and motion
   * events do it only if one of the mouse buttons is down, or the device
   * has a tool.
   * Returns: an
   *   array of time and coordinates
   */
  TimeCoord[] getHistory()
  {
    GdkTimeCoord* _cretval;
    uint _cretlength;
    _cretval = gdk_event_get_history(cast(GdkEvent*)cPtr, &_cretlength);
    TimeCoord[] _retval;

    if (_cretval)
    {
      _retval = new TimeCoord[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i];
    }
    return _retval;
  }

  /**
   * Returns the modifier state field of an event.
   * Returns: the modifier state of event
   */
  ModifierType getModifierState()
  {
    GdkModifierType _cretval;
    _cretval = gdk_event_get_modifier_state(cast(GdkEvent*)cPtr);
    ModifierType _retval = cast(ModifierType)_cretval;
    return _retval;
  }

  /**
   * Returns whether this event is an 'emulated' pointer event.
   * Emulated pointer events typically originate from a touch events.
   * Returns: %TRUE if this event is emulated
   */
  bool getPointerEmulated()
  {
    bool _retval;
    _retval = gdk_event_get_pointer_emulated(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
   * Extract the event surface relative x/y coordinates from an event.
   * This position is in [surface coordinates](coordinates.html).
   * Params:
   *   x = location to put event surface x coordinate
   *   y = location to put event surface y coordinate
   * Returns:
   */
  bool getPosition(out double x, out double y)
  {
    bool _retval;
    _retval = gdk_event_get_position(cast(GdkEvent*)cPtr, cast(double*)&x, cast(double*)&y);
    return _retval;
  }

  /**
   * Returns the seat that originated the event.
   * Returns: a `GdkSeat`.
   */
  Seat getSeat()
  {
    GdkSeat* _cretval;
    _cretval = gdk_event_get_seat(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? ObjectG.getDObject!Seat(cast(GdkSeat*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Extracts the surface associated with an event.
   * Returns: The `GdkSurface` associated with the event
   */
  Surface getSurface()
  {
    GdkSurface* _cretval;
    _cretval = gdk_event_get_surface(cast(GdkEvent*)cPtr);
    auto _retval = _cretval ? ObjectG.getDObject!Surface(cast(GdkSurface*)_cretval, false) : null;
    return _retval;
  }

  /**
   * Returns the timestamp of event.
   * Not all events have timestamps. In that case, this function
   * returns %GDK_CURRENT_TIME.
   * Returns: timestamp field from event
   */
  uint getTime()
  {
    uint _retval;
    _retval = gdk_event_get_time(cast(GdkEvent*)cPtr);
    return _retval;
  }

  /**
   * Returns whether a `GdkEvent` should trigger a context menu,
   * according to platform conventions.
   * The right mouse button typically triggers context menus.
   * This function should always be used instead of simply checking for
   * event->button \=\= %GDK_BUTTON_SECONDARY.
   * Returns: %TRUE if the event should trigger a context menu.
   */
  bool triggersContextMenu()
  {
    bool _retval;
    _retval = gdk_event_triggers_context_menu(cast(GdkEvent*)cPtr);
    return _retval;
  }
}
