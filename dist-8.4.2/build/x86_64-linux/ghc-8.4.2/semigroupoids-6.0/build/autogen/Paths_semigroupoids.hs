{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_semigroupoids (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [6,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/dcartwright/.cabal/bin"
libdir     = "/home/dcartwright/.cabal/lib/x86_64-linux-ghc-8.4.2/semigroupoids-6.0-inplace"
dynlibdir  = "/home/dcartwright/.cabal/lib/x86_64-linux-ghc-8.4.2"
datadir    = "/home/dcartwright/.cabal/share/x86_64-linux-ghc-8.4.2/semigroupoids-6.0"
libexecdir = "/home/dcartwright/.cabal/libexec/x86_64-linux-ghc-8.4.2/semigroupoids-6.0"
sysconfdir = "/home/dcartwright/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "semigroupoids_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "semigroupoids_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "semigroupoids_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "semigroupoids_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "semigroupoids_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "semigroupoids_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
