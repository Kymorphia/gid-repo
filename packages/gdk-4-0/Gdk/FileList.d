module Gdk.FileList;

import GObject.Boxed;
import GObject.ObjectG;
import Gdk.Types;
import Gdk.c.functions;
import Gdk.c.types;
import Gid.gid;
import Gio.File;
import Gio.FileT;

/**
 * An opaque type representing a list of files.
 */
class FileList : Boxed
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
    return gdk_file_list_get_type();
  }

  override @property GType gType()
  {
    return getType();
  }

  /**
   * Creates a new `GdkFileList` for the given array of files.
   * This function is meant to be used by language bindings.
   * Params:
   *   files = the files to add to the list
   * Returns: the newly create files list
   */
  static FileList newFromArray(File[] files)
  {
    GdkFileList* _cretval;
    size_t _nFiles;
    if (files)
      _nFiles = cast(size_t)files.length;

    GFile*[] _tmpfiles;
    foreach (obj; files)
      _tmpfiles ~= obj ? cast(GFile*)(cast(ObjectG)obj).cPtr : null;
    GFile** _files = _tmpfiles.ptr;
    _cretval = gdk_file_list_new_from_array(_files, _nFiles);
    auto _retval = _cretval ? new FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Creates a new files list container from a singly linked list of
   * `GFile` instances.
   * This function is meant to be used by language bindings
   * Params:
   *   files = a list of files
   * Returns: the newly created files list
   */
  static FileList newFromList(File[] files)
  {
    GdkFileList* _cretval;
    auto _files = gSListFromD!(File)(files);
    scope(exit) containerFree!(GSList*, File, GidOwnership.None)(_files);
    _cretval = gdk_file_list_new_from_list(_files);
    auto _retval = _cretval ? new FileList(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
   * Retrieves the list of files inside a `GdkFileList`.
   * This function is meant for language bindings.
   * Returns: the files inside the list
   */
  File[] getFiles()
  {
    GSList* _cretval;
    _cretval = gdk_file_list_get_files(cast(GdkFileList*)cPtr);
    auto _retval = gSListToD!(File, GidOwnership.Container)(cast(GSList*)_cretval);
    return _retval;
  }
}
