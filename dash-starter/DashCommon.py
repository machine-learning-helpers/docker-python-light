
import os, sys, getopt

def usage (script_name, usage_doc):
  """Display the usage for that program."""
  print ("")
  print ("Usage: %s [options]" % script_name)
  print ("")
  print (usage_doc)
  print ("")
  print ("Options:")
  print ("  -h, --help      : outputs this help and exits")
  print ("  -v, --verbose   : verbose output (debugging)")
  print ("  -p, --port      : port for the Flask server with Dash application")
  print ("                    8050 is the default port")
  print ("")

def handle_opt (usage_doc):
  """Handle the command-line options."""
  try:
    opts, args = getopt.getopt (sys.argv[1:], "hvp:", ["help", "verbose", "port"])
  except (getopt.GetoptError, err):
    # Print help information and exit. It will print something like
    # "option -a not recognized"
    print (str (err))
    usage (sys.argv[0], usage_doc)
    sys.exit(2)

  # Options
  verboseFlag = False
  dashPort = 8050
  for o, a in opts:
    if o in ("-h", "--help"):
      usage (sys.argv[0], usage_doc)
      sys.exit()
    elif o in ("-v", "--verbose"):
      verboseFlag = True
    elif o in ("-p", "--port"):
      dashPort = a
    else:
      assert False, "Unhandled option"
  return (verboseFlag, dashPort)

