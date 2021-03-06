CmdLineOptions = BaseTask:new()

function CmdLineOptions:execute(myTable)
   local masterTbl     = masterTbl()

   local usage         = "Usage: wrapperDiff [options] gold.file trial.file"

   local Optiks        = require("Optiks")
   local cmdlineParser = Optiks:new{usage=usage, error = Error}


   cmdlineParser:add_option{ 
      name   = {'-r', '--resultfile'},
      dest   = 'resultFn',
      action = 'store'
   }

   cmdlineParser:add_option{ 
      name   = {'--csv'},
      dest   = 'csvFn',
      action = 'store'
   }

   cmdlineParser:add_option{
      name   = {'-v','--verbose'},
      dest   = 'verbosityLevel',
      action = 'count',
      help   = 'Increasing the level of verbosity help output',
   }

   local optionTbl, pargs = cmdlineParser:parse(arg)

   for v in pairs(optionTbl) do
      masterTbl[v] = optionTbl[v]
   end
   masterTbl.pargs = pargs
end
