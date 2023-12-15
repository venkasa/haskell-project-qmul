module Fetch (fetchJSON) where

import Network.HTTP.Simple
import qualified Data.ByteString.Lazy.Char8 as T


fetchJSON :: String -> IO T.ByteString
fetchJSON = fetchEndpoint

fetchEndpoint :: String -> IO T.ByteString
fetchEndpoint endpoint = do
  let apiUrl = "https://www.dnd5eapi.co/api/" ++ endpoint
  request <- parseRequest apiUrl
  response <- httpLBS request
  return $ getResponseBody response
