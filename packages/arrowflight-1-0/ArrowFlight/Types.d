module ArrowFlight.Types;

import ArrowFlight.c.functions;
import ArrowFlight.c.types;
import Gid.gid;


// Structs
alias ServableInterface = GAFlightServableInterface*;

// Callbacks
alias HeaderFunc = void delegate(string name, string value);

/**
 * The major version.
 */
enum VERSION_MAJOR = 19;


/**
 * The micro version.
 */
enum VERSION_MICRO = 0;


/**
 * The minor version.
 */
enum VERSION_MINOR = 0;


/**
 * The version tag. Normally, it's an empty string. It's "SNAPSHOT"
 * for snapshot version.
 */
enum VERSION_TAG = "";

