module Stratosphere.Helpers
       ( maybeField
       , prefixNamer
       , prefixFieldRules
       ) where

import Control.Lens (set)
import Control.Lens.TH
import Data.Aeson
import Data.Char (isUpper, toLower)
import Data.List (stripPrefix)
import Data.Maybe (maybeToList)
import qualified Data.Text as T
import Language.Haskell.TH


maybeField :: ToJSON a => T.Text -> Maybe a -> Maybe (T.Text, Value)
maybeField field = fmap ((field .=) . toJSON)


-- | Similar to `camelCaseNamer`, except we specify the prefix exactly. We use
-- this because camelCaseNamer is terrible with names that start in all caps,
-- like EC2. We would like to start the field names with "ec2...", but
-- camelCaseNamer wants "eC2...".
prefixNamer :: String -> Name -> [Name] -> Name -> [DefName]
prefixNamer prefix _ _ field = maybeToList $
  do
    fieldPart <- stripPrefix prefix (nameBase field)
    method    <- computeMethod fieldPart
    let cls = "Has" ++ fieldPart
    return (MethodName (mkName cls) (mkName method))
    where computeMethod (x:xs) | isUpper x = Just (toLower x : xs)
          computeMethod _                  = Nothing

-- | See `prefixNamer`
prefixFieldRules :: String -> LensRules
prefixFieldRules prefix = set lensField (prefixNamer prefix) defaultFieldRules