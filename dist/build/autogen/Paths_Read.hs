module Paths_Read (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/vasiliy/.cabal/bin"
libdir     = "/home/vasiliy/.cabal/lib/x86_64-linux-ghc-7.10.3/Read-0.1.0.0-G1X6VAIgcmfLk9YIkHxNnk"
datadir    = "/home/vasiliy/.cabal/share/x86_64-linux-ghc-7.10.3/Read-0.1.0.0"
libexecdir = "/home/vasiliy/.cabal/libexec"
sysconfdir = "/home/vasiliy/.cabal/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "Read_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "Read_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "Read_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "Read_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "Read_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
