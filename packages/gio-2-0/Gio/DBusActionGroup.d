module Gio.DBusActionGroup;

import GObject.ObjectG;
import Gid.gid;
import Gio.ActionGroup;
import Gio.ActionGroupT;
import Gio.DBusConnection;
import Gio.RemoteActionGroup;
import Gio.RemoteActionGroupT;
import Gio.Types;
import Gio.c.functions;
import Gio.c.types;

/**
 * `GDBusActionGroup` is an implementation of the [Gio.ActionGroup]
 * interface.
 * `GDBusActionGroup` can be used as a proxy for an action group
 * that is exported over D-Bus with [Gio.DBusConnection.exportActionGroup].
 */
class DBusActionGroup : ObjectG, ActionGroup, RemoteActionGroup
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())g_dbus_action_group_get_type != &gidSymbolNotFound ? g_dbus_action_group_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  mixin ActionGroupT!();
  mixin RemoteActionGroupT!();

  /**
   * Obtains a #GDBusActionGroup for the action group which is exported at
   * the given bus_name and object_path.
   * The thread default main context is taken at the time of this call.
   * All signals on the menu model $(LPAREN)and any linked models$(RPAREN) are reported
   * with respect to this context.  All calls on the returned menu model
   * $(LPAREN)and linked models$(RPAREN) must also originate from this same context, with
   * the thread default main context unchanged.
   * This call is non-blocking.  The returned action group may or may not
   * already be filled in.  The correct thing to do is connect the signals
   * for the action group to monitor for changes and then to call
   * [Gio.ActionGroup.listActions] to get the initial list.
   * Params:
   *   connection = A #GDBusConnection
   *   busName = the bus name which exports the action
   *     group or %NULL if connection is not a message bus connection
   *   objectPath = the object path at which the action group is exported
   * Returns: a #GDBusActionGroup
   */
  static DBusActionGroup get(DBusConnection connection, string busName, string objectPath)
  {
    GDBusActionGroup* _cretval;
    const(char)* _busName = busName.toCString(No.Alloc);
    const(char)* _objectPath = objectPath.toCString(No.Alloc);
    _cretval = g_dbus_action_group_get(connection ? cast(GDBusConnection*)connection.cPtr(No.Dup) : null, _busName, _objectPath);
    auto _retval = ObjectG.getDObject!DBusActionGroup(cast(GDBusActionGroup*)_cretval, Yes.Take);
    return _retval;
  }
}
