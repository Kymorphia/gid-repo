module Gtk.MediaControls;

import GObject.ObjectG;
import Gid.gid;
import Gtk.Accessible;
import Gtk.AccessibleT;
import Gtk.Buildable;
import Gtk.BuildableT;
import Gtk.ConstraintTarget;
import Gtk.ConstraintTargetT;
import Gtk.MediaStream;
import Gtk.Types;
import Gtk.Widget;
import Gtk.c.functions;
import Gtk.c.types;

/**
 * `GtkMediaControls` is a widget to show controls for a video.
 * ![An example GtkMediaControls](media-controls.png)
 * Usually, `GtkMediaControls` is used as part of [Gtk.Video].
 */
class MediaControls : Widget
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_media_controls_get_type != &gidSymbolNotFound ? gtk_media_controls_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GtkMediaControls` managing the stream passed to it.
   * Params:
   *   stream = a `GtkMediaStream` to manage
   * Returns: a new `GtkMediaControls`
   */
  this(MediaStream stream)
  {
    GtkWidget* _cretval;
    _cretval = gtk_media_controls_new(stream ? cast(GtkMediaStream*)stream.cPtr(No.Dup) : null);
    this(_cretval, No.Take);
  }

  /**
   * Gets the media stream managed by controls or %NULL if none.
   * Returns: The media stream managed by controls
   */
  MediaStream getMediaStream()
  {
    GtkMediaStream* _cretval;
    _cretval = gtk_media_controls_get_media_stream(cast(GtkMediaControls*)cPtr);
    auto _retval = ObjectG.getDObject!MediaStream(cast(GtkMediaStream*)_cretval, No.Take);
    return _retval;
  }

  /**
   * Sets the stream that is controlled by controls.
   * Params:
   *   stream = a `GtkMediaStream`
   */
  void setMediaStream(MediaStream stream)
  {
    gtk_media_controls_set_media_stream(cast(GtkMediaControls*)cPtr, stream ? cast(GtkMediaStream*)stream.cPtr(No.Dup) : null);
  }
}
