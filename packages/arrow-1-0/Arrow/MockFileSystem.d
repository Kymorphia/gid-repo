module Arrow.MockFileSystem;

import Arrow.FileSystem;
import Arrow.Types;
import Arrow.c.functions;
import Arrow.c.types;
import Gid.gid;

class MockFileSystem : FileSystem
{

  this(void* ptr, Flag!"Take" take = No.Take)
  {
    super(cast(void*)ptr, take);
  }

  static GType getType()
  {
    import Gid.loader : gidSymbolNotFound;
    return cast(void function())garrow_mock_file_system_get_type != &gidSymbolNotFound ? garrow_mock_file_system_get_type() : cast(GType)0;
  }

  override @property GType gType()
  {
    return getType();
  }
}
